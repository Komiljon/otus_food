import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

import '../db/db_reciep_model.dart';
import '../db/hive_service.dart';

FlutterNetworkConnectivity flutterNetworkConnectivity = FlutterNetworkConnectivity(
  isContinousLookUp: true, // optional, false if you cont want continous lookup
  lookUpDuration: const Duration(seconds: 5), // optional, to override default lookup duration
  lookUpUrl: 'google.com', // optional, to override default lookup url
);

class FoodsList {
  List<Foods> foods;
  FoodsList({required this.foods});

  factory FoodsList.fromJson(Map<String, dynamic> json) {
    var foodsJson = json['foods'] as List;

    List<Foods> foodsList = foodsJson.map((i) => Foods.fromJson(i)).toList();

    return FoodsList(
      foods: foodsList,
    );
  }
}

class Foods {
  int? id;
  String? name;
  int? duration;
  String? photo;

  Foods({this.id, this.name, this.duration, this.photo});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['photo'] = photo;
    return data;
  }
}

Future<FoodsList> getFoodsList() async {
  var url = 'https://foodapi.dzolotov.tech/recipe';

  bool isNetworkConnectedOnCall = await flutterNetworkConnectivity.isInternetConnectionAvailable();
  if (!isNetworkConnectedOnCall) {
    var dbRes = HiveReciepService.getRecietData();
    if (dbRes.isNotEmpty) {
      return FoodsList.fromJson(json.decode(dbRes[0].data.toString()));
    }
  }

  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    var res = '{"foods": ${response.body}}';
    HiveReciepService.addRecieptData(DbRecieptModel(id: 0, data: res));
    return FoodsList.fromJson(json.decode(res));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    var dbRes = HiveReciepService.getRecietData();
    if (dbRes.isNotEmpty) {
      return FoodsList.fromJson(json.decode(dbRes[0].data.toString()));
    }
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }

  //   const response =
  //       '{"foods": [{"id": 0,"name": "Лосось в соусе терияки","duration": "45 минут","photo": "assets/images/f1.png"},{"id": 1,"name": "Поке боул с сыром тофу","duration": "30 минут","photo": "assets/images/f2.png"},{"id": 2,"name": "Стейк из говядины по-грузински с кукурузой","duration": "1 час 45 минут","photo": "assets/images/f3.png"},{"id": 3,"name": "Тосты с голубикой и бананом","duration": "45 минут","photo": "assets/images/f4.png"},{"id": 4,"name": "Паста с морепродуктами","duration": "25 минут","photo": "assets/images/f5.png"},{"id": 5,"name": "Бургер с двумя котлетами","duration": "1 час","photo": "assets/images/f6.png"},{"id": 5,"name": "Бургер с двумя котлетами","duration": "1 час","photo": "assets/images/f6.png"},{"id": 6,"name": "Пицца Маргарита домашняя","duration": "25 минут","photo": "assets/images/f7.png"}]}';
}

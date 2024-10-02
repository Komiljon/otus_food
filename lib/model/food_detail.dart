import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodDetailModel {
  int? id;
  String? name;
  int? duration;
  String? photo;

  FoodDetailModel({this.id, this.name, this.duration, this.photo});

  FoodDetailModel.fromJson(Map<String, dynamic> json) {
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

Future<FoodDetailModel> getFoodData(int elementId) async {

  var url = 'https://foodapi.dzolotov.tech/recipe/$elementId';
  
  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    return FoodDetailModel.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }
}
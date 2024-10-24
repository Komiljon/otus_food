import 'dart:convert';
import 'package:http/http.dart' as http;

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
  
  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    var res = '{"foods": ${response.body}}';
    return FoodsList.fromJson(json.decode(res));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }
}

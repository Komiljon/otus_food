import 'dart:convert';
import 'package:http/http.dart' as http;

class OneIngredientModel {
  int? id;
  String? name;
  double? caloriesForUnit;
  MeasureUnit? measureUnit;

  OneIngredientModel({this.id, this.name, this.caloriesForUnit, this.measureUnit});

  OneIngredientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caloriesForUnit = json['caloriesForUnit'];
    measureUnit = json['measureUnit'] != null
        ? MeasureUnit.fromJson(json['measureUnit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['caloriesForUnit'] = caloriesForUnit;
    if (measureUnit != null) {
      data['measureUnit'] = measureUnit!.toJson();
    }
    return data;
  }
}

class MeasureUnit {
  int? id;

  MeasureUnit({this.id});

  MeasureUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

Future<OneIngredientModel> getOneIngridient(int id) async {
  var url = 'https://foodapi.dzolotov.tech/ingredient/$id';

  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    return OneIngredientModel.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }
}

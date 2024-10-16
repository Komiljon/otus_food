import 'dart:convert';

class IngredientModel {
  List<Ingredient>? ingredients;

  IngredientModel({this.ingredients});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = <Ingredient>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredient {
  int? id;
  String? name;
  String? count;

  Ingredient({this.id, this.name, this.count});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count'] = count;
    return data;
  }
}

Future<IngredientModel> getIngridientList(int elementId) async {
  const response =
      '{"ingredients":[{"id":0,"name":"Соевый соус","count":"8 ст. ложек"},{"id":1,"name":"Вода","count":"8 ст. ложек"},{"id":2,"name":"Мёд","count":"3 ст. ложек"},{"id":3,"name":"Коричневый сахар","count":"2 ст. ложек"},{"id":4,"name":"Чеснок","count":"3 зубчика"},{"id":5,"name":"Тёртый свежий имбирь","count":"1 ст. ложек"},{"id":6,"name":"Лимонный сок","count":"1¹⁄₂ ст. ложки"},{"id":7,"name":"Кукурузный крахмал","count":"1 ст. ложек"},{"id":8,"name":"Растительное масло","count":"1 ч. ложка"},{"id":9,"name":"Филе лосося или сёмги","count":"680 г"},{"id":10,"name":"Кунжут","count":"по вкусу"}]}';
  
  return IngredientModel.fromJson(json.decode(response));
}
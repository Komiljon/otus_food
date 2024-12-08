import 'dart:convert';
import 'package:http/http.dart' as http;

class IngredientModel {
  List<Ingredients>? ingredients;

  IngredientModel({this.ingredients});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
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

class Ingredients {
  int? id;
  int? count;
  Ingredient? ingredient;
  Ingredient? recipe;

  Ingredients({this.id, this.count, this.ingredient, this.recipe});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    ingredient = json['ingredient'] != null ? Ingredient.fromJson(json['ingredient']) : null;
    recipe = json['recipe'] != null ? Ingredient.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    if (ingredient != null) {
      data['ingredient'] = ingredient!.toJson();
    }
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    return data;
  }
}

class Ingredient {
  int? id;

  Ingredient({this.id});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

Future<IngredientModel> getIngridientList() async {
  var url = 'https://foodapi.dzolotov.tech/recipe_ingredient';

  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    return IngredientModel.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }
  // const response =
  //     '{"ingredients":[{"id":0,"name":"Соевый соус","count":"8 ст. ложек"},{"id":1,"name":"Вода","count":"8 ст. ложек"},{"id":2,"name":"Мёд","count":"3 ст. ложек"},{"id":3,"name":"Коричневый сахар","count":"2 ст. ложек"},{"id":4,"name":"Чеснок","count":"3 зубчика"},{"id":5,"name":"Тёртый свежий имбирь","count":"1 ст. ложек"},{"id":6,"name":"Лимонный сок","count":"1¹⁄₂ ст. ложки"},{"id":7,"name":"Кукурузный крахмал","count":"1 ст. ложек"},{"id":8,"name":"Растительное масло","count":"1 ч. ложка"},{"id":9,"name":"Филе лосося или сёмги","count":"680 г"},{"id":10,"name":"Кунжут","count":"по вкусу"}]}';

  //return IngredientModel.fromJson(json.decode(response));
}

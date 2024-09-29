import 'dart:convert';

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
  String? duration;
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
  const response =
      '{"foods": [{"id": 0,"name": "Лосось в соусе терияки","duration": "45 минут","photo": "assets/images/f1.png"},{"id": 1,"name": "Поке боул с сыром тофу","duration": "30 минут","photo": "assets/images/f2.png"},{"id": 2,"name": "Стейк из говядины по-грузински с кукурузой","duration": "1 час 45 минут","photo": "assets/images/f3.png"},{"id": 3,"name": "Тосты с голубикой и бананом","duration": "45 минут","photo": "assets/images/f4.png"},{"id": 4,"name": "Паста с морепродуктами","duration": "25 минут","photo": "assets/images/f5.png"},{"id": 5,"name": "Бургер с двумя котлетами","duration": "1 час","photo": "assets/images/f6.png"},{"id": 5,"name": "Бургер с двумя котлетами","duration": "1 час","photo": "assets/images/f6.png"},{"id": 6,"name": "Пицца Маргарита домашняя","duration": "25 минут","photo": "assets/images/f7.png"}]}';

  return FoodsList.fromJson(json.decode(response));
}

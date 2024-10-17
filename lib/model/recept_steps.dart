import 'dart:convert';

class StepsModel {
  List<Receptsteps>? receptsteps;

  StepsModel({this.receptsteps});

  StepsModel.fromJson(Map<String, dynamic> json) {
    if (json['receptsteps'] != null) {
      receptsteps = <Receptsteps>[];
      json['receptsteps'].forEach((v) {
        receptsteps!.add(Receptsteps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (receptsteps != null) {
      data['receptsteps'] = receptsteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Receptsteps {
  int? num;
  String? ingText;
  String? ingTime;

  Receptsteps({this.num, this.ingText, this.ingTime});

  Receptsteps.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    ingText = json['ingText'];
    ingTime = json['ingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['ingText'] = ingText;
    data['ingTime'] = ingTime;
    return data;
  }
}

Future<StepsModel> getReceptSteps(int elementId) async {
  const response =
      '{"receptsteps":[{"num":1,"ingText":"В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.","ingTime":"06:00"},{"num":2,"ingText":"Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.","ingTime":"07:00"},{"num":3,"ingText":"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.","ingTime":"06:00"},{"num":4,"ingText":"Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.","ingTime":"01:00"},{"num":5,"ingText":"Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.","ingTime":"06:00"},{"num":6,"ingText":"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.","ingTime":"15:00"},{"num":7,"ingText":"Перед подачей полейте соусом из формы и посыпьте кунжутом.","ingTime":"06:00"}]}';
  
  return StepsModel.fromJson(json.decode(response));
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class MeasureModel {
  List<Measures>? measures;

  MeasureModel({this.measures});

  MeasureModel.fromJson(Map<String, dynamic> json) {
    if (json['measures'] != null) {
      measures = <Measures>[];
      json['measures'].forEach((v) {
        measures!.add(Measures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (measures != null) {
      data['measures'] = measures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Measures {
  int? id;
  String? one;
  String? few;
  String? many;

  Measures({this.id, this.one, this.few, this.many});

  Measures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    one = json['one'];
    few = json['few'];
    many = json['many'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['one'] = one;
    data['few'] = few;
    data['many'] = many;
    return data;
  }
}


Future<MeasureModel> getMeasureData() async {
  var url = 'https://foodapi.dzolotov.tech/measure_unit';

  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  if (response.statusCode == 200) {
    var res = '{"measures": ${response.body}}';
    return MeasureModel.fromJson(json.decode(res));
  }
  if (response.statusCode == 400) {
    throw Exception('Нет доступных рецептов в этом разделе.');
  } else {
    throw Exception('Нет соеденения с сервером: ${response.reasonPhrase}');
  }
}
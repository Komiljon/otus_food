class Ingredientdb {
  int? id;
  late String name;
  late String count;

  Ingredientdb(this.id, this.name, this.count);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['count'] = count;
    return map;
  }

  Ingredientdb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    count = map['count'];
  }
}
import 'package:hive/hive.dart';

part 'db_model.g.dart';

@HiveType(typeId: 0)
class DbModel {
  DbModel({required this.id, required this.quantity});

  @HiveField(0)
  int id;

  @HiveField(1)
  int quantity;
}

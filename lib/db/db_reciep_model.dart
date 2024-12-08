import 'package:hive/hive.dart';

part 'db_reciep_model.g.dart';

@HiveType(typeId: 1)
class DbRecieptModel {
  DbRecieptModel({required this.id, required this.data});

  @HiveField(0)
  int id;

  @HiveField(1)
  String data;
}

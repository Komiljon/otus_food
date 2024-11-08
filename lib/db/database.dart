import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite/sqlite_api.dart';
import '../model/ingredients_dm_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static late Database _database;

  String ingredientsTable = 'Ingredientdbs';
  String columnId = 'id';
  String columnName = 'name';
  String columnCount = 'count';

  Future<Database> get database async {
    //if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}Ingredientdb.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Ingredientdb
  // Id | Name | Count
  // 0    ..
  // 1    ..

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $ingredientsTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT, $columnCount TEXT)',
    );
  }

  // READ
  Future<List<Ingredientdb>> getIngredientdbs() async {
    Database db = await database;
    final List<Map<String, dynamic>> ingredientsMapList =
        await db.query(ingredientsTable);
    final List<Ingredientdb> ingredientsList = [];
    for (var ingredientMap in ingredientsMapList) {
      ingredientsList.add(Ingredientdb.fromMap(ingredientMap));
    }

    return ingredientsList;
  }

  // INSERT
  Future<Ingredientdb> insertIngredientdb(Ingredientdb ingredient) async {
    Database db = await database;
    ingredient.id = await db.insert(ingredientsTable, ingredient.toMap());
    return ingredient;
  }

  // UPDATE
  Future<int> updateIngredientdb(Ingredientdb ingredient) async {
    Database db = await database;
    return await db.update(
      ingredientsTable,
      ingredient.toMap(),
      where: '$columnId = ?',
      whereArgs: [ingredient.id],
    );
  }

  // DELETE
  Future<int> deleteIngredientdb(int? id) async {
    Database db = await database;
    return await db.delete(
      ingredientsTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite/sqlite_api.dart';
import '../model/comments_db_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static late Database _database;

  String commentsTable = 'Commentdbs';
  String columnId = 'id';
  String columnCommentId = 'commentid';
  String columnName = 'name';
  String columnCommentText = 'comment';
  String columnImageSrc = 'imgsrc';

  Future<Database> get database async {
    //if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}Commentdb.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Commentdb
  // Id | Name | Count
  // 0    ..
  // 1    ..

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $commentsTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnCommentId INTEGER, $columnName TEXT, $columnCommentText TEXT, $columnImageSrc TEXT)',
    );
  }

  // READ
  Future<List<Comment>> getCommentdb() async {
    Database db = await database;
    final List<Map<String, dynamic>> commentsMapList = await db.query(commentsTable);
    final List<Comment> commentsList = [];
    for (var commentMap in commentsMapList) {
      commentsList.add(Comment.fromMap(commentMap));
    }

    return commentsList;
  }

  // INSERT
  Future<Comment> insertCommentdb(Comment comment) async {
    Database db = await database;
    comment.id = await db.insert(commentsTable, comment.toMap());
    return comment;
  }

  // UPDATE
  Future<int> updateCommentdb(Comment comment) async {
    Database db = await database;
    return await db.update(
      commentsTable,
      comment.toMap(),
      where: '$columnId = ?',
      whereArgs: [comment.id],
    );
  }

  // DELETE
  Future<int> deleteCommentdb(int? id) async {
    Database db = await database;
    return await db.delete(
      commentsTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

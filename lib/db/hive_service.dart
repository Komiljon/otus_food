import 'package:hive/hive.dart';
import 'db_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'db_reciep_model.dart';

// База для избранных
class HiveService {
  static initHive() async {
    final applicationDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(DbFavoriteModelAdapter());
    await Hive.openBox<DbFavoriteModel>('favprod'); // Favorite products
  }

  // Favorite Products
  static void addFavProduct(DbFavoriteModel product) {
    Hive.box<DbFavoriteModel>('favprod').add(product);
  }

  static List<DbFavoriteModel> getAllFavProducts() {
    final result = Hive.box<DbFavoriteModel>('favprod').values.toList();
    return result;
  }

  static void putFavProduct(int index, DbFavoriteModel product) {
    Hive.box<DbFavoriteModel>('favprod').putAt(index, product);
  }

  static void deleteFavProduct(int index) {
    Hive.box<DbFavoriteModel>('favprod').deleteAt(index);
  }

  static void deleteAllFavProducts() {
    Hive.box<DbFavoriteModel>('favprod').clear();
  }
}

// База для избранных
class HiveReciepService {
  static initHive() async {
    final applicationDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(DbRecieptModelAdapter());
    await Hive.openBox<DbRecieptModel>('recieptdata'); // Favorite products
  }

  // Reciept Data
  static void addRecieptData(DbRecieptModel jsondata) {
    Hive.box<DbRecieptModel>('recieptdata').clear();
    Hive.box<DbRecieptModel>('recieptdata').add(jsondata);
  }

  static List<DbRecieptModel> getRecietData() {
    final result = Hive.box<DbRecieptModel>('recieptdata').values.toList();
    return result;
  }
}

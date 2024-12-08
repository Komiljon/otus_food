import 'package:hive/hive.dart';
import 'db_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// База для избранных
class HiveService {
  static initHive() async {
    final applicationDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(DbModelAdapter());
    await Hive.openBox<DbModel>('favprod'); // Favorite products
  }

  // Favorite Products
  static void addFavProduct(DbModel product) {
    Hive.box<DbModel>('favprod').add(product);
  }

  static List<DbModel> getAllFavProducts() {
    final result = Hive.box<DbModel>('favprod').values.toList();
    return result;
  }

  static void putFavProduct(int index, DbModel product) {
    Hive.box<DbModel>('favprod').putAt(index, product);
  }

  static void deleteFavProduct(int index) {
    Hive.box<DbModel>('favprod').deleteAt(index);
  }

  static void deleteAllFavProducts() {
    Hive.box<DbModel>('favprod').clear();
  }
}

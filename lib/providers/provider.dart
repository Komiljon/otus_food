import 'package:flutter/material.dart';

import '../db/db_model.dart';
import '../db/hive_service.dart';

class FavProdProvider extends ChangeNotifier {
  // Favorite products
  int favProdCount = 0;
  Map<int, int> favProdElems = {};
  List<DbModel> listFavProduct = <DbModel>[];

  void getFavoriteProdcount() {
    listFavProduct = HiveService.getAllFavProducts();
    if (listFavProduct.isNotEmpty) {
      for (var element in listFavProduct) {
        favProdElems[element.id] = element.quantity;
      }
    } else {
      favProdElems.clear();
    }
    favProdCount = listFavProduct.length;
    notifyListeners();
  }

  void addToFavoriteProd(int id, [int q = 1]) {
    if (q > 0) {
      HiveService.addFavProduct(DbModel(id: id, quantity: q));
    }
    getFavoriteProdcount();
  }

  void deleteFavoriteProduct(int id) {
    listFavProduct = HiveService.getAllFavProducts();
    if (listFavProduct.isNotEmpty) {
      int index = 0;
      for (var element in listFavProduct) {
        if (element.id == id) {
          HiveService.deleteFavProduct(index);
        }
        index++;
      }
    }
    getFavoriteProdcount();
  }

  void clearFavProd() {
    HiveService.deleteAllFavProducts();
    getFavoriteProdcount();
  }
}

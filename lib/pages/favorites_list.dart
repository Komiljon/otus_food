import 'package:flutter/material.dart';

import '../db/db_model.dart';
import '../db/hive_service.dart';
import '../model/food_list.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/foodlist_cards.dart';

class FavoriteFoodeListScreen extends StatefulWidget {
  const FavoriteFoodeListScreen({super.key});

  @override
  State<FavoriteFoodeListScreen> createState() => _FavoriteFoodeListScreenState();
}

class _FavoriteFoodeListScreenState extends State<FavoriteFoodeListScreen> {
  final bool showList = true;
  late Future<FoodsList> foodsLists;
  bool favorite = false;

  checkFavoriteProduct(int id) {
    List<DbFavoriteModel> listFavProduct = <DbFavoriteModel>[];

    listFavProduct = HiveService.getAllFavProducts();
    if (listFavProduct.isNotEmpty) {
      for (var element in listFavProduct) {
        if (element.id == id) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    foodsLists = getFoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<FoodsList>(
          future: foodsLists,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: favorite ? 16 : 0,
                ),
                itemBuilder: (context, index) {
                  favorite = checkFavoriteProduct(snapshot.data?.foods[index].id ?? 0);
                  if (favorite) {
                    return FoodCard(
                      id: snapshot.data?.foods[index].id ?? 0,
                      cardText: snapshot.data?.foods[index].name ?? 'нет названиия',
                      cardImage: snapshot.data?.foods[index].photo ?? '',
                      time: snapshot.data?.foods[index].duration.toString() ?? '0',
                      fovorite: true,
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data!.foods.length,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 2, selected: true),
    );
  }
}

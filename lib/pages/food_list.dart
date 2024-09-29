import 'package:flutter/material.dart';

import '../model/food_list.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/foodlist_cards.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final bool showList = true;

  late Future<FoodsList> foodsLists;

  @override
  void initState() {
    super.initState();
    foodsLists = getFoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otus Food'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<FoodsList>(
          future: foodsLists,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => FoodCards(
                  cardText: snapshot.data?.foods[index].name ?? 'нет названиия',
                  cardUrl: '',
                  cardImage: snapshot.data?.foods[index].photo ?? '',
                  time: snapshot.data?.foods[index].duration ?? '',
                ),
                itemCount: snapshot.data!.foods.length,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}

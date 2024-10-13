import 'package:flutter/material.dart';

import '../model/food_list.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/foodlist_cards.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
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
                itemBuilder: (context, index) => FoodCard(
                  id: snapshot.data?.foods[index].id ?? 0,
                  cardText: snapshot.data?.foods[index].name ?? 'нет названиия',
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        elevation: 0,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/addnewrecept', (route) => true);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}

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
          _dialogBuilder(context);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      final formKey = GlobalKey<FormState>();
      var textControllerIngrName = TextEditingController();
      var textControllerIngrCount = TextEditingController();
      return AlertDialog(
        title: const Text('Ингредиент'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    labelText: 'Название ингредиента',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(236, 236, 236, 1),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    isDense: true,
                  ),
                  controller: textControllerIngrName,
                  onSaved: (value) {
                    textControllerIngrName.text = value ?? '';
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Количество',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
                borderRadius: BorderRadius.circular(0.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(236, 236, 236, 1),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              isDense: true,
            ),
            controller: textControllerIngrCount,
            onSaved: (value) {
              textControllerIngrCount.text = value ?? '';
            },
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  minimumSize: const Size(130, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  backgroundColor: const Color.fromRGBO(46, 204, 113, 1)),
              child: const Text(
                'Добавить',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}

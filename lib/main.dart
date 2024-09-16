import 'package:flutter/material.dart';
import 'widgets/foodlist_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(236, 236, 236, 1)), useMaterial3: true, fontFamily: 'Roboto'),
      home: FoodList(),
    );
  }
}

class FoodList extends StatelessWidget {
  FoodList({super.key});

  final List foodListData = [
    <String, String>{
      'cardText': 'Лосось в соусе терияки',
      'cardUrl': '',
      'cardImage': 'assets/images/f1.png',
      'time': '45 минут',
    },
    <String, String>{
      'cardText': 'Поке боул с сыром тофу',
      'cardUrl': '',
      'cardImage': 'assets/images/f2.png',
      'time': '30 минут',
    },
    <String, String>{
      'cardText': 'Стейк из говядины по-грузински с кукурузой',
      'cardUrl': '',
      'cardImage': 'assets/images/f3.png',
      'time': '1 час 45 минут',
    },
    <String, String>{
      'cardText': 'Тосты с голубикой и бананом',
      'cardUrl': '',
      'cardImage': 'assets/images/f4.png',
      'time': '45 мину',
    },
    <String, String>{
      'cardText': 'Паста с морепродуктами',
      'cardUrl': '',
      'cardImage': 'assets/images/f5.png',
      'time': '25 минут',
    },
    <String, String>{
      'cardText': 'Бургер с двумя котлетами',
      'cardUrl': '',
      'cardImage': 'assets/images/f6.png',
      'time': '1 час',
    },
    <String, String>{
      'cardText': 'Пицца Маргарита домашняя',
      'cardUrl': '',
      'cardImage': 'assets/images/f7.png',
      'time': '25 минут',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otus Food'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemBuilder: (context, index) => FoodCards(
            cardText: foodListData[index]['cardText'],
            cardUrl: foodListData[index]['cardUrl'],
            cardImage: foodListData[index]['cardImage'],
            time: foodListData[index]['time'],
          ),
          itemCount: foodListData.length,
        ),
      )),
    );
  }
}

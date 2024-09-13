import 'package:flutter/material.dart';
import 'widgets/foodListCards.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Roboto'
      ),
      home: const FoodList(),
    );
  }
}

class FoodList extends StatelessWidget {  
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
        title: const Text('Otus Food'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children:const [
            FoodCards(
              cardText: 'Лосось в соусе терияки',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f1.png',
              time: '45 минут',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Поке боул с сыром тофу',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f2.png',
              time: '30 минут',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Стейк из говядины по-грузински с кукурузой',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f3.png',
              time: '1 час 45 минут',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Тосты с голубикой и бананом',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f4.png',
              time: '45 минут',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Паста с морепродуктами',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f5.png',
              time: '25 минут',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Бургер с двумя котлетами',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f6.png',
              time: '1 час',
            ),
            SizedBox(height: 16,),
            FoodCards(
              cardText: 'Пицца Маргарита домашняя',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f7.png',
              time: '25 минут',
            ),
            SizedBox(height: 32,),
          ],
        ),
      ),

    );
  }
}
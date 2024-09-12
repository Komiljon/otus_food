import 'package:flutter/material.dart';
import 'package:otusfood/widgets/foodListCards.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Otus Food'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
            ),
            FoodCards(
              cardText: 'Поке боул с сыром тофу',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f2.png',
            ),
            FoodCards(
              cardText: 'Стейк из говядины по-грузински с кукурузой',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f3.png',
            ),

            FoodCards(
              cardText: 'Тосты с голубикой и бананом',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f4.png',
            ),

            FoodCards(
              cardText: 'Паста с морепродуктами',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f5.png',
            ),

            FoodCards(
              cardText: 'Бургер с двумя котлетами',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f6.png',
            ),

            FoodCards(
              cardText: 'Пицца Маргарита домашняя',
              cardUrl: '',
              horTitleGap: 16.0,
              cardImage: 'assets/images/f7.png',
            ),
          ],
        ),
      ),

    );
  }
}

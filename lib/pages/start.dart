import 'dart:async';

import 'package:flutter/material.dart';

import '../model/faderouter.dart';
import 'food_list.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2000), () {
      
      Navigator.pop(context);
      Navigator.push(
       context,
       FadeRoute(page: const FoodListScreen()), // Используем FadeRoute здесь
      );
      //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/zz.png'),
    );
  }
}

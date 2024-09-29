import 'dart:async';

import 'package:flutter/material.dart';

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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const FoodList(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/zz.png'),
    );
  }
}

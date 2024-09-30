import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otus Food'),
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/d1.png'),
            ),
          ],
        ),
      )),
      
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}
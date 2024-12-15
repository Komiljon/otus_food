import 'dart:math';

import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../model/faderouter.dart';
import '../pages/auth.dart';
import '../pages/favorites_list.dart';
import '../pages/food_list.dart';

class AkaBottomNavigationBar extends StatefulWidget {
  final int curIndexs;
  final bool selected;
  const AkaBottomNavigationBar({super.key, required this.curIndexs, required this.selected});

  @override
  State<AkaBottomNavigationBar> createState() => _AkaBottomNavigationBarState();
}

class _AkaBottomNavigationBarState extends State<AkaBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        Navigator.push(
          context,
          FadeRoute(page: const FoodListScreen()), // Используем FadeRoute здесь
        );
        //context.go('/home');
        //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
      case 1:
        Navigator.pop(context);
        Navigator.push(
          context,
          FadeRoute(page: const FoodListScreen()), // Используем FadeRoute здесь
        );
        //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => true);
        break;
      case 2:
        //Navigator.pop(context);
        Navigator.push(
          context,
          FadeRoute(page: const FavoriteFoodeListScreen()), // Используем FadeRoute здесь
        );
        //Navigator.pushNamedAndRemoveUntil(context, '/favorites', (route) => true);
        break;
      case 3:
        //Navigator.pop(context);
        Navigator.push(
          context,
          FadeRoute(page: const LoginRegister()), // Используем FadeRoute здесь
        );
        //Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => true);
        break;
      default:
        Navigator.pop(context);
        Navigator.push(
          context,
          FadeRoute(page: const FoodListScreen()), // Используем FadeRoute здесь
        );
        //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: widget.selected ? Colors.green : const Color.fromRGBO(194, 194, 194, 1),
        unselectedItemColor: const Color.fromRGBO(194, 194, 194, 1),
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        currentIndex: widget.curIndexs,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Transform.rotate(
                angle: 45 * pi / 180,
                child: const Icon(
                  Icons.local_pizza,
                  size: 24,
                ),
              ),
            ),
            label: S.of(context).recipe,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.kitchen,
                size: 24,
              ),
            ),
            label: S.of(context).holodilnik,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.favorite,
                size: 24,
              ),
            ),
            label: S.of(context).favorite,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.person,
                size: 24,
              ),
            ),
            label: S.of(context).login,
          ),
        ]);
  }
}

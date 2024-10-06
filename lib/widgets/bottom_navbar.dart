import 'dart:math';

import 'package:flutter/material.dart';

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
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => true);
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => true);
        break;
      case 3:
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => true);
        break;
      default:
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.kitchen,
                size: 24,
              ),
            ),
            label: 'Холодильниик',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.favorite,
                size: 24,
              ),
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Icon(
                Icons.person,
                size: 24,
              ),
            ),
            label: 'Вход',
          ),
        ]);
  }
}

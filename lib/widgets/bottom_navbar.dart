import 'package:flutter/material.dart';

class AkaBottomNavigationBar extends StatefulWidget {
  final int curIndexs;
  final bool selected;
  const AkaBottomNavigationBar({super.key, required this.curIndexs, required this.selected});

  @override
  State<AkaBottomNavigationBar> createState() => _AkaBottomNavigationBarState();
}

class _AkaBottomNavigationBarState extends State<AkaBottomNavigationBar> {
  int currentIndex = 0;
  bool selected = true;

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
        Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => true);
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
        selectedItemColor: selected ? Colors.green : Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Image(
                image: AssetImage('assets/icons/recepts.png'),
                width: 24,
                height: 24,
              ),
            ),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: const Image(
                image: AssetImage('assets/icons/profil.png'),
                width: 24,
                height: 24,
              ),
            ),
            label: 'Вход',
          ),
        ]);
  }
}

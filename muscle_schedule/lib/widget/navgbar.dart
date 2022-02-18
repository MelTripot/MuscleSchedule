import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();

  String Page = '';
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const Color bgrdColor = Colors.deepPurple;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: bgrdColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range),
          label: 'Calendar',
          backgroundColor: bgrdColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
          backgroundColor: bgrdColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: 'PR',
          backgroundColor: bgrdColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: bgrdColor,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

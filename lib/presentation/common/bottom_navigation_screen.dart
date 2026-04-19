import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentindex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    Placeholder(),
  ];

  void _onTap(int index){
    setState(() {
      _currentindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentindex],

       bottomNavigationBar: BottomNavigationBar(
           currentIndex:  _currentindex,
           onTap: _onTap,
           unselectedItemColor: Colors.grey,
           selectedItemColor: Colors.purple,
           items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shield_moon),
          label: "Azan Time",
        )
      ]),
    );
  }
}

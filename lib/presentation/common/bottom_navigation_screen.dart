import 'package:flutter/material.dart';
import 'package:quranapp/presentation/dua/dua_screen.dart';
import 'package:quranapp/presentation/namaj-types/namaj_types_screen.dart';
import 'package:quranapp/presentation/prayer-time/prayer_time_screen.dart';

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
    PrayerTimeScreen(),
    DuaScreen(),
    NamajTypesScreen(),
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
        ),

             BottomNavigationBarItem(
               icon: Icon(Icons.clean_hands_outlined),
               label: "Dua",
             ),

             BottomNavigationBarItem(
               icon: Icon(Icons.waves_sharp),
               label: "Types of Namaj",
             ),
      ]),
    );
  }
}

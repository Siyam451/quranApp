import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quranapp/presentation/common/bottom_navigation_screen.dart';

import 'package:quranapp/providers/dua_provider.dart';
import 'package:quranapp/providers/prayer_provider.dart';
import 'package:quranapp/providers/quran_ayat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuranAyatProvider()..getquranAyat(),
        ),

        ChangeNotifierProvider(create: (_)=> PrayerProvider()..fetchPrayerTimes()),

        ChangeNotifierProvider(
          create: (_) => DuaProvider()..fetchDua(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Poppins',
        ),
        home: const BottomNavigationScreen(),
      ),
    );
  }
}
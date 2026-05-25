import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quranapp/presentation/common/splash_screen.dart';
import 'package:quranapp/providers/audio_provider.dart';

import 'package:quranapp/providers/dua_provider.dart';
import 'package:quranapp/providers/mosque_provider.dart';
import 'package:quranapp/providers/prayer_provider.dart';
import 'package:quranapp/providers/qibla_provider.dart';
import 'package:quranapp/providers/quran_ayat_provider.dart';
import 'package:quranapp/providers/theme_provider.dart';

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

        ChangeNotifierProvider(
          create: (_) => AudioProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_)=>MosqueProvider(),
        ),
        
        ChangeNotifierProvider(create: (_) => QiblaProvider()..checkPermission(),

        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,themeprovider,_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeprovider.themeMode,

            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0, // prevents UI breaking
                ),
                child: child!,
              );
            },
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor:
              const Color(0xFF121212),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF1F1F1F),
                foregroundColor: Colors.white,
              ),
              cardColor:
              const Color(0xFF222222),
              fontFamily: 'Poppins',
            ),
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class TasbeehProvider extends ChangeNotifier {

  int count = 0;

  int target = 33;

  String currentDhikr = "SubhanAllah";

  List<String> dhikrs = [
    "SubhanAllah",
    "Alhamdulillah",
    "Allahu Akbar",
    "La ilaha illallah",
    "Astaghfirullah",
  ];

  TasbeehProvider() {
    loadCount();
  }

  Future<void> loadCount() async {

    final prefs =
    await SharedPreferences.getInstance();

    count =
        prefs.getInt("tasbeeh_count") ?? 0;

    currentDhikr =
        prefs.getString("current_dhikr") ??
            "SubhanAllah";

    notifyListeners();
  }

  Future<void> increment() async {

    count++;

    notifyListeners();

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setInt(
      "tasbeeh_count",
      count,
    );
  }

  Future<void> reset() async {

    count = 0;

    notifyListeners();

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(
      "tasbeeh_count",
    );
  }

  Future<void> changeDhikr(
      String dhikr) async {

    currentDhikr = dhikr;

    count = 0;

    notifyListeners();

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setString(
      "current_dhikr",
      dhikr,
    );
  }

  void changeTarget(int value) {

    target = value;

    notifyListeners();
  }
}
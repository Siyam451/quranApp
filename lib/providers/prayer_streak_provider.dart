import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerStreakProvider extends ChangeNotifier {
  final List<String> prayerNames = [
    "Fajr",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
  ];

  Map<String, bool> prayers = {
    "Fajr": false,
    "Dhuhr": false,
    "Asr": false,
    "Maghrib": false,
    "Isha": false,
  };

  int streak = 0;

  List<bool> weeklyProgress = [
    true,
    true,
    false,
    true,
    true,
    false,
    false,
  ];

  PrayerStreakProvider() {
    loadData();
  }

  int get completed =>
      prayers.values.where((e) => e).length;

  double get progress => completed / 5;

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    streak = prefs.getInt("streak") ?? 0;

    for (String prayer in prayerNames) {
      prayers[prayer] =
          prefs.getBool(prayer) ?? false;
    }

    notifyListeners();
  }

  Future<void> togglePrayer(
      String prayer,
      bool value,
      ) async {

    prayers[prayer] = value;

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setBool(
      prayer,
      value,
    );

    if (completed == 5) {
      streak++;

      await prefs.setInt(
        "streak",
        streak,
      );
    }

    notifyListeners();
  }

  Future<void> resetToday() async {

    final prefs =
    await SharedPreferences.getInstance();

    for (String prayer in prayerNames) {

      prayers[prayer] = false;

      await prefs.setBool(
        prayer,
        false,
      );
    }

    notifyListeners();
  }
}
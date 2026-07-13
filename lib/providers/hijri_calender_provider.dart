import 'package:flutter/material.dart';

import '../data/models/hijri_calender_model.dart';
import '../data/services/hijri_calender_services.dart';

class HijriCalendarProvider extends ChangeNotifier {

  final HijriCalendarService _service =
  HijriCalendarService();

  bool isLoading = false;

  String? error;

  List<HijriCalendarModel> days = [];

  HijriCalendarModel? selectedDay;

  late int currentMonth;

  late int currentYear;

  HijriCalendarProvider() {
    final now = DateTime.now();

    currentMonth = now.month;
    currentYear = now.year;

    loadCalendar();
  }

  Future<void> loadCalendar() async {

    try {

      isLoading = true;
      error = null;

      notifyListeners();

      days = await _service.getCalendar(
        currentMonth,
        currentYear,
      );

      if (days.isNotEmpty) {
        selectedDay = days.first;
      }

    } catch (e) {

      error = e.toString();

    }

    isLoading = false;

    notifyListeners();
  }

  void selectDay(HijriCalendarModel day) {

    selectedDay = day;

    notifyListeners();
  }

  Future<void> nextMonth() async {

    if (currentMonth == 12) {

      currentMonth = 1;
      currentYear++;

    } else {

      currentMonth++;
    }

    await loadCalendar();
  }

  Future<void> previousMonth() async {

    if (currentMonth == 1) {

      currentMonth = 12;
      currentYear--;

    } else {

      currentMonth--;
    }

    await loadCalendar();
  }

  String get currentHijriMonth {

    if (days.isEmpty) {
      return "";
    }

    return "${days.first.hijriMonth} ${days.first.hijriYear} AH";
  }
}
import 'package:flutter/material.dart';
import 'package:quranapp/data/models/prayer_time_model.dart';
import 'package:quranapp/data/services/api_caller.dart';

import '../../data/services/location_service.dart' as LocationService;

class PrayerProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  PrayerTimeModel? _prayerTime;
  PrayerTimeModel? get prayerTime => _prayerTime;


  Future<void> fetchPrayerTimes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final position = await LocationService.getLocation();

      final url =
          "https://api.aladhan.com/v1/timings?latitude=${position.latitude}&longitude=${position.longitude}&method=2";

      final response = await ApiCaller.getrequest(url: url);

      _prayerTime = PrayerTimeModel.fromJson(response.responseData);

    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  }

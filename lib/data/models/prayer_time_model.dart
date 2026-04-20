import 'package:quranapp/data/models/timing_model.dart';

import 'date_model.dart';

class PrayerTimeModel {
  final Timings timings;
  final DateModel date;

  PrayerTimeModel({
    required this.timings,
    required this.date,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      timings: Timings.fromJson(json['data']['timings']),
      date: DateModel.fromJson(json['data']['date']),
    );
  }
}
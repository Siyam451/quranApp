import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/hijri_calender_model.dart';

class HijriCalendarService {

  Future<List<HijriCalendarModel>>
  getCalendar(
      int month,
      int year) async {

    final url =

        "https://api.aladhan.com/v1/gToHCalendar/$month/$year";

    final response =

    await http.get(
      Uri.parse(url),
    );

    if (response.statusCode != 200) {

      throw Exception(
        "Unable to load calendar",
      );
    }

    final json =
    jsonDecode(response.body);

    final List list =
    json["data"];

    return list

        .map(
          (e) =>
          HijriCalendarModel.fromJson(e),
    )

        .toList();
  }
}
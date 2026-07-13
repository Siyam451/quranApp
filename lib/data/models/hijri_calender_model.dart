class HijriCalendarModel {
  final String hijriDay;
  final String hijriMonth;
  final String hijriYear;

  final String gregorianDate;
  final String weekday;

  HijriCalendarModel({
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
    required this.gregorianDate,
    required this.weekday,
  });

  factory HijriCalendarModel.fromJson(
      Map<String, dynamic> json) {

    return HijriCalendarModel(

      hijriDay:
      json["hijri"]["day"],

      hijriMonth:
      json["hijri"]["month"]["en"],

      hijriYear:
      json["hijri"]["year"],

      gregorianDate:
      json["gregorian"]["date"],

      weekday:
      json["gregorian"]["weekday"]["en"],
    );
  }
}
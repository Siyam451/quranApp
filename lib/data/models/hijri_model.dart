class HijriModel {

  final String hijriDate;
  final String month;
  final String weekday;
  final String gregorianDate;

  HijriModel({

    required this.hijriDate,
    required this.month,
    required this.weekday,
    required this.gregorianDate,
  });

  factory HijriModel.fromJson(Map<String,dynamic> json){

    return HijriModel(

      hijriDate:
      "${json["data"]["hijri"]["day"]} "
          "${json["data"]["hijri"]["month"]["en"]} "
          "${json["data"]["hijri"]["year"]} AH",

      month:
      json["data"]["hijri"]["month"]["en"],

      weekday:
      json["data"]["gregorian"]["weekday"]["en"],

      gregorianDate:
      json["data"]["gregorian"]["date"],
    );
  }
}
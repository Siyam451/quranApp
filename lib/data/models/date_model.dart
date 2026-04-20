class DateModel {
  final String readableDate;
  final String hijriDate;

  DateModel({
    required this.readableDate,
    required this.hijriDate,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      readableDate: json['readable'],
      hijriDate: json['hijri']['date'],
    );
  }
}
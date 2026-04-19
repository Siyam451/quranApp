import 'ayat_model.dart';

class SurahWithAyahModel {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;
  final List<AyahModel> ayahs;

  SurahWithAyahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.ayahs,
  });

  factory SurahWithAyahModel.fromJson(Map<String, dynamic> json) {
    return SurahWithAyahModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      revelationType: json['revelationType'],
      ayahs: (json['ayahs'] as List)
          .map((e) => AyahModel.fromJson(e))
          .toList(),
    );
  }
}
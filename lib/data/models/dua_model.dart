class DuaModel {
  final int id;
  final String title;
  final String audioUrl;
  final String textUrl;

  DuaModel({
    required this.id,
    required this.title,
    required this.audioUrl,
    required this.textUrl,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      id: json['ID'],
      title: json['TITLE'],
      audioUrl: json['AUDIO_URL'],
      textUrl: json['TEXT'],
    );
  }
}
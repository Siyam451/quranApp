class MosqueModel {

  final String name;
  final double lat;
  final double lon;

  MosqueModel({
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory MosqueModel.fromJson(
      Map<String, dynamic> json) {

    return MosqueModel(
      name: json["display_name"] ?? "Unnamed Mosque",

      lat: double.parse(
        json["lat"].toString(),
      ),

      lon: double.parse(
        json["lon"].toString(),
      ),
    );
  }
}
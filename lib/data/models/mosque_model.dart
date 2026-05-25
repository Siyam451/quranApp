class MosqueModel {

  final String name;

  MosqueModel({
    required this.name,
  });

  factory MosqueModel.fromJson(
      Map<String,dynamic> json){

    return MosqueModel(
      name:
      json["display_name"],
    );
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class MosqueService {

  Future<List<dynamic>> getMosques() async {

    final response =
    await http.get(

      Uri.parse(
        "https://nominatim.openstreetmap.org/search?q=mosque&format=json&limit=20",
      ),

      headers: {
        "User-Agent":"QuranApp"
      },
    );

    final data =
    jsonDecode(
      response.body,
    );

    return data;
  }
}
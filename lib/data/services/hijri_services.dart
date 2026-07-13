import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/hijri_model.dart';

class HijriService{

  Future<HijriModel> getHijriDate() async{

    final now=DateTime.now();

    final date=

        "${now.day}-${now.month}-${now.year}";

    final response=

    await http.get(

      Uri.parse(
        "https://api.aladhan.com/v1/gToH?date=$date",
      ),
    );

    if(response.statusCode==200){

      return HijriModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      "Unable to fetch Hijri date",
    );
  }
}
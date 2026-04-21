import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../data/domain/utilits.dart';
import '../../data/models/surah_model.dart';
import '../../data/services/api_caller.dart';

class SurahProvider extends ChangeNotifier{
  final ApiCaller _apiCaller = ApiCaller();

  List<SurahModel> _surah = [];
  List<SurahModel> get surah => _surah;

  bool _surahInprogress = false;
  bool get surahInprogress => _surahInprogress;

  String? _errormessage;
  String? get errormessage => _errormessage;

  Future<void> fetchsurah()async{
    _surahInprogress = true;
    notifyListeners();

    final response = await ApiCaller.getrequest(
      url: Urls.getallsurah,
    );

    if(response.isSuccess){
      final List data = response.responseData ['data'];
      _surah = data.map((e) => SurahModel.fromJson(e)).toList();
      _errormessage = null;

    } else{
      _errormessage = response.errorMessage ?? "Something went wrong";
    }

    _surahInprogress = false;
    notifyListeners();
  }


}
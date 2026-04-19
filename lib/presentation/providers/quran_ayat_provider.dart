
import 'package:flutter/cupertino.dart';
import 'package:quranapp/data/models/surah_with_ayat_model.dart';
import 'package:quranapp/data/services/api_caller.dart';

import '../../data/models/ayat_model.dart';

class QuranAyatProvider extends ChangeNotifier{
  final ApiCaller _apiCaller = ApiCaller();
  bool _QuranAyatInprogress = false;
  bool get QuranAyatInprogress => _QuranAyatInprogress;

  String? _errorMassage;
  String? get errormessage => _errorMassage;

  List<SurahWithAyahModel> _surahs =[];
  List<SurahWithAyahModel> get surahs => _surahs;

  Future<void> getquranAyat()async{
   _QuranAyatInprogress = true;
    notifyListeners();

    final response = await ApiCaller.getrequest(url: "https://api.alquran.cloud/v1/quran/quran-uthmani");

    if(response.isSuccess){
      final List data = response.responseData['data'] ['surahs'];
      _surahs = data
          .map((e) => SurahWithAyahModel.fromJson(e))
          .toList();

    }else{
      _errorMassage = response.errorMessage;
    }

    _QuranAyatInprogress = false;
    notifyListeners();


  }
// get ayat by specific surah
  List<AyahModel> getAyahsBySurah(int surahNumber) {
    return _surahs
        .firstWhere((s) => s.number == surahNumber)
        .ayahs;
  }
}

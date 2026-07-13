import 'package:flutter/material.dart';

import '../data/models/hijri_model.dart';
import '../data/services/hijri_services.dart';

class HijriProvider extends ChangeNotifier{

  bool loading=true;

  String? error;

  HijriModel? hijri;

  Future<void> loadHijri() async{

    try{

      loading=true;

      notifyListeners();

      hijri=

      await HijriService()
          .getHijriDate();

    }catch(e){

      error=e.toString();

    }

    loading=false;

    notifyListeners();
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../data/models/dua_model.dart';

class DuaProvider extends ChangeNotifier {

  bool _duaisLoading = false;
  bool get duaisLoading => _duaisLoading;

  String? _errormessage;
  String? get errormessage => _errormessage;


  List<DuaModel> _duas = [];
  List<DuaModel> get duas => _duas;

  Future<void> fetchDua()async{

    _duaisLoading = true;
    notifyListeners();
    try{

      final response = await http.get(Uri.parse('https://hisnmuslim.com/api/en/husn_en.json'));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final List list = data['English'];

        _duas = list.map((e) => DuaModel.fromJson(e)).toList();
        _errormessage = null;
      }else{
        _errormessage = "failed to load duas";
      }

    }catch(e){
      _errormessage = e.toString();
    }

    _duaisLoading = false;
    notifyListeners();

  }

}

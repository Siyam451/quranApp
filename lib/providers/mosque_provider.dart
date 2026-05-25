import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../data/models/mosque_model.dart';
import '../data/services/mosque_service.dart';

class MosqueProvider extends ChangeNotifier {

  bool loading = false;

  String? error;

  List<MosqueModel> mosques = [];

  Future<void> loadMosques() async {
    try {
      loading = true;

      error = null;

      notifyListeners();

      final data =
      await MosqueService()
          .getMosques();

      mosques =
          data
              .map<MosqueModel>(
                (e) =>
                MosqueModel
                    .fromJson(e),
          )
              .toList();
    }

    catch (e) {
      error =
          e.toString();
    }

    loading = false;

    notifyListeners();
  }
}
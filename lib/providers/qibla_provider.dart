import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class QiblaProvider extends ChangeNotifier {

  bool _hasPermission = false;
  bool get hasPermission => _hasPermission;

  Future<void> checkPermission() async {
    final status = await FlutterQiblah.checkLocationStatus();

    if (status.enabled && status.status == LocationPermission.always ||
        status.status == LocationPermission.whileInUse) {
      _hasPermission = true;
    } else {
      _hasPermission = false;
    }

    notifyListeners();
  }
}

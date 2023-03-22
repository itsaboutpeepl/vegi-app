import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/location/postCodeDetail.dart';
import 'package:vegan_liverpool/services/apis/places.dart';
import 'package:vegan_liverpool/utils/constants.dart';

void ToNull() => null;

@lazySingleton
class BlueBeaconService {
  BlueBeaconService() {}

  static FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  void findDevices() {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    final subscription = flutterBlue.scanResults.listen((results) {
        // do something with scan results
        for (ScanResult r in results) {
            print('${r.device.name} found! rssi: ${r.rssi}');
        }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }

}

class BlueBeaconConnections {
  BlueBeaconConnections({
    required this.nearDevices,
  }) {
    
  }
  final List<ScanResult> nearDevices; // show to user to select from network... (A filtered list with vendors only)
}

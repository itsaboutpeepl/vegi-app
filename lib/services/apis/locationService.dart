import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services/apis/places.dart';

void ToNull() => null;

@lazySingleton
class LocationService {
  // created method for getting user current location
  Future<Position> getUserCurrentLocation({
    void Function() callbackIfDenied = ToNull,
  }) async {
    await Geolocator.requestPermission().then((value) {
      if (value == LocationPermission.denied ||
          value == LocationPermission.deniedForever) {
        callbackIfDenied();
      }
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    final currentPosition = await Geolocator.getCurrentPosition();
    return currentPosition;
    // return Coordinates(currentPosition.latitude, currentPosition.longitude);
  }

  Future<bool> locationEnabled({required Store<AppState> store}) {
    if (!store.state.userState.useLiveLocation) {
      return Future.value(false);
    }
    return Geolocator.requestPermission().then((value) {
      if (value == LocationPermission.denied ||
          value == LocationPermission.deniedForever) {
        return false;
      }
      return true;
    }).onError((error, stackTrace) async {
      print("ERROR" + error.toString());
      await Geolocator.requestPermission();
      return false;
    });
  }
}

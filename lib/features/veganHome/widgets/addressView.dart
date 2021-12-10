import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:geocoding/geocoding.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  Marker? userMarker;
  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 1,
          child: Scaffold(
            body: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GoogleMap(
                  onTap: (position) => _addMarker(position),
                  markers: userMarker != null ? {userMarker!} : {},
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _addMarker(LatLng position) {
    setState(
      () {
        userMarker = Marker(
          markerId: MarkerId("userLocation"),
          position: position,
        );
      },
    );
    _getLocationAddress(position.latitude, position.longitude);
  }

  void _getLocationAddress(double latitude, double longitude) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark placeMark = newPlace[0];
    String name = placeMark.name ?? "name";
    // String subLocality = placeMark.subLocality;
    String locality = placeMark.locality ?? "locality";
    String administrativeArea = placeMark.administrativeArea ?? "AArea";
    // String subAdministrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode ?? "postal code";
    String country = placeMark.country ?? "country";
    // String subThoroughfare = placeMark.subThoroughfare;
    String thoroughfare = placeMark.thoroughfare ?? "thoroughfare";
    String countryCode = placeMark.isoCountryCode ?? "country code";
    print(
        "$name, $thoroughfare, $locality, $administrativeArea, $postalCode, $country, $countryCode");
  }
}

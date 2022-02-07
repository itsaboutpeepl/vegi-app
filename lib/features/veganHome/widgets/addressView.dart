import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vegan_liverpool/constants/keys.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    return FractionallySizedBox(
      heightFactor: 1,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
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
          SizedBox(
            height: 5,
          ),
          Text(
            "Tap on the map to select a place",
            style: TextStyle(color: Colors.grey[400]),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: FormBuilder(
              key: AppKeys.addressFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormBuilderTextField(
                        name: 'houseNumber',
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow[300]!, width: 3.0),
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'House No./Flat No.',
                        ),
                        onChanged: (value) {},
                        // valueTransformer: (text) => num.tryParse(text),
                        keyboardType: TextInputType.streetAddress,
                        validator: FormBuilderValidators.required(context)),
                    FormBuilderTextField(
                        name: 'buildingName',
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow[300]!, width: 3.0),
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Building/Premise Name',
                        ),
                        onChanged: (value) {},
                        // valueTransformer: (text) => num.tryParse(text),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(context)),
                    FormBuilderTextField(
                        name: 'streetName',
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow[300]!, width: 3.0),
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Street',
                        ),
                        onChanged: (value) {},
                        // valueTransformer: (text) => num.tryParse(text),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(context)),
                    FormBuilderTextField(
                        name: 'area',
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow[300]!, width: 3.0),
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Area/Postal Code',
                        ),
                        onChanged: (value) {},
                        // valueTransformer: (text) => num.tryParse(text),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(context)),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.grey[800],
                        primary: Colors.yellow[300],
                        textStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w800),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.9, 50),
                      ),
                      onPressed: () {
                        if (AppKeys.addressFormKey.currentState!
                            .saveAndValidate()) {
                          print(AppKeys.addressFormKey.currentState!.value);
                        }
                      },
                      child: const Text('Save Address'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
    _autoFillAddress(position.latitude, position.longitude);
  }

  void _autoFillAddress(double latitude, double longitude) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latitude, longitude);

    Placemark placeMark = newPlace[0];

    AppKeys.addressFormKey.currentState!.fields["buildingName"]!
        .didChange(placeMark.name);
    AppKeys.addressFormKey.currentState!.fields["streetName"]!
        .didChange(placeMark.locality ?? "");
    AppKeys.addressFormKey.currentState!.fields["area"]!
        .didChange(placeMark.postalCode ?? "");

    // String name = placeMark.name ?? "name";
    // // String subLocality = placeMark.subLocality;
    // String locality = placeMark.locality ?? "locality";
    // String administrativeArea = placeMark.administrativeArea ?? "AArea";
    // // String subAdministrativeArea = placeMark.administrativeArea;
    // String postalCode = placeMark.postalCode ?? "postal code";
    // String country = placeMark.country ?? "country";
    // // String subThoroughfare = placeMark.subThoroughfare;
    // String thoroughfare = placeMark.thoroughfare ?? "thoroughfare";
    // String countryCode = placeMark.isoCountryCode ?? "country code";
    // print(
    //     "$name, $thoroughfare, $locality, $administrativeArea, $postalCode, $country, $countryCode");
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vegan_liverpool/constants/keys.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/viewsmodels/deliveryAddressVM.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key, this.existingAddress}) : super(key: key);

  final DeliveryAddresses? existingAddress;

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  Completer<GoogleMapController> _controllerCompleter = Completer();
  LatLng _center = LatLng(45.521563, -122.677433);
  Marker? _userMarker;
  bool _isExistingAddress = false;

  late GoogleMapController _mapController;

  @override
  void initState() {
    widget.existingAddress == null
        ? _isExistingAddress = false
        : _isExistingAddress = true;

    _isExistingAddress
        ? _addMarker(
            LatLng(widget.existingAddress!.latitude,
                widget.existingAddress!.longitude),
            isAutoFill: false)
        : null;

    _isExistingAddress
        ? _center = LatLng(
            widget.existingAddress!.latitude, widget.existingAddress!.longitude)
        : null;

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controllerCompleter.complete(controller);
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressesVM>(
      converter: DeliveryAddressesVM.fromStore,
      builder: (context, vm) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: GoogleMap(
                    onTap: (position) => _addMarker(position, isAutoFill: true),
                    markers: _userMarker != null ? {_userMarker!} : {},
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
                height: MediaQuery.of(context).size.height * 0.45,
                child: FormBuilder(
                  key: AppKeys.addressFormKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FormBuilderTextField(
                            initialValue: _isExistingAddress
                                ? widget.existingAddress!.houseNumber
                                : null,
                            name: 'buildingName',
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeShade300, width: 3.0),
                              ),
                              fillColor: Colors.transparent,
                              labelText: 'Building',
                            ),
                            keyboardType: TextInputType.streetAddress,
                            validator: FormBuilderValidators.required(context)),
                        FormBuilderTextField(
                            initialValue: _isExistingAddress
                                ? widget.existingAddress!.buildingName
                                : null,
                            name: 'streetName',
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeShade300, width: 3.0),
                              ),
                              fillColor: Colors.transparent,
                              labelText: 'Street',
                            ),
                            keyboardType: TextInputType.text,
                            validator: FormBuilderValidators.required(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: FormBuilderTextField(
                                  initialValue: _isExistingAddress
                                      ? widget.existingAddress!.townCity
                                      : null,
                                  name: 'townCity',
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: themeShade300, width: 3.0),
                                    ),
                                    fillColor: Colors.transparent,
                                    labelText: 'Town or City',
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator:
                                      FormBuilderValidators.required(context)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: FormBuilderTextField(
                                  initialValue: _isExistingAddress
                                      ? widget.existingAddress!.postalCode
                                      : null,
                                  name: 'postalCode',
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: themeShade300, width: 3.0),
                                    ),
                                    fillColor: Colors.transparent,
                                    labelText: 'Postal Code',
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator:
                                      FormBuilderValidators.required(context)),
                            ),
                          ],
                        ),
                        FormBuilderTextField(
                          initialValue: _isExistingAddress
                              ? widget.existingAddress!.phoneNumber
                              : null,
                          name: 'phoneNumber',
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: themeShade300, width: 3.0),
                            ),
                            fillColor: Colors.transparent,
                            labelText: 'Phone Number',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: FormBuilderValidators.numeric(context),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.grey[800],
                            primary: themeShade300,
                            textStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.9, 50),
                          ),
                          onPressed: () {
                            if (AppKeys.addressFormKey.currentState!
                                .saveAndValidate()) {
                              Future.wait(
                                [_autoFillMapLocation()],
                              ).then(
                                (value) => vm.addDeliveryAddress(
                                  saveDeliveryAddress(position: value[0]),
                                ),
                              );
                              Navigator.pop(context);
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
      },
    );
  }

  Future<LatLng?> _autoFillMapLocation() async {
    print("Hello from auto fill map location");
    String streetName =
        AppKeys.addressFormKey.currentState!.fields["streetName"]!.value;
    String townCity =
        AppKeys.addressFormKey.currentState!.fields["townCity"]!.value;
    String postalCode =
        AppKeys.addressFormKey.currentState!.fields["postalCode"]!.value;

    String address = "$streetName, $townCity, $postalCode";

    List<Location> possibleLocations =
        await locationFromAddress(address).onError((error, stackTrace) => []);

    if (possibleLocations.isNotEmpty) {
      return LatLng(
          possibleLocations[0].latitude, possibleLocations[0].longitude);
    }
    return null;
  }

  DeliveryAddresses saveDeliveryAddress({LatLng? position}) {
    Map<String, dynamic> formValue = AppKeys.addressFormKey.currentState!.value;

    return DeliveryAddresses(
      internalID: _isExistingAddress
          ? widget.existingAddress!.internalID
          : Random(DateTime.now().millisecondsSinceEpoch).nextInt(10000),
      houseNumber: formValue['buildingName'],
      buildingName: formValue['streetName'],
      townCity: formValue['townCity'],
      postalCode: formValue['postalCode'],
      phoneNumber: formValue['phoneNumber'],
      latitude:
          position != null ? position.latitude : formValue['latitude'] ?? 0.0,
      longitude:
          position != null ? position.longitude : formValue['longitude'] ?? 0.0,
    );
  }

  void _addMarker(LatLng position, {required bool isAutoFill}) {
    print("MARKER POSITION" + position.toString());
    setState(
      () {
        _userMarker = Marker(
          markerId: MarkerId("userLocation"),
          position: position,
        );
      },
    );
    isAutoFill ? _autoFillAddress(position.latitude, position.longitude) : null;
  }

  void _autoFillAddress(double latitude, double longitude) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latitude, longitude);

    Placemark placeMark = newPlace[0];

    AppKeys.addressFormKey.currentState!
        .setInternalFieldValue("longitude", longitude, isSetState: false);

    AppKeys.addressFormKey.currentState!
        .setInternalFieldValue("latitude", latitude, isSetState: false);

    AppKeys.addressFormKey.currentState!.fields["streetName"]!
        .didChange(placeMark.name);
    AppKeys.addressFormKey.currentState!.fields["townCity"]!
        .didChange(placeMark.locality ?? "");
    AppKeys.addressFormKey.currentState!.fields["postalCode"]!
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

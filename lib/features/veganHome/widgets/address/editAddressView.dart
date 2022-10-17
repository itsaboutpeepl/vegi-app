import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/viewsmodels/deliveryAddressVM.dart';
import 'package:vegan_liverpool/services/apis/places.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key, this.existingAddress}) : super(key: key);

  final DeliveryAddresses? existingAddress;

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  bool _isExistingAddress = false;
  final _sessionToken = const Uuid().v4();
  late PlaceApiProvider _placeApiProvider;
  late GlobalKey<FormBuilderState> _addressFormKey;
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    widget.existingAddress == null
        ? _isExistingAddress = false
        : _isExistingAddress = true;
    _placeApiProvider = PlaceApiProvider(_sessionToken);

    _addressFormKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressesVM>(
      converter: DeliveryAddressesVM.fromStore,
      builder: (context, viewmodel) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: _addressFormKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormBuilderTypeAhead<Suggestion>(
                    controller: _typeAheadController,
                    initialValue: _isExistingAddress
                        ? Suggestion('', widget.existingAddress!.addressLine1)
                        : null,
                    name: 'addressLine1',
                    hideOnEmpty: true,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeShade300, width: 3),
                      ),
                      fillColor: Colors.transparent,
                      labelText: 'Address Line 1',
                    ),
                    onSaved: (dynamic suggestion) {
                      if (suggestion == null) {
                        _addressFormKey.currentState!.setInternalFieldValue(
                          'addressLine1Internal',
                          _typeAheadController.text,
                          isSetState: false,
                        );
                      }
                    },
                    onSuggestionSelected: (Suggestion suggestion) {
                      _placeApiProvider
                          .getPlaceDetailFromId(suggestion.placeId)
                          .then((Place place) {
                        _addressFormKey.currentState!.setInternalFieldValue(
                          'addressLine1Internal',
                          '${place.streetNumber} ${place.street}',
                          isSetState: false,
                        );
                        _addressFormKey.currentState!.fields['townCity']!
                            .didChange(place.city);
                        _addressFormKey.currentState!.fields['postalCode']!
                            .didChange(place.zipCode);
                      });
                    },
                    itemBuilder: (context, Suggestion suggestion) {
                      return ListTile(title: Text(suggestion.description));
                    },
                    selectionToTextTransformer: (Suggestion suggestion) {
                      return suggestion.description;
                    },
                    loadingBuilder: (_) => const CircularProgressIndicator(
                      color: themeShade600,
                    ),
                    suggestionsCallback: (query) {
                      if (query.isNotEmpty) {
                        return _placeApiProvider.fetchSuggestions(query);
                      } else {
                        return [];
                      }
                    },
                    valueTransformer: (Suggestion? suggestion) =>
                        suggestion == null ? '' : suggestion.description,
                  ),
                  FormBuilderTextField(
                    initialValue: _isExistingAddress
                        ? widget.existingAddress!.addressLine2
                        : null,
                    name: 'addressLine2',
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeShade300, width: 3),
                      ),
                      fillColor: Colors.transparent,
                      labelText: 'Address Line 2',
                    ),
                    keyboardType: TextInputType.text,
                  ),
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
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: themeShade300,
                                width: 3,
                              ),
                            ),
                            fillColor: Colors.transparent,
                            labelText: 'Town/City',
                          ),
                          keyboardType: TextInputType.text,
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: FormBuilderTextField(
                          initialValue: _isExistingAddress
                              ? widget.existingAddress!.postalCode
                              : null,
                          name: 'postalCode',
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: themeShade300,
                                width: 3,
                              ),
                            ),
                            fillColor: Colors.transparent,
                            labelText: 'Postal Code',
                          ),
                          keyboardType: TextInputType.text,
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                    ],
                  ),
                  FormBuilderTextField(
                    initialValue: _isExistingAddress
                        ? widget.existingAddress!.phoneNumber
                        : null,
                    name: 'phoneNumber',
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeShade300, width: 3),
                      ),
                      fillColor: Colors.transparent,
                      labelText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.required()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.grey[800],
                      primary: themeShade300,
                      textStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    onPressed: () {
                      if (_addressFormKey.currentState!.saveAndValidate()) {
                        _tryFetchMapLocation().then((LatLng? value) {
                          viewmodel.addDeliveryAddress(
                            saveDeliveryAddress(position: value),
                          );
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: const Text('Save Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (_isExistingAddress)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.grey[800],
                        primary: Colors.red,
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.9,
                          50,
                        ),
                      ),
                      onPressed: () {
                        viewmodel
                            .deleteDeliveryAddress(widget.existingAddress!);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Delete Address',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<LatLng?> _tryFetchMapLocation() async {
    print('Hello from auto fill map location');

    final Suggestion? address = _addressFormKey
        .currentState!.fields['addressLine1']!.value as Suggestion?;

    if (address == null) {
      return null;
    }

    final List<Location> possibleLocations =
        await locationFromAddress(address.description)
            .onError((error, stackTrace) => []);

    if (possibleLocations.isNotEmpty) {
      return LatLng(
        possibleLocations[0].latitude,
        possibleLocations[0].longitude,
      );
    }
    return null;
  }

  DeliveryAddresses saveDeliveryAddress({LatLng? position}) {
    final Map<String, dynamic> formValue = _addressFormKey.currentState!.value;

    return DeliveryAddresses(
      internalID: _isExistingAddress
          ? widget.existingAddress!.internalID
          : Random(DateTime.now().millisecondsSinceEpoch).nextInt(10000),
      label: formValue['label'] as String,
      addressLine1: (formValue['addressLine1Internal'] as String?) ??
          formValue['addressLine1'] as String,
      addressLine2: formValue['addressLine2'] as String? ?? '',
      townCity: formValue['townCity'] as String,
      postalCode: formValue['postalCode'] as String,
      phoneNumber: formValue['phoneNumber'] as String,
      latitude: position != null
          ? position.latitude
          : formValue['latitude'] as double? ?? 0.0,
      longitude: position != null
          ? position.longitude
          : formValue['longitude'] as double? ?? 0.0,
    );
  }
}

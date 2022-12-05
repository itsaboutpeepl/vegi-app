import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';
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
  Coordinates? addressCoordinates;

  @override
  void initState() {
    _isExistingAddress = false;

    _placeApiProvider = PlaceApiProvider(_sessionToken);
    _addressFormKey = GlobalKey<FormBuilderState>();

    if (widget.existingAddress != null) {
      _isExistingAddress = true;
      _typeAheadController.text = widget.existingAddress!.addressLine1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressViewModel>(
      converter: DeliveryAddressViewModel.fromStore,
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
                  FormBuilderChoiceChip<DeliveryAddressLabel>(
                    initialValue: _isExistingAddress
                        ? widget.existingAddress!.label
                        : null,
                    validator: FormBuilderValidators.required(
                      errorText: 'Please select a label',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      side: const BorderSide(),
                    ),
                    backgroundColor: Colors.white,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 12, top: 12, right: 12),
                      labelText: 'Address Label',
                      border: InputBorder.none,
                    ),
                    spacing: 15,
                    name: 'label',
                    options: DeliveryAddressLabel.values
                        .map(
                          (label) =>
                              FormBuilderChipOption<DeliveryAddressLabel>(
                            value: label,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  label.icon,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(label.name.capitalize())
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  FormBuilderTypeAhead<Suggestion>(
                    controller: _typeAheadController,
                    name: 'addressLine1',
                    hideOnEmpty: true,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeShade300, width: 3),
                      ),
                      fillColor: Colors.transparent,
                      labelText: 'Address Line 1',
                    ),
                    onSaved: (Suggestion? suggestion) {
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          textCapitalization: TextCapitalization.characters,
                          initialValue: _isExistingAddress
                              ? widget.existingAddress!.postalCode
                              : null,
                          name: 'postalCode',
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                    onPressed: () async {
                      if (_addressFormKey.currentState!.saveAndValidate()) {
                        await validateAddressService();
                        final address = saveDeliveryAddress();
                        if (_isExistingAddress) {
                          viewmodel.editAddress(
                            oldId: widget.existingAddress!.internalID,
                            newAddress: address,
                          );
                        } else {
                          viewmodel.addAddress(newAddress: address);
                        }
                        if (address
                            .deliversTo(viewmodel.fulfilmentPostalDistricts)) {
                          viewmodel.setDeliveryAddress(id: address.internalID);
                          Navigator.pop(context);
                        } else {
                          if (!viewmodel.useLiveLocation) {
                            showErrorSnack(
                              context: context,
                              title:
                                  'Enable location in settings to see vendors that deliver to you.',
                            );
                          }
                        }
                        Navigator.pop(context);
                      }
                    },
                    label: 'Save Address',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> validateAddressService() async {
    final Map<String, dynamic> formValue = _addressFormKey.currentState!.value;
    //todo: consider adding address validation api: https://developers.google.com/maps/documentation/address-validation
    final locations = await _placeApiProvider.fetchLocationByAddress(
      addressLineOne: (formValue['addressLine1Internal'] as String?) ??
          formValue['addressLine1'] as String,
      addressLineTwo: formValue['addressLine2'] as String? ?? '',
      addressTownCity: formValue['townCity'] as String,
      addressPostCode: (formValue['postalCode'] as String).toUpperCase(),
      addressCountryCode: 'UK',
    );
    if (locations.isEmpty) {
      addressCoordinates = null;
      return false;
    } else if (locations.length == 1) {
      final location = locations[0];
      addressCoordinates = location.coordinates;
    } else {
      // Default to first or ask user?
      final location = locations[0];
      addressCoordinates = location.coordinates;
    }
    return true;
  }

  DeliveryAddresses saveDeliveryAddress() {
    final Map<String, dynamic> formValue = _addressFormKey.currentState!.value;

    return DeliveryAddresses(
      internalID: _isExistingAddress
          ? widget.existingAddress!.internalID
          : Random(DateTime.now().millisecondsSinceEpoch).nextInt(10000),
      label: formValue['label'] as DeliveryAddressLabel,
      addressLine1: (formValue['addressLine1Internal'] as String?) ??
          formValue['addressLine1'] as String,
      addressLine2: formValue['addressLine2'] as String? ?? '',
      townCity: formValue['townCity'] as String,
      postalCode: (formValue['postalCode'] as String).toUpperCase(),
      latitude: addressCoordinates?.lat ?? 0.0,
      longitude: addressCoordinates?.lng ?? 0.0,
    );
  }
}

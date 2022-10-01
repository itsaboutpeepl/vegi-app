import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';
import 'package:vegan_liverpool/services/apis/places.dart';

class CatchmentAreaFormView extends StatefulWidget {
  const CatchmentAreaFormView(
      {Key? key, this.existingPostalCode, this.radiusMeters = 1000.0})
      : super(key: key);

  final String? existingPostalCode;
  final double radiusMeters;

  @override
  _CatchmentAreaFormViewState createState() => _CatchmentAreaFormViewState();
}

class _CatchmentAreaFormViewState extends State<CatchmentAreaFormView> {
  bool _isExistingArea = false;
  final _sessionToken = Uuid().v4();
  late PlaceApiProvider _placeApiProvider;
  late GlobalKey<FormBuilderState> _addressFormKey;
  TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    widget.existingPostalCode == null
        ? _isExistingArea = false
        : _isExistingArea = true;
    _placeApiProvider = PlaceApiProvider(_sessionToken);

    _addressFormKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: FormBuilderTextField(
                            initialValue: _isExistingArea
                                ? widget.existingPostalCode
                                : null,
                            name: 'postalCode',
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeShade300, width: 3.0),
                              ),
                              fillColor: Colors.transparent,
                              labelText: 'Postal Code',
                            ),
                            keyboardType: TextInputType.text,
                            validator: FormBuilderValidators.required()),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.grey[800],
                      primary: themeShade300,
                      textStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    onPressed: () {
                      if (_addressFormKey.currentState!.saveAndValidate()) {
                        viewmodel.changeOutCode(_addressFormKey
                            .currentState!.fields["postalCode"]!.value);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

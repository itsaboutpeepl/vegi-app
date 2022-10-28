import 'package:carrier_info/carrier_info.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phone_number/phone_number.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/signup.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/url.dart';

typedef SignUp = void Function(
  CountryCode,
  PhoneNumber,
  Function onSuccess,
  void Function(dynamic error) onError,
);

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController(text: '');
  final phoneController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  CountryCode countryCode = CountryCode(dialCode: '+1', code: 'US');
  bool isPreloading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_updateCountryCode);
    super.initState();
  }

  Future<void> _updateCountryCode(_) async {
    try {
      final String? currentCountryCode = await CarrierInfo.isoCountryCode;
      if (currentCountryCode != null) {
        final Map<String, String> localeData = codes.firstWhere(
          (Map<String, String> code) =>
              code['code'].toString().toLowerCase() ==
              currentCountryCode.toLowerCase(),
        );
        if (mounted &&
            localeData.containsKey('dial_code') &&
            localeData.containsKey('code')) {
          setState(() {
            countryCode = CountryCode(
              dialCode: localeData['dial_code'],
              code: localeData['code'],
            );
          });
        }
      }
    } catch (e) {
      print('Failed to deduce sim country code: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      resizeToAvoidBottomInset: false,
      title: I10n.of(context).sign_up,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  I10n.of(context).enter_phone_number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Theme.of(context).canvasColor,
                    highlightColor: Theme.of(context).canvasColor,
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => const SignUpDialog(),
                      );
                    },
                    child: Center(
                      child: Text(
                        I10n.of(context).why_do_we_need_this,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 30,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            CountryCodePicker(
                              onChanged: (_countryCode) {
                                setState(() {
                                  countryCode = _countryCode;
                                });
                              },
                              searchDecoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                fillColor: Theme.of(context).canvasColor,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                              dialogSize: Size(
                                MediaQuery.of(context).size.width * .9,
                                MediaQuery.of(context).size.height * 0.85,
                              ),
                              searchStyle: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              initialSelection: countryCode.code,
                              dialogTextStyle: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            const Icon(Icons.arrow_drop_down),
                            Container(
                              height: 35,
                              width: 1,
                              color: Theme.of(context).colorScheme.onSurface,
                              margin: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                validator: (String? value) => value!.isEmpty
                                    ? 'Please enter mobile number'
                                    : null,
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  hintText: I10n.of(context).phoneNumber,
                                  border: InputBorder.none,
                                  fillColor: Theme.of(context).backgroundColor,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      StoreConnector<AppState, SignUp>(
                        distinct: true,
                        converter: (store) => (
                          CountryCode countryCode,
                          PhoneNumber phoneNumber,
                          Function onSuccess,
                          dynamic Function(dynamic) onError,
                        ) =>
                            store.dispatch(
                              loginHandler(
                                countryCode,
                                phoneNumber,
                                onSuccess,
                                onError,
                              ),
                            ),
                        builder: (_, signUp) => PrimaryButton(
                          label: I10n.of(context).next_button,
                          preload: isPreloading,
                          disabled: isPreloading,
                          onPressed: () async {
                            final String phoneNumber =
                                '${countryCode.dialCode}${phoneController.text}';
                            setState(() {
                              isPreloading = true;
                            });
                            try {
                              final value = await phoneNumberUtil.parse(
                                phoneNumber,
                              );
                              signUp(
                                countryCode,
                                value,
                                () {
                                  setState(() {
                                    isPreloading = false;
                                  });
                                },
                                (error) {
                                  setState(() {
                                    isPreloading = false;
                                  });
                                  showErrorSnack(
                                    message: I10n.of(context).invalid_number,
                                    title:
                                        I10n.of(context).something_went_wrong,
                                    context: context,
                                    margin: const EdgeInsets.only(
                                      top: 8,
                                      right: 8,
                                      left: 8,
                                      bottom: 120,
                                    ),
                                  );
                                },
                              );
                            } catch (e) {
                              setState(() {
                                isPreloading = false;
                              });
                              showErrorSnack(
                                message: I10n.of(context).invalid_number,
                                title: I10n.of(context).something_went_wrong,
                                context: context,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  right: 8,
                                  left: 8,
                                  bottom: 120,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => launchUrl('https://vegiapp.co.uk/privacy'),
                        child: Text(
                          'By signing up, you agree to the vegi'
                          ' Terms & Conditions which can be found here',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

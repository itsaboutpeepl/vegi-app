import 'dart:io';

import 'package:carrier_info/carrier_info.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/signup.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/mainScreen.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/url.dart';

typedef SignUp = void Function(
  CountryCode,
  PhoneNumber,
  void Function() onSuccess,
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
  CountryCode countryCode = CountryCode(dialCode: '+44', code: 'GB');
  bool isPreloading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_updateCountryCode);
    super.initState();
  }

  Future<void> _updateCountryCode(_) async {
    try {
      String? isoCode;
      if (Platform.isAndroid) {
        final androidInfo = await CarrierInfo.getAndroidInfo();
        if ((androidInfo?.telephonyInfo.length ?? 0) >= 1) {
          isoCode = androidInfo?.telephonyInfo[0].isoCountryCode;
        }
      }
      if (Platform.isIOS) {
        final iosInfo = await CarrierInfo.getIosInfo();
        if (iosInfo.carrierData.length >= 1) {
          isoCode = iosInfo.carrierData[0].isoCountryCode;
        }
      }
      final currentCountryCode = isoCode;
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
    return StoreConnector<AppState, MainScreenViewModel>(
      converter: MainScreenViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        // if (store.state.userState.countryCode.isNotEmpty &&
        //     store.state.userState.isoCode.isNotEmpty &&
        //     store.state.userState.phoneNumber.isNotEmpty) {
        //   setState(() {
        //     countryCode = CountryCode(
        //       dialCode: store.state.userState.countryCode,
        //       code: store.state.userState.isoCode,
        //     );
        //   });
        //   phoneController.text = store.state.userState.phoneNumber;
        // }
        store.dispatch(isBetaWhitelistedAddress());
      },
      // onInitialBuild: (viewModel) async {
      //   if (viewModel.firebaseSessionToken != null) {
      //     if (viewModel.firebaseAuthenticationStatus ==
      //         FirebaseAuthenticationStatus.authenticated) {
      //       setState(() {
      //         isPreloading = true;
      //       });
      //       await onBoardStrategy.reauthenticateUser();
      //       await rootRouter.replace(const MainScreen());
      //     }
      //   }
      // },
      onWillChange: (previousViewModel, newViewModel) {
        checkAuth(
          oldViewModel: previousViewModel,
          newViewModel: newViewModel,
          routerContext: context,
        );
      },
      builder: (context, viewmodel) {
        if (viewmodel.countryCode.isNotEmpty &&
            viewmodel.dialCode.isNotEmpty &&
            viewmodel.phoneNumberNoCountry.isNotEmpty) {
          // setState(() {
          //   countryCode = CountryCode(
          //     dialCode: viewmodel.dialCode,
          //     code: viewmodel.countryCode,
          //   );
          // });
          countryCode = CountryCode(
            dialCode: viewmodel.dialCode,
            code: viewmodel.countryCode,
          );
          phoneController.text = viewmodel.phoneNumberNoCountry;
        }
        return MyScaffold(
          resizeToAvoidBottomInset: false,
          title: viewmodel.hasLoggedInBefore
              ? 'Reauthenticate'
              : I10n.of(context).sign_up,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      viewmodel.hasLoggedInBefore
                          ? 'Please enter your phone number to reauthenticate'
                          : I10n.of(context).enter_phone_number,
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
                            builder: (BuildContext context) =>
                                const SignUpDialog(),
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ),
                                  dialogSize: Size(
                                    MediaQuery.of(context).size.width * .9,
                                    MediaQuery.of(context).size.height * 0.85,
                                  ),
                                  searchStyle: TextStyle(
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  initialSelection: countryCode.code,
                                  favorite: const <String>[
                                    'GB', // /Users/joeyd/.pub-cache/hosted/pub.dartlang.org/country_code_picker-2.0.2/lib/country_codes.dart:1174
                                    'US', // /Users/joeyd/.pub-cache/hosted/pub.dartlang.org/country_code_picker-2.0.2/lib/country_codes.dart:1179
                                  ],
                                  showDropDownButton: true,
                                  dialogTextStyle: TextStyle(
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                Container(
                                  height: 35,
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 10,
                                      ),
                                      hintText: I10n.of(context).phoneNumber,
                                      border: InputBorder.none,
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .background,
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
                          PrimaryButton(
                            label: I10n.of(context).next_button,
                            preload: isPreloading,
                            disabled: isPreloading,
                            onPressed: () {
                              parsePhoneNumber(
                                viewmodel: viewmodel,
                              ).then((e) {
                                if (e != null) {
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
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () =>
                                launchUrl('https://vegiapp.co.uk/privacy'),
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
      },
    );
  }

  Future<Exception?> parsePhoneNumber({
    required MainScreenViewModel viewmodel,
  }) async {
    final String phoneNumber = '${countryCode.dialCode}${phoneController.text}';
    setState(() {
      isPreloading = true;
    });
    PhoneNumber? value = null;
    try {
      value = await phoneNumberUtil.parse(
        phoneNumber,
      );
    } catch (e) {
      // do nothing and try again....
    }
    try {
      value ??= await PhoneNumberUtil().parse(
        phoneController.text,
        regionCode: countryCode.code,
      );
    } on Exception catch (e) {
      setState(() {
        isPreloading = false;
      });

      await Sentry.captureException(
        e,
        stackTrace: StackTrace.current, // from catch (e, s)
        hint: 'ERROR - fetchProductOptions $e',
      );
      return e;
    }
    try {
      viewmodel.setPhoneNumber(
        countryCode: countryCode,
        phoneNumber: value,
      );
    } catch (err) {
      log.error('Unable to set phoneNumber in store with error: $err');
    }

    try {
      viewmodel.signup(
        countryCode: countryCode,
        phoneNumber: value,
        onSuccess: () async {
          // setState(() {
          //   isPreloading = false;
          // });
        },
        onError: (error) async {
          setState(() {
            isPreloading = false;
          });
          await showErrorSnack(
            title: error
                    .toString()
                    .contains('blocked all requests from this device')
                ? 'Verification error'
                : I10n.of(context).something_went_wrong,
            message:
                viewmodel.isSuperAdmin ? 'Firebase error: $error' : '$error',
            context: context,
            margin: const EdgeInsets.only(
              top: 8,
              right: 8,
              left: 8,
              bottom: 120,
            ),
          );
          log.error(error);
          await Sentry.captureException(
            error,
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - signup_screen.parsePhoneNumber $error',
          );
        },
      );
    } on Exception catch (e) {
      setState(() {
        isPreloading = false;
      });
      return e;
    }
    return null;
  }
}

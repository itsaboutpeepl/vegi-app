import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/backup.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/biometric_local_auth.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final pincodeController = TextEditingController(text: '');
  String currentText = '';
  late Flushbar<bool> flush;
  final formKey = GlobalKey<FormState>();
  // StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // errorController.close();

    super.dispose();
  }

  Future<void> _checkBiometricAuth({
    required BiometricAuth userAuth,
    required bool biometricallyAuthenticated,
    required void Function({required bool isBiometricallyAuthenticated})
        setBiometricallyAuthenticated,
  }) async {
    if (biometricallyAuthenticated) {
      return;
    }
    if (userAuth != BiometricAuth.pincode && userAuth != BiometricAuth.none) {
      final BiometricAuth type = await BiometricUtils.getAvailableBiometrics();
      final String biometric = BiometricUtils.getBiometricString(
        type,
      );
      await BiometricUtils.showDefaultPopupCheckBiometricAuth(
        message: 'Please use $biometric to unlock!',
        callback: (bool result) {
          if (result) {
            setBiometricallyAuthenticated(
              isBiometricallyAuthenticated: true,
            );
            Analytics.track(
              eventName: AnalyticsEvents.securityScreen,
              properties: {'auth_type': type.toString()},
            );
            // viewModel.setSecurityType(
            //   type,
            // );
            context.router.replace(const MainScreen());
            Analytics.track(
              eventName: AnalyticsEvents.onboardingCompleted,
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      converter: LockScreenViewModel.fromStore,
      distinct: true,
      onWillChange: (previousViewModel, newViewModel) async {
        if (newViewModel.firebaseAuthenticationStatus !=
            (previousViewModel?.firebaseAuthenticationStatus ??
                FirebaseAuthenticationStatus.unauthenticated)) {
          log.info(
              'Update to user authentication: ${newViewModel.firebaseAuthenticationStatus.name}');
          if (newViewModel.firebaseAuthenticationStatus ==
                  FirebaseAuthenticationStatus.authenticated &&
              newViewModel.vegiAuthenticationStatus !=
                  VegiAuthenticationStatus.authenticated) {
            final reauthenticationSucceeded =
                await newViewModel.reauthenticateUserWithVegi();
            if (!reauthenticationSucceeded) {
              log.info('Auto signin failed');
              log.info('Push SignUpScreen()');
              await rootRouter.replaceAll([const SignUpScreen()]);
            }
          }
        }
        if (newViewModel.fuseAuthenticationStatus !=
            (previousViewModel?.fuseAuthenticationStatus ??
                FuseAuthenticationStatus.unauthenticated)) {
          log.info(
              'Update to fuseAuthenticationStatus: ${newViewModel.fuseAuthenticationStatus.name}');
          // await showInfoSnack(context, title: 'title')
        }
      },
      builder: (_, viewModel) => FutureBuilder<void>(
        future: _checkBiometricAuth(
          userAuth: viewModel.biometricAuth,
          biometricallyAuthenticated: viewModel.biometricallyAuthenticated,
          setBiometricallyAuthenticated:
              viewModel.setBiometricallyAuthenticated,
        ),
        builder: (context, AsyncSnapshot<void> snapshot) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: screenGradient,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 100,
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/Vegi-Logo-horizontal.png',
                          ),
                        ),
                        if (!viewModel.biometricallyAuthenticated)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  I10n.of(context).enter_pincode,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Form(
                                  key: formKey,
                                  child: SizedBox(
                                    width: 250,
                                    child: PinCodeTextField(
                                      backgroundColor: Colors.transparent,
                                      length: 6,
                                      showCursor: false,
                                      autoFocus: true,
                                      appContext: context,
                                      enableActiveFill: true,
                                      obscureText: true,
                                      enablePinAutofill: false,
                                      keyboardType: TextInputType.number,
                                      animationType: AnimationType.fade,
                                      controller: pincodeController,
                                      // errorAnimationController: errorController,
                                      validator: (String? value) =>
                                          value!.length != 6 &&
                                                  value == viewModel.pincode
                                              ? I10n.of(context).invalid_pincode
                                              : null,
                                      textStyle: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      pinTheme: PinTheme(
                                        borderRadius: BorderRadius.circular(5),
                                        borderWidth: 4,
                                        fieldWidth: 35,
                                        shape: PinCodeFieldShape.underline,
                                        inactiveColor: Colors.black,
                                        selectedColor: Colors.black,
                                        activeColor: Colors.black,
                                        inactiveFillColor: Colors.transparent,
                                        selectedFillColor: Colors.transparent,
                                        disabledColor: Colors.transparent,
                                        activeFillColor: Colors.transparent,
                                      ),
                                      onCompleted: (value) {
                                        if (viewModel.pincode == value) {
                                          context.router
                                              .replaceAll([const MainScreen()]);
                                          pincodeController.clear();
                                        } else {
                                          flush = Flushbar<bool>(
                                            title: I10n.of(context)
                                                .invalid_pincode,
                                            message: I10n.of(context)
                                                .auth_failed_message,
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            mainButton: TextButton(
                                              onPressed: () =>
                                                  flush.dismiss(true),
                                              child: Text(
                                                I10n.of(context).try_again,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          )..show(context).then(
                                              (result) async {
                                                if (result == true) {
                                                  pincodeController.clear();
                                                  WidgetsBinding.instance
                                                      .focusManager.primaryFocus
                                                      ?.previousFocus();
                                                }
                                              },
                                            );
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          currentText = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

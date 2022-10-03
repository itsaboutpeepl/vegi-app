import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/auth_flow.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/backup.dart';

class SplashScreen extends StatefulWidget {
  final void Function(bool isLoggedIn)? onLoginResult;
  const SplashScreen({
    Key? key,
    this.onLoginResult,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Flushbar flush;

  onInit(Store<AppState> store) async {
    await initApp(
        store: store, context: context, onLoginResult: widget.onLoginResult);
  }

  // Future<void> _showLocalAuthPopup(String biometric) async {
  //   await BiometricUtils.showDefaultPopupCheckBiometricAuth(
  //     message: '${I10n.of(context).please_use} $biometric ${I10n.of(context).to_unlock}',
  //     stickyAuth: true,
  //     callback: (bool result) {
  //       if (result) {
  //         Segment.track(
  //           eventName: 'Session Start: Authentication success',
  //         );
  //         context.router.replaceAll([MainScreen()]);
  //         widget.onLoginResult?.call(true);
  //       } else {
  //         flush = Flushbar<bool>(
  //           title: I10n.of(context).auth_failed_title,
  //           message: I10n.of(context).auth_failed_message,
  //           icon: Icon(
  //             Icons.info_outline,
  //             color: Theme.of(context).colorScheme.primary,
  //           ),
  //           mainButton: TextButton(
  //             onPressed: () {
  //               flush.dismiss(true);
  //             },
  //             child: Text(
  //               I10n.of(context).try_again,
  //               style: TextStyle(color: Theme.of(context).colorScheme.primary),
  //             ),
  //           ),
  //         )..show(context).then(
  //             (result) async {
  //               if (result == true) {
  //                 BiometricAuth _biometricType = await BiometricUtils.getAvailableBiometrics();
  //                 await _showLocalAuthPopup(
  //                   BiometricUtils.getBiometricString(
  //                     context,
  //                     _biometricType,
  //                   ),
  //                 );
  //                 widget.onLoginResult?.call(true);
  //               }
  //             },
  //           );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      distinct: true,
      onInit: onInit,
      converter: LockScreenViewModel.fromStore,
      builder: (_, viewModel) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: screenGradient,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Image.asset(
                    'assets/images/Vegi-Logo-square.png',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/backup.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    this.onLoginResult,
  }) : super(key: key);
  final void Function(bool isLoggedIn)? onLoginResult;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Flushbar<bool> flush;

  Future<void> _reLogin(
    Store<AppState> store,
  ) async {
    store.dispatch(
      reLoginCall(),
    );
  }

  Future<void> _checkLoggedInToVegi({
    required Store<AppState> store,
  }) async {
    if (store.state.userState.firebaseSessionToken != null) {
      await _reLogin(store);
      log.info('Push PinCodeScreen()');
      await rootRouter.replaceAll([const PinCodeScreen()]);
      widget.onLoginResult?.call(true);
    } else {
      log.info('Push SignUpScreen()');
      await rootRouter.replaceAll([const SignUpScreen()]);
    }
  }

  void finishAppStart({
    required BuildContext context,
    required Store<AppState> store,
  }) {
    final UserState userState = store.state.userState;
    if (userState.authType != BiometricAuth.none) {
      store
        ..dispatch(
          fetchFuseSmartWallet(
            onSuccess: () async {
              if (BiometricAuth.faceID == userState.authType ||
                  BiometricAuth.touchID == userState.authType) {
                await _checkLoggedInToVegi(store: store);
              } else if (userState.authType == BiometricAuth.pincode) {
                await _checkLoggedInToVegi(store: store);
              } else {
                throw Exception(
                  'BiometricAuth of ${userState.authType.name} not handled',
                );
              }
            },
            onFailure: (exception) async {
              log.info('Push SignUpScreen()');
              await rootRouter.replaceAll([const SignUpScreen()]);
            },
            onError: (error) async {
              log.info('Push SignUpScreen()');
              await rootRouter.replaceAll([const SignUpScreen()]);
            },
          ),
        )
        ..dispatch(identifyCall());
    } else {
      log.info('Push SignUpScreen()');
      context.router.replaceAll([const SignUpScreen()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      onInit: (store) {
        final String privateKey = store.state.userState.privateKey;
        final String jwtToken = store.state.userState.jwtToken;
        final bool isLoggedOut = store.state.userState.isLoggedOut;
        if (privateKey.isEmpty || jwtToken.isEmpty || isLoggedOut) {
          log.info('Push OnBoardScreen()');
          context.router.replaceAll([const OnBoardScreen()]);
          widget.onLoginResult?.call(false);
        } else if (!store.state.userState.verificationPassed) {
          log.info('Push SignUpScreen()');
          context.router.replaceAll([const SignUpScreen()]);
        } else {
          finishAppStart(
            context: context,
            store: store,
          );
        }
      },
      converter: LockScreenViewModel.fromStore,
      distinct: true,
      onWillChange: (previousViewModel, newViewModel) async {
        checkAuth(
            oldViewModel: previousViewModel,
            newViewModel: newViewModel,
            routerContext: context,
        );
      },
      builder: (_, viewModel) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
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

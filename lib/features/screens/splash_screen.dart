import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/backup.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';
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

  void _reLogin(
    BuildContext context,
    Store<AppState> store,
  ) {
    store.dispatch(
      reLoginCall(
        onSuccess: () {
          showInfoSnack(
            context,
            title: Messages.walletLoadedSnackbarMessage,
          );
          finishAppStart(store: store);
        },
        reOnboardRequired: () {
          if (DebugHelpers.inDebugMode) {
            log.verbose('Reauthentication of user requires reonboarding');
          }
          rootRouter.push(const SignUpScreen());
        },
        onFailure: (Exception e) {
          if (DebugHelpers.inDebugMode) {
            return showErrorSnack(
              context: context,
              title: Messages.walletSignedOutSnackbarMessage,
              message: e.toString(),
            );
          }
          showInfoSnack(
            context,
            title: Messages.walletSignedOutSnackbarMessage,
          );
        },
        onError: (error) {
          if (inDebugMode) {
            showErrorSnack(
              context: context,
              title: Messages.walletSignedOutSnackbarMessage,
              message: 'Error fetching smart wallet: $error',
            );
          } else {
            showInfoSnack(
              context,
              title: Messages.walletSignedOutSnackbarMessage,
            );
          }
        },
      ),
    );
  }

  void finishAppStart({
    required Store<AppState> store,
  }) {
    final UserState userState = store.state.userState;
    if (userState.authType != BiometricAuth.none) {
      store
        ..dispatch(
          fetchFuseSmartWallet(
            onSuccess: () {
              showInfoSnack(
                context,
                title: Messages.walletLoadedSnackbarMessage,
              );
            },
            onFailure: ({String msg = ''}) {
              showInfoSnack(
                context,
                title: Messages.walletSignedOutSnackbarMessage,
              );
              context.router.replaceAll([const SignUpScreen()]);
            },
            onError: (error) {
              if (inDebugMode) {
                showErrorSnack(
                  context: context,
                  title: Messages.walletSignedOutSnackbarMessage,
                  message: 'Error fetching smart wallet: $error',
                );
              } else {
                showInfoSnack(
                  context,
                  title: Messages.walletSignedOutSnackbarMessage,
                );
              }
              context.router.replaceAll([const SignUpScreen()]);
            },
          ),
        )
        ..dispatch(identifyCall());
    }
    log.warn('Need to implement BioMetric Auth here');
    if (BiometricAuth.faceID == userState.authType ||
        BiometricAuth.touchID == userState.authType) {
      context.router.replaceAll([const MainScreen()]);
      widget.onLoginResult?.call(true);
    } else if (userState.authType == BiometricAuth.pincode) {
      context.router.replaceAll([const MainScreen()]);
      widget.onLoginResult?.call(true);
    } else {
      context.router.replaceAll([const MainScreen()]);
      widget.onLoginResult?.call(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      distinct: true,
      onInit: (store) {
        final String privateKey = store.state.userState.privateKey;
        final String jwtToken = store.state.userState.jwtToken;
        final bool isLoggedOut = store.state.userState.isLoggedOut;
        if (privateKey.isEmpty || jwtToken.isEmpty || isLoggedOut) {
          context.router.replaceAll([const OnBoardScreen()]);
          widget.onLoginResult?.call(false);
        } else if (!store.state.userState.verificationPassed) {
          context.router.replaceAll([const SignUpScreen()]);
        } else if (!peeplEatsService.hasCookieStored) {
          if (store.state.userState.firebaseSessionToken != null) {
            _reLogin(context, store);
          } else {
            context.router.replaceAll([const SignUpScreen()]);
          }
        } else {
          finishAppStart(store: store);
        }
      },
      converter: LockScreenViewModel.fromStore,
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

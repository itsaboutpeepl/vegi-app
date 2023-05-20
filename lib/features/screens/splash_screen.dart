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

  bool isRouting = false;

  Future<void> _reLogin(
    Store<AppState> store,
  ) async {
    store.dispatch(
      reLoginCall(),
    );
  }

  Future<void> _checkLoggedInToVegi() async {
    final store = await reduxStore;
    if (store.state.userState.firebaseSessionToken != null) {
      await _reLogin(store);
      log.info(
          'Push PinCodeScreen() from ${rootRouter.current.name} on splash_screen.dart');
      setState(() {
        isRouting = true;
      });
      await rootRouter.replaceAll([const PinCodeScreen()]);
      widget.onLoginResult?.call(true);
    } else {
      log.info(
          'Push OnBoardScreen() from ${rootRouter.current.name} on splash_screen.dart');
      setState(() {
        isRouting = true;
      });
      await rootRouter.replaceAll([const OnBoardScreen()]);
    }
  }

  void finishAppStart({
    required Store<AppState> store,
  }) {
    final UserState userState = store.state.userState;
    if (userState.authType != BiometricAuth.none) {
      rootRouter.push(const PinCodeScreen());
      store
        // ..dispatch(
        //   authenticate(
        //       // onSuccess: () async {
        //       //   if (BiometricAuth.faceID == userState.authType ||
        //       //       BiometricAuth.touchID == userState.authType) {
        //       //     await _checkLoggedInToVegi(store: store);
        //       //   } else if (userState.authType == BiometricAuth.pincode) {
        //       //     await _checkLoggedInToVegi(store: store);
        //       //   } else {
        //       //     throw Exception(
        //       //       'BiometricAuth of ${userState.authType.name} not handled',
        //       //     );
        //       //   }
        //       // },
        //       ),
        // )
        ..dispatch(identifyCall());
    } else {
      log.info('Push OnBoardScreen() from ${rootRouter.current.name}');
      context.router.replaceAll([const OnBoardScreen()]);
    }
  }

  Future<void> _handleFuseAuthenticationSucceeded() async {
    final store = await reduxStore;
    final authType = store.state.userState.authType;
    if (BiometricAuth.faceID == authType || BiometricAuth.touchID == authType) {
      return _checkLoggedInToVegi();
    } else if (authType == BiometricAuth.pincode) {
      return _checkLoggedInToVegi();
    } else {
      throw Exception(
        'BiometricAuth of ${authType.name} not handled',
      );
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
          log.info(
              'Push OnBoardScreen() from ${rootRouter.current.name} at splash_screen.dart');
          context.router.replaceAll([const OnBoardScreen()]);
          widget.onLoginResult?.call(false);
        } else {
          finishAppStart(
            store: store,
          );
        }
      },
      converter: LockScreenViewModel.fromStore,
      distinct: true,
      // onWillChange: (previousViewModel, newViewModel) async {
      //   if (isRouting) {
      //     return;
      //   }
      //   if (newViewModel.fuseAuthenticationStatus ==
      //           FuseAuthenticationStatus.authenticated &&
      //       previousViewModel?.fuseAuthenticationStatus !=
      //           FuseAuthenticationStatus.authenticated) {
      //     return _handleFuseAuthenticationSucceeded();
      //   }
      //   final checked = checkAuth(
      //     oldViewModel: previousViewModel,
      //     newViewModel: newViewModel,
      //     routerContext: context,
      //   );
      //   await checked.runNavigationIfNeeded();
      // },
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

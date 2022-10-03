import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

final goMain =
    (BuildContext context, void Function(bool loggedIn)? onLoginResult) {
  AutoRouter.of(context).replaceAll([MainScreen()]);
  onLoginResult?.call(true);
};

final goOnBoarding =
    (BuildContext context, void Function(bool loggedIn)? onLoginResult) {
  AutoRouter.of(context).replaceAll([OnBoardScreen()]);
  onLoginResult?.call(false);
};

final goPhoneAuth =
    (BuildContext context, void Function(bool loggedIn)? onLoginResult) {
  AutoRouter.of(context).replaceAll([SplashScreen(), SignUpScreen()]);
  onLoginResult?.call(false);
};

bool userIsLoggedIn(Store<AppState> store) {
  String privateKey = store.state.userState.privateKey;
  String jwtToken = store.state.userState.jwtToken;
  bool isLoggedOut = store.state.userState.isLoggedOut;
  return (privateKey.isEmpty || jwtToken.isEmpty || isLoggedOut);
}

bool userNeedsFreshCreds(Store<AppState> store) {
  if (!userIsLoggedIn(store)) {
    throw Exception('Not logged in');
  }
  if (store.state.userState.credentials == null) {
    return true;
  }
  return false;
}

Future<void> initApp(
    {required Store<AppState> store,
    required BuildContext context,
    required void Function(bool loggedIn)? onLoginResult}) async {
  if (!userIsLoggedIn(store)) {
    await Segment.setContext({});
    goOnBoarding(context, onLoginResult);
  } else if (userNeedsFreshCreds(store)) {
    Segment.track(
      eventName: 'Session Refresh Credentials',
    );
    goPhoneAuth(context, onLoginResult);
  } else {
    UserState userState = store.state.userState;
    if (userState.authType != BiometricAuth.none) {
      Segment.track(
        eventName: 'Session Start: Authentication request for existed user',
      );
      store.dispatch(
          getWalletAddressesCall()); //TODO: Integrate with the reauthenticateServices main.dart logic
      store.dispatch(identifyCall());
      store.dispatch(loadContacts());
      // await AppTrackingTransparency.requestTrackingAuthorization();
    }

    if (BiometricAuth.faceID == userState.authType ||
        BiometricAuth.touchID == userState.authType) {
      // Using FaceID for login authentication
      // await _showLocalAuthPopup(
      //   BiometricUtils.getBiometricString(
      //     context,
      //     userState.authType,
      //   ),
      // );
      Segment.track(
        eventName: 'Session Start: Authentication success',
      );
      goMain(context, onLoginResult);
    } else if (userState.authType == BiometricAuth.pincode) {
      Segment.track(
        eventName: 'Session Start: Authentication success',
      );
      goMain(context, onLoginResult);
    } else {
      goMain(context, onLoginResult);
    }
  }
}

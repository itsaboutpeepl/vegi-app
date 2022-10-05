import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/auth/vegi_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class FirebaseStrategy implements IOnBoardStrategy {
  @override
  final strategy;
  FirebaseStrategy({this.strategy = OnboardStrategy.firebase});

  final authLayer =
      OnboardingAuthChain.createWithService(useWalletApi: true, useVegi: false);

  @override
  Future login(
    Store<AppState> store,
    String phoneNumber,
    VoidCallback onSuccess,
    Function(dynamic error) onError,
  ) async {
    return await firebaseCheckPhoneNumberBeforeSignIn(
        authChain: authLayer,
        phoneNumber: phoneNumber,
        store: store,
        onSuccess: onSuccess,
        onError: onError);
  }

  @override
  Future verify(
    Store<AppState> store,
    String verificationCode,
    Function(String e) firebaseVerificationCompletedCallback,
  ) async {
    final String? verificationId = store.state.userState.verificationId;

    PhoneAuthCredential? credential = store.state.userState.credentials;
    if (credential == null) {
      credential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: verificationCode,
      );
      store.dispatch(SetCredentials(credential));
    }

    final jwtToken = store.state.userState.jwtToken.isNotEmpty &&
            store.state.userState.vegiSessionCookie.isNotEmpty
        ? store.state.userState.jwtToken
        : await authLayer.signin(
            phoneNumber: store.state.userState.phoneNumber,
            credentials: credential,
            store: store,
            refreshCredentials: () => store.dispatch(SetCredentials(null)),
            onError: ((errorMsg) => log.error(errorMsg)));

    Segment.track(
      eventName: 'Sign up: VerificationCode_NextBtn_Press_vegiService',
    );
    firebaseVerificationCompletedCallback(
        jwtToken ?? store.state.userState.jwtToken);
  }
}

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class VegiOnboardStrategy implements IOnBoardStrategy {
  @override
  final strategy;
  VegiOnboardStrategy({this.strategy = OnboardStrategy.vegi});

  @override
  Future login(
    Store<AppState> store,
    String phoneNumber,
    VoidCallback onSuccess,
    Function(dynamic error) onError,
  ) async {
    return await verifyPhoneNumber(
        phoneNumber: phoneNumber,
        store: store,
        codeSent: firebaseCodeSent,
        verificationCompleted: firebaseVerificationCompleted,
        verificationFailed: firebaseVerificationFailed,
        onSuccess: onSuccess,
        onError: onError);
  }

  @override
  Future verify(
    store,
    verificationCode,
    onSuccess,
  ) async {
    final String? verificationId = store.state.userState.verificationId;
    final String accountAddress = store.state.userState.accountAddress;
    final String identifier = store.state.userState.identifier;

    PhoneAuthCredential? credential = store.state.userState.credentials;
    if (credential == null) {
      credential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: verificationCode,
      );
      store.dispatch(SetCredentials(credential));
    }

    String? token = await firebaseSignInWithPhoneCreds(
        credential, () => store.dispatch(SetCredentials(null)));
    if (token == null) {
      return null;
    }
    String? jwtToken;
    if (fUSEWalletApiLayer.isLoggedIn) {
      jwtToken = fUSEWalletApiLayer.getJwtToken();
    } else {
      jwtToken = await fUSEWalletApiLayer.loginWithFirebase(
          firebaseToken: token,
          walletAddress: accountAddress,
          identifier: identifier,
          firebaseAppName: 'vegiliverpool',
          onError: ((errMessage) => log.error(errMessage)));
    }
    if (jwtToken != null) {
      return onSuccess(jwtToken);
    }
    onSuccess(store.state.userState.jwtToken);
  }
}

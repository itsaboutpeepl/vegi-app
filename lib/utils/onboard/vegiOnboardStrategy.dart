import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/user.dart' as VegiUser;
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/auth/wallet_api_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

Future<String?> vegiAuthChain(
    {required String phoneNumber,
    required PhoneAuthCredential credentials,
    required String accountAddress,
    required String firebaseIdentifier,
    required Function() refreshCredentials,
    required void Function(String errorMsg) onError}) async {
  String? token =
      await firebaseSignInWithPhoneCreds(credentials, refreshCredentials);
  if (token == null) {
    return null;
  }

  String? jwtToken;
  if (!fUSEWalletApiLayer.isLoggedIn) {
    jwtToken = await fUSEWalletApiLayer.loginWithFirebase(
        firebaseToken: token,
        walletAddress: accountAddress,
        identifier: firebaseIdentifier,
        firebaseAppName: 'vegiliverpool',
        onError: onError);
  } else {
    jwtToken = fUSEWalletApiLayer.getJwtToken();
  }

  VegiUser.User? vegiUser;
  try {
    vegiUser = await peeplEatsService.signIn(
        phoneNumber: phoneNumber, firebaseSessionToken: token);
  } catch (e) {
    onError('Vegi Backend Signin Failed: $e');
  }

  log.info('user.id ${vegiUser?.id}');

  return jwtToken;
}

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
    void verificationCompleted(
      PhoneAuthCredential credentials,
    ) async {
      store.dispatch(SetCredentials(credentials));
      final String accountAddress = store.state.userState.accountAddress;
      final String identifier = store.state.userState.identifier;

      Segment.track(
        eventName: 'Sign up: VerificationCode_NextBtn_Press_walletApi',
      );

      final jwtToken = await vegiAuthChain(
          phoneNumber: phoneNumber,
          credentials: credentials,
          accountAddress: accountAddress,
          firebaseIdentifier: identifier,
          refreshCredentials: () => store.dispatch(SetCredentials(null)),
          onError: onError);

      Segment.track(
        eventName: 'Sign up: VerificationCode_NextBtn_Press_vegiService',
      );

      onSuccess();

      try {
        if (jwtToken != null) {
          store.dispatch(LoginVerifySuccess(jwtToken));
          walletApi.setJwtToken(jwtToken);
          setJwtTokenApp(store);
          store.dispatch(fetchHomePageData());
          if (store.state.userState.displayName.isNotEmpty) {
            rootRouter.push(MainScreen());
          } else {
            rootRouter.push(UserNameScreen());
          }
        }
      } on Exception catch (e) {
        onError(e.toString());
      }
    }

    void verificationFailed(FirebaseAuthException authException) async {
      if (authException.code == 'web-internal-error' &&
          authException.message?.contains('API_KEY_IOS_APP_BLOCKED') == true) {
        log.info(
            'Phone number verification failed probably because Firebase does NOT allow Phone number verification from EMULATOR devices. use the Dummy phone number for vegiLiverpool from an emulator for testing. Code: ${authException.code}. Message: ${authException.message}');
      } else {
        log.info(
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      }
      onError(authException.message);
    }

    void codeSent(
      String verificationId, [
      int? forceResendingToken,
    ]) {
      log.info("PhoneCodeSent verificationId: $verificationId");
      store.dispatch(SetCredentials(null));
      store.dispatch(SetVerificationId(verificationId));
      rootRouter.push(VerifyPhoneNumber(verificationId: verificationId));
      onSuccess();
    }

    // https://firebase.google.com/docs/auth/flutter/phone-auth
    //NOTE: FirebaseAuth not available on emulators. https://firebase.google.com/docs/auth/flutter/phone-auth#testing
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: codeSent,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
    );
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
    credential ??= PhoneAuthProvider.credential(
      verificationId: verificationId ?? '',
      smsCode: verificationCode,
    );

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

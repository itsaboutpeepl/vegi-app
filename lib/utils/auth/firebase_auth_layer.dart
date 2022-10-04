import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/vegi_auth_layer.dart';
import 'package:vegan_liverpool/utils/auth/wallet_api_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

Future<String?> firebaseSignInWithPhoneCreds(
    PhoneAuthCredential credential, Function() refreshCredentials) async {
  try {
    UserCredential userCredential = await firebaseAuth.signInWithCredential(
      credential,
    );
    log.info('Signin with firebase phone creds succeeded');
    final User? currentUser = firebaseAuth.currentUser;
    assert(userCredential.user?.uid == currentUser?.uid);
    final String token = await userCredential.user!.getIdToken();
    return token;
  } on FirebaseAuthException catch (e, s) {
    if (e.code == 'session_expired') {
      log.error(e);
      refreshCredentials();
    } else {
      log.error('ERROR - Failed to Signin with firebase phone credentials: $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - FirebaseSignIn with Phone Credential $e',
      );
    }
  } on Exception catch (e, s) {
    log.error('ERROR - Failed to Signin with firebase phone credentials: $e');
    await Sentry.captureException(
      e,
      stackTrace: s,
      hint: 'ERROR - FirebaseSignIn with Phone Credential $e',
    );
  }
  return null;
}

Future<void> verifyPhoneNumber({
  required String phoneNumber,
  required Store<AppState> store,
  required Function(String, int?) Function({
    required Store<AppState> store,
    required Function() onSuccess,
  })
      codeSent,
  required void Function({
    required PhoneAuthCredential credentials,
    required String phoneNumber,
    required Store<AppState> store,
    required Function() onSuccess,
    required Function(String? errMsg) onError,
  })
      verificationCompleted,
  required void Function(
          {required FirebaseAuthException authException,
          required Function(String? errMsg) onError})
      verificationFailed,
  required Function() onSuccess,
  required Function(String? errMsg) onError,
}) async {
  // https://firebase.google.com/docs/auth/flutter/phone-auth
  //NOTE: FirebaseAuth not available on emulators. https://firebase.google.com/docs/auth/flutter/phone-auth#testing
  return await firebaseAuth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    codeAutoRetrievalTimeout: (String verificationId) {},
    codeSent: (verificationId, forceResendingToken) => codeSent(
        onSuccess: onSuccess,
        store: store)(verificationId, forceResendingToken),
    verificationCompleted: ((phoneAuthCredential) => verificationCompleted(
        credentials: phoneAuthCredential,
        phoneNumber: phoneNumber,
        store: store,
        onSuccess: onSuccess,
        onError: onError)),
    verificationFailed: (FirebaseAuthException authException) =>
        firebaseVerificationFailed(
            authException: authException, onError: onError),
  );
}

void firebaseVerificationCompleted({
  required PhoneAuthCredential credentials,
  required String phoneNumber,
  required Store<AppState> store,
  required Function() onSuccess,
  required Function(String? errMsg) onError,
}) async {
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

Function(String, int?) firebaseCodeSent({
  required Store<AppState> store,
  required Function() onSuccess,
}) {
  return (
    String verificationId, [
    int? forceResendingToken,
  ]) {
    log.info("PhoneCodeSent verificationId: $verificationId");
    store.dispatch(SetCredentials(null));
    store.dispatch(SetVerificationId(verificationId));
    rootRouter.push(VerifyPhoneNumber(verificationId: verificationId));
    onSuccess();
  };
}

void firebaseVerificationFailed(
    {required FirebaseAuthException authException,
    required Function(String? errMsg) onError}) async {
  if (authException.code == 'web-internal-error' &&
      authException.message?.contains('API_KEY_IOS_APP_BLOCKED') == true) {
    log.info(
        'Phone number verification failed probably because Firebase does NOT allow Phone number verification from EMULATOR devices. \nUse the Dummy phone number for vegiLiverpool from an emulator for testing or use firebase auth emulator at https://firebase.google.com/docs/emulator-suite/connect_auth. \nCode: ${authException.code}. Message: ${authException.message}');
  } else {
    log.info(
        'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
  }
  onError(authException.message);
}

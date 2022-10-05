import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/admin/user.dart' as VegiUser;
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/auth/sms_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class OnboardingAuthChain {
  const OnboardingAuthChain.createWithService({
    required this.useFirebaseConnWalletApi,
    required this.useVegi,
  }) : this.useFirebase = true;

  const OnboardingAuthChain.createFirebaseOnly()
      : this.useFirebase = true,
        this.useFirebaseConnWalletApi = false,
        this.useVegi = false;

  const OnboardingAuthChain.createEmpty()
      : this.useFirebase = false,
        this.useFirebaseConnWalletApi = false,
        this.useVegi = false;

  final bool useFirebase;
  final bool useFirebaseConnWalletApi;
  final bool useVegi;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Store<AppState> store,
    required Function() onSuccess,
    required Function(String? errMsg) onError,
  }) async {
    if (useFirebase) {
      return firebaseCheckPhoneNumberBeforeSignIn(
          authChain: this,
          phoneNumber: phoneNumber,
          store: store,
          onSuccess: onSuccess,
          onError: onError);
    } else {
      await signInWithSMS(phoneNumber, onSuccess);
      return;
    }
  }

  Future<String?> signin(
      {required String phoneNumber,
      required String verificationCode,
      required Store<AppState> store,
      required Function() refreshCredentials,
      required void Function(String errorMsg) onError}) async {
    if (!useFirebase) {
      final jwtToken = await walletApi.verifySMS(
        verificationCode,
        phoneNumber,
        store.state.userState.accountAddress,
      );
      return jwtToken;
    }

    final String? verificationId = store.state.userState.verificationId;

    PhoneAuthCredential? credential = store.state.userState.credentials;
    if (credential == null) {
      credential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: verificationCode,
      );
      store.dispatch(SetCredentials(credential));
    }

    String? token =
        await firebaseSignInWithPhoneCreds(credential, refreshCredentials);

    if (token == null) {
      return null;
    }

    String? jwtToken;

    final String accountAddress = store.state.userState.accountAddress;
    final String firebaseIdentifier = store.state.userState.identifier;

    if (fUSEWalletApiLayer.isLoggedIn) {
      jwtToken = fUSEWalletApiLayer.getJwtToken();
    } else {
      jwtToken = await fUSEWalletApiLayer.loginWithFirebase(
          firebaseToken: token,
          walletAddress: accountAddress,
          identifier: firebaseIdentifier,
          firebaseAppName: 'vegiliverpool',
          onError: onError);
    }

    if (useVegi) {
      VegiUser.User? vegiUser;
      try {
        vegiUser = await peeplEatsService.signIn(
            phoneNumber: phoneNumber, firebaseSessionToken: token);
      } catch (e) {
        onError('Vegi Backend Signin Failed: $e');
      }

      store.dispatch(SetVegiSessionToken(vegiUser?.cookie ?? ''));
      log.info('user.id ${vegiUser?.id}');
    }

    return jwtToken;
  }
}

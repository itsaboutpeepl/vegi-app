import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/strings.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class FirebaseStrategy implements IOnBoardStrategy {
  FirebaseStrategy({this.strategy = OnboardStrategy.firebase});

  @override
  OnboardStrategy strategy;

  bool _useWeb3Auth = false;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    Future<void> verificationCompleted(
      PhoneAuthCredential credentials,
    ) async {
      store.dispatch(SetFirebaseCredentials(credentials));
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(
        credentials,
      );
      final User? user = userCredential.user;
      final User currentUser = firebaseAuth.currentUser!;
      assert(user?.uid == currentUser.uid, 'User IDs not same.');
      // final String accountAddress = store.state.userState.accountAddress;
      // final String identifier = store.state.userState.identifier;
      // final String token = await user!.getIdToken();

      try {
        store.dispatch(
            authenticateFuseWalletSDK()); // this does jwt storing and loginSuccess
        onSuccess();
        if (_useWeb3Auth) {
          await _initWeb3Auth();
        } else {
          await rootRouter.push(UserNameScreen());
        }
      } catch (e) {
        onError(e.toString());
      }
    }

    Future<void> verificationFailed(FirebaseAuthException authException) async {
      log
        ..info('Phone number verification failed.')
        ..info('Code: ${authException.code}.')
        ..info('Message: ${authException.message}');
      onError(authException.message);
    }

    void codeSent(
      String verificationId, [
      int? forceResendingToken,
    ]) {
      log.info('PhoneCodeSent verificationId: $verificationId');
      onSuccess();
      store
        ..dispatch(SetFirebaseCredentials(null))
        ..dispatch(SetVerificationId(verificationId));
      rootRouter.push(VerifyPhoneNumber(verificationId: verificationId));
      onSuccess();
    }

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: codeSent,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
    );
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String verificationCode,
    void Function() onSuccess,
  ) async {
    PhoneAuthCredential? credential = store.state.userState.firebaseCredentials;
    final String verificationId = store.state.userState.verificationId ?? '';
    credential ??= PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
  }

  Future<void> _initWeb3Auth() async {
    final Web3AuthResponse response = await Web3AuthFlutter.login(
      LoginParams(
        loginProvider: Provider.email_passwordless,
        redirectUrl: Uri.tryParse('vegi://vegiApp.co.uk/user-name-screen'),
      ), //TODO: allow users to login in any number of ways that they want to...
    );
  }
}

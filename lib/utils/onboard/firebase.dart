import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/network/web3auth.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class FirebaseStrategy implements IOnBoardStrategy {
  FirebaseStrategy({this.strategy = OnboardStrategy.firebase});

  @override
  OnboardStrategy strategy;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    void codeSent(
      String verificationId, [
      int? forceResendingToken,
    ]) {
      log.info('PhoneCodeSent verificationId: $verificationId');
      store
        ..dispatch(SetFirebaseCredentials(null))
        ..dispatch(SetVerificationId(verificationId));
      rootRouter.push(VerifyPhoneNumber(verificationId: verificationId));
    }

    /// * This handler will only be called on Android devices which support automatic SMS code resolution.
    /// ~ https://firebase.google.com/docs/auth/flutter/phone-auth#verificationcompleted
    Future<void> verificationCompleted(
      PhoneAuthCredential credentials,
    ) async {
      return completeVerification(
        store,
        credentials,
        onSuccess,
        onError,
      );
    }

    Future<void> verificationFailed(FirebaseAuthException authException) async {
      log
        ..info('Phone number verification failed.')
        ..info('Code: ${authException.code}.')
        ..info('Message: ${authException.message}');
      onError(authException.message);
    }

    // final confirmationResult = await firebaseAuth.signInWithPhoneNumber(
    //   phoneNumber!,
    // );

    // if(confirmationResult.confirm(verificationCode))

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeAutoRetrievalTimeout: (String verificationId) {
        return onError('Code verification timeout.');
      },
      codeSent: codeSent,
      verificationCompleted:
          verificationCompleted, // * This handler will only be called on Android devices which support automatic SMS code resolution.
      verificationFailed: verificationFailed,
    );
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String verificationCode,
    void Function() onSuccess,
  ) async {
    PhoneAuthCredential? credentials =
        store.state.userState.firebaseCredentials;
    final String verificationId = store.state.userState.verificationId ?? '';
    credentials ??= PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );

    return completeVerification(
      store,
      credentials,
      onSuccess,
      log.error,
    );
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> _reauthenticateUser({
    required AuthCredential credential,
  }) async {
    await firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
  }

  @override
  Future<void> reauthenticateUser({
    required Store<AppState> store,
    required void Function() reOnboardRequired,
    required dynamic Function(Exception) onFailure,
  }) async {
    if (store.state.userState.firebaseCredentials != null) {
      try {
        await _reauthenticateUser(
          credential: store.state.userState.firebaseCredentials!,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          return reOnboardRequired();
        }
        log.error(
            'Error whilst reauthenticating using Firebase Credentials from persistent store. $e');
        return onFailure(e);
      } on Exception catch (e) {
        return onFailure(e);
      }
    } else {
      return reOnboardRequired();
    }
  }

  Future<void> completeVerification(
    Store<AppState> store,
    PhoneAuthCredential credentials,
    void Function() onSuccess,
    void Function(String) onFailure,
  ) async {
    store.dispatch(SetFirebaseCredentials(credentials));
    final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(
      credentials,
    );
    final User? user = userCredential.user;
    final firebaseSessionToken = await user?.getIdToken();
    final User currentUser = firebaseAuth.currentUser!;
    assert(user?.uid == currentUser.uid, 'User IDs not same.');

    if (store.state.userState.email.isNotEmpty) {
      await currentUser.updateEmail(store.state.userState.email);
    }

    if (firebaseSessionToken == null) {
      return log.error(
          'Firebase did not authenticate user using phone auth credentials in onboarding');
    }
    try {
      final succeeded = await loginToVegi(
        store: store,
        phoneNumber: store.state.userState.phoneNumber,
        firebaseSessionToken: firebaseSessionToken,
      );
      if (succeeded) {
        onSuccess(); //! Bug one of these lines is killing my state
      } else {
        log.error('Could not login to vegi...');
      }
    } catch (e) {
      log.error(e.toString());
    }
  }

  Future<bool> loginToVegi({
    required Store<AppState> store,
    required String phoneNumber,
    required String firebaseSessionToken,
  }) async {
    try {
      // * sets the session cookie on the service class instance.
      final loggedIn = await peeplEatsService.loginWithPhone(
        phoneNumber: phoneNumber,
        firebaseSessionToken: firebaseSessionToken,
        rememberMe: true,
      );
      return loggedIn.sessionCookie.isNotEmpty;
    } catch (err) {
      log.error('Error: $err');
      return false;
    }
  }
}

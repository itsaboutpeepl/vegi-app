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
    void Function(dynamic error, UserAuthenticationStatus status) onError,
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
        (exception) {
          onError(
            exception,
            UserAuthenticationStatus.firebaseTFAFailed,
          );
        },
      );
    }

    Future<void> verificationFailed(FirebaseAuthException authException) async {
      log
        ..info('Phone number verification failed.')
        ..info('Code: ${authException.code}.')
        ..info('Message: ${authException.message}');
      onError(
        authException.message,
        UserAuthenticationStatus.firebasePhoneAuthFailed,
      );
    }

    // final confirmationResult = await firebaseAuth.signInWithPhoneNumber(
    //   phoneNumber!,
    // );

    // if(confirmationResult.confirm(verificationCode))
    if (phoneNumber != null) {
      store.dispatch(
        SetPhoneNumber(
          phoneNumber: phoneNumber,
        ),
      );
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: (String verificationId) {
          return onError(
            'Code verification timeout.',
            UserAuthenticationStatus.firebaseVerificationCodeTimedOut,
          );
        },
        codeSent: codeSent,
        verificationCompleted:
            verificationCompleted, // * This handler will only be called on Android devices which support automatic SMS code resolution.
        verificationFailed: verificationFailed,
      );
    } else {
      onError(
        'No phone number set...',
        UserAuthenticationStatus.firebaseNoPhoneNumberSet,
      );
    }
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String verificationCode,
    void Function() onSuccess,
    void Function(String message, UserAuthenticationStatus status) onError,
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
      (exception) {
        onError(
          exception,
          UserAuthenticationStatus.firebaseTFAFailed,
        );
      },
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
    void Function()? onSuccess,
    void Function(Exception error, UserAuthenticationStatus status)? onFailure,
    void Function()? reOnboardRequired,
  }) async {
    if (store.state.userState.firebaseSessionToken != null) {
      try {
        final succeeded = await loginToVegi(
          store: store,
          phoneNumber: store.state.userState.phoneNumber,
          firebaseSessionToken: store.state.userState.firebaseSessionToken!,
          onError: (s) => onFailure?.call(
            Exception(s),
            UserAuthenticationStatus.vegiLoginFailed,
          ),
        );
        if (succeeded) {
          store.dispatch(
            SetVerificationPassed(
              verificationPassed: true,
            ),
          );
          onSuccess?.call(); //! Bug one of these lines is killing my state
        } else {
          log.error('Could not login to vegi...');
          store.dispatch(
            ReauthenticateUserFailure(
              error: UserAuthenticationStatus.vegiLoginFailed,
            ),
          );
        }
      } on Exception catch (e) {
        onFailure?.call(
          e,
          UserAuthenticationStatus.vegiLoginFailed,
        );
      }
    } else if (store.state.userState.firebaseCredentials != null) {
      try {
        await _reauthenticateUser(
          credential: store.state.userState.firebaseCredentials!,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          return reOnboardRequired?.call();
        }
        log.error(
            'Error whilst reauthenticating using Firebase Credentials from persistent store. $e');
        return onFailure?.call(
          e,
          UserAuthenticationStatus.firebasePhoneAuthFailed,
        );
      } on Exception catch (e) {
        return onFailure?.call(
          e,
          UserAuthenticationStatus.firebasePhoneAuthFailed,
        );
      }
    } else {
      return reOnboardRequired?.call();
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
    store.dispatch(
      SetFirebaseSessionToken(
        firebaseSessionToken: firebaseSessionToken,
      ),
    );
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
        onError: onFailure,
      );
      if (succeeded) {
        store.dispatch(
          SetVerificationPassed(
            verificationPassed: true,
          ),
        );
        onSuccess(); //! Bug one of these lines is killing my state
      } else {
        log.error('Could not login to vegi...');
      }
    } catch (e) {
      onFailure(e.toString());
    }
  }

  Future<bool> loginToVegi({
    required Store<AppState> store,
    required String phoneNumber,
    required String firebaseSessionToken,
    required void Function(String message) onError,
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
      onError(err.toString());
      store.dispatch(
        SetFirebaseSessionToken(
          firebaseSessionToken: null,
        ),
      );
      return false;
    }
  }
}

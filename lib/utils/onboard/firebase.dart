import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/network/web3auth.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
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
    //TODO: Decide what to do with this call back from the verify_screen viewmodel...
    //what we could do is remove the callbacks and then have the screen itself
    //subscribe to changes to the userAuthentication state and navigate once
    //we have any state that includes firebase Authenticated, but limits functinoality
    //until we have vegi authenticated too, do we want to split the user state authentication
    //status into 3, firbease, vegi and fuse so that we can check each on its own?
    void Function(dynamic error, FirebaseAuthenticationStatus status) onError,
  ) async {
    store.dispatch(
      SetUserAuthenticationStatus(
        firebaseStatus: FirebaseAuthenticationStatus.loading,
      ),
    );
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
      );
    }

    Future<void> verificationFailed(FirebaseAuthException authException) async {
      log
        ..info('Phone number verification failed.')
        ..info('Code: ${authException.code}.')
        ..info('Message: ${authException.message}');
      onError(
        authException.message,
        FirebaseAuthenticationStatus.phoneAuthFailed,
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
            FirebaseAuthenticationStatus.verificationCodeTimedOut,
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
        FirebaseAuthenticationStatus.noPhoneNumberSet,
      );
    }
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String verificationCode,
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
  Future<bool> reauthenticateUser() async {
    final store = await reduxStore;
    if (store.state.userState.firebaseSessionToken != null) {
      try {
        final succeeded = await loginToVegi(
          store: store,
          phoneNumber: store.state.userState.phoneNumber,
          firebaseSessionToken: store.state.userState.firebaseSessionToken!,
        );
        if (succeeded) {
          store.dispatch(
            loggedInToVegiSuccess(
              onError: (errStr) {
                log.error(
                    'Unable to check vegi account & beta whitelist after logging in to vegi with error: $errStr');
              },
            ),
          );
          return true;
        } else if (store.state.userState.firebaseAuthenticationStatus ==
            FirebaseAuthenticationStatus.expired) {
          final creds = store.state.userState.firebaseCredentials;
          if (creds != null) {
            await _reauthenticateUser(
              credential: creds,
            );
          }
          return false;
        } else {
          log.error('Could not login to vegi...');
          store.dispatch(
            SetUserAuthenticationStatus(
              firebaseStatus: FirebaseAuthenticationStatus.authenticated,
              vegiStatus: VegiAuthenticationStatus.failed,
            ),
          );
          return false;
        }
      } on Exception catch (e) {
        log.error('Could not login to vegi...');
        store.dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.authenticated,
            vegiStatus: VegiAuthenticationStatus.failed,
          ),
        );
        return false;
      }
    } else if (store.state.userState.firebaseCredentials != null) {
      try {
        await _reauthenticateUser(
          credential: store.state.userState.firebaseCredentials!,
        );
        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          store.dispatch(
            SetUserAuthenticationStatus(
              firebaseStatus: FirebaseAuthenticationStatus.verificationFailed,
              vegiStatus: VegiAuthenticationStatus.unauthenticated,
            ),
          );
          return false;
        }
        log.error(
            'Error whilst reauthenticating using Firebase Credentials from persistent store. $e');
        store.dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.phoneAuthFailed,
            vegiStatus: VegiAuthenticationStatus.unauthenticated,
          ),
        );
        return false;
      } on Exception catch (e) {
        log.error(
          e,
          stackTrace: StackTrace.current,
        );
        store.dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.phoneAuthFailed,
            vegiStatus: VegiAuthenticationStatus.unauthenticated,
          ),
        );
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> completeVerification(
    Store<AppState> store,
    PhoneAuthCredential credentials,
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
    if (firebaseSessionToken == null) {
      log.error(
        'Firebase did not authenticate user using phone auth credentials in onboarding',
        stackTrace: StackTrace.current,
      );

      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus: FirebaseAuthenticationStatus.verificationFailed,
        ),
      );
      return;
    } else {
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus: FirebaseAuthenticationStatus.authenticated,
        ),
      );
      log.info('Firebase Authentication Succeeded!');
      unawaited(Analytics.track(
        eventName: AnalyticsEvents.verify,
        properties: {
          AnalyticsProps.status: AnalyticsProps.success,
        },
      )); //! Bug one of these lines is killing my state
    }
    final User currentUser = firebaseAuth.currentUser!;
    assert(user?.uid == currentUser.uid, 'User IDs not same.');

    if (store.state.userState.email.isNotEmpty &&
        (currentUser.email == null ||
            currentUser.email != store.state.userState.email)) {
      await currentUser.updateEmail(store.state.userState.email);
    }

    try {
      final succeeded = await loginToVegi(
        store: store,
        phoneNumber: store.state.userState.phoneNumber,
        firebaseSessionToken: firebaseSessionToken,
      );
      if (succeeded) {
        store
          ..dispatch(
            SetUserAuthenticationStatus(
              firebaseStatus: FirebaseAuthenticationStatus.authenticated,
              vegiStatus: VegiAuthenticationStatus.authenticated,
            ),
          )
          ..dispatch(
            loggedInToVegiSuccess(
              onError: (errStr) {
                log.error(
                    'Unable to check vegi account & beta whitelist after logging in to vegi with error: $errStr');
              },
            ),
          );
      } else {
        log.error('Could not login to vegi...');
        store.dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.authenticated,
            vegiStatus: VegiAuthenticationStatus.failed,
          ),
        );
      }
    } catch (e, s) {
      // onFailure(e.toString());
      log.error(e, stackTrace: s);
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus: FirebaseAuthenticationStatus.authenticated,
          vegiStatus: VegiAuthenticationStatus.failed,
        ),
      );
    }
  }

  Future<bool> loginToVegi({
    required Store<AppState> store,
    required String phoneNumber,
    required String firebaseSessionToken,
  }) async {
    try {
      store.dispatch(
        SetUserAuthenticationStatus(
          vegiStatus: VegiAuthenticationStatus.loading,
        ),
      );
      // * sets the session cookie on the service class instance.
      final loggedIn = await peeplEatsService.loginWithPhone(
        phoneNumber: phoneNumber,
        firebaseSessionToken: firebaseSessionToken,
        rememberMe: true,
      );
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus: FirebaseAuthenticationStatus.authenticated,
          vegiStatus: VegiAuthenticationStatus.authenticated,
        ),
      );
      return loggedIn.sessionCookie.isNotEmpty;
    } catch (err) {
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus: FirebaseAuthenticationStatus.authenticated,
          vegiStatus: VegiAuthenticationStatus.failed,
        ),
      );
      log
        ..error(
          err,
          stackTrace: StackTrace.current,
        )
        ..error(err.toString());
      store.dispatch(
        SetFirebaseSessionToken(
          firebaseSessionToken: null,
        ),
      );
      // log.info('Push SignUpScreen()');
      // rootRouter.replaceAll([const SignUpScreen()])
      return false;
    }
  }
}

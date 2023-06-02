import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

abstract class IOnBoardStrategy {
  // IOnBoardStrategy(this.strategy, this.authLayer);
  IOnBoardStrategy(this.strategy);

  final OnboardStrategy strategy;

  bool registeredEmailIs(String email);

  // final OnboardingAuthChain authLayer;

  Future<dynamic> login(
    Store<AppState> store,
    String? phoneNumber,
  );
  Future<dynamic> verify(
    Store<AppState> store,
    String verificationCode,
  );
  Future<void> verifyRecaptchaToken({
    String? recaptchaToken,
    String? deepLinkId,
  });
  Future<bool> reauthenticateUser();
  Future<bool> updateEmail({required String email});
  Future<LoggedInToVegiResult> loginToVegiWithPhone({
    required Store<AppState> store,
    required String phoneNumber,
    required String firebaseSessionToken,
  });
  Future<LoggedInToVegiResult> loginToVegiWithEmail({
    required Store<AppState> store,
    required String email,
    required String firebaseSessionToken,
  });

  Future<UserCredential?> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<bool> signInUserBySendingEmailLink({
    required String email,
  });
  Future<UserCredential?> signInUserFromVerificationLink({
    required String email,
    required String emailLinkFromVerificationEmail,
  });
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithApple();
}

class OnBoardStrategyFactory {
  static IOnBoardStrategy create(String strategy) {
    if (strategy == 'firebase') {
      return FirebaseStrategy();
    } else {
      final err = UnsupportedError(
          '`$strategy` onboarding strategy no longer supported');
      Sentry.captureException(
        err,
        stackTrace: StackTrace.current,
      );
      throw err;
      // } else if (strategy == 'vegi') {
      //   return VegiOnboardStrategy();
    }
  }
}

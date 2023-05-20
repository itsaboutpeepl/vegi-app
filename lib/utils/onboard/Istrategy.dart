import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

abstract class IOnBoardStrategy {
  // IOnBoardStrategy(this.strategy, this.authLayer);
  IOnBoardStrategy(this.strategy);

  final OnboardStrategy strategy;

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
  Future<LoggedInToVegiResult> loginToVegi({
    required Store<AppState> store,
    required String phoneNumber,
    required String firebaseSessionToken,
  });
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

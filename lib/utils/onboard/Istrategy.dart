import 'dart:ui';

import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/utils/auth/vegi_auth_layer.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';
import 'package:vegan_liverpool/utils/onboard/simple.dart';
import 'package:vegan_liverpool/utils/onboard/sms.dart';

import 'vegiOnboardStrategy.dart';

abstract class IOnBoardStrategy {
  final OnboardStrategy strategy;

  final OnboardingAuthChain authLayer;

  Future<dynamic> login(
    Store<AppState> store,
    String phoneNumber,
    VoidCallback onSuccess,
    Function(dynamic error) onError,
  );
  Future<dynamic> verify(Store<AppState> store, String verificationCode,
      Function(String) onSuccess);

  IOnBoardStrategy(this.strategy, this.authLayer);
}

class OnBoardStrategyFactory {
  static IOnBoardStrategy create(String strategy) {
    if (strategy == 'firebase') {
      return FirebaseStrategy();
    } else if (strategy == 'sms') {
      return SmsStrategy();
    } else if (strategy == 'vegi') {
      return VegiOnboardStrategy();
    } else {
      return SimpleStrategy();
    }
  }
}

import 'dart:ui';

import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';
import 'package:vegan_liverpool/utils/onboard/simple.dart';
import 'package:vegan_liverpool/utils/onboard/sms.dart';

import 'vegiOnboardStrategy.dart';

abstract class IOnBoardStrategy {
  final OnboardStrategy strategy;

  Future<dynamic> login(
    store,
    phoneNumber,
    VoidCallback onSuccess,
    Function(dynamic error) onError,
  );
  Future<dynamic> verify(store, verificationCode, onSuccess);

  IOnBoardStrategy(this.strategy);
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

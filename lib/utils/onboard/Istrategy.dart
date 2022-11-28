import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';
import 'package:vegan_liverpool/utils/onboard/simple.dart';
import 'package:vegan_liverpool/utils/onboard/sms.dart';

abstract class IOnBoardStrategy {
  // IOnBoardStrategy(this.strategy, this.authLayer);
  IOnBoardStrategy(this.strategy);

  final OnboardStrategy strategy;

  // final OnboardingAuthChain authLayer;

  Future<dynamic> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  );
  Future<dynamic> verify(
    Store<AppState> store,
    String verificationCode,
    void Function(String jwtToken) onSuccess,
  );
}

class OnBoardStrategyFactory {
  static IOnBoardStrategy create(String strategy) {
    if (strategy == 'firebase') {
      return FirebaseStrategy();
    } else if (strategy == 'sms') {
      return SmsStrategy();
      // } else if (strategy == 'vegi') {
      //   return VegiOnboardStrategy();
    } else {
      return SimpleStrategy();
    }
  }
}

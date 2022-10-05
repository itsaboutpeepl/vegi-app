import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/onboarding_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class SmsStrategy implements IOnBoardStrategy {
  @override
  final OnboardStrategy strategy;
  SmsStrategy({this.strategy = OnboardStrategy.sms});

  final authLayer = OnboardingAuthChain.createEmpty();

  @override
  Future login(
    Store<AppState> store,
    String phoneNumber,
    Function onSuccess,
    Function(dynamic error) onError,
  ) async {
    await walletApi.loginWithSMS(phoneNumber);
    rootRouter.push(VerifyPhoneNumber());
    onSuccess();
  }

  @override
  Future verify(Store<AppState> store, String verificationCode,
      Function(String) onSuccess) async {
    final String? jwtToken = store.state.userState.jwtToken.isNotEmpty &&
            store.state.userState.vegiSessionCookie.isNotEmpty
        ? store.state.userState.jwtToken
        : await authLayer.signin(
            phoneNumber: store.state.userState.phoneNumber,
            verificationCode: verificationCode,
            store: store,
            refreshCredentials: () => false,
            onError: ((errorMsg) => log.error(errorMsg)));
    onSuccess(jwtToken ?? store.state.userState.jwtToken);
  }
}

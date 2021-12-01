import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';
import 'package:vegan_liverpool/constants/strings.dart';

class SmsStrategy implements IOnBoardStrategy {
  final OnboardStrategy strategy;
  SmsStrategy({this.strategy = OnboardStrategy.sms});

  @override
  Future login(
    store,
    phoneNumber,
  ) async {
    await api.loginWithSMS(
      phoneNumber,
    );
    store.dispatch(SetIsLoginRequest(isLoading: false));
    rootRouter.push(VerifyPhoneNumber());
  }

  @override
  Future verify(store, verificationCode, onSuccess) async {
    final String phoneNumber = store.state.userState.phoneNumber;
    final String accountAddress = store.state.userState.accountAddress;
    final String jwtToken = await api.verifySMS(
      verificationCode,
      phoneNumber,
      accountAddress,
      appName: Strings.appName,
    );
    onSuccess(jwtToken);
  }
}

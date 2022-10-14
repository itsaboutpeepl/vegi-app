import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class SmsStrategy implements IOnBoardStrategy {
  @override
  final OnboardStrategy strategy;
  SmsStrategy({this.strategy = OnboardStrategy.sms});

  @override
  Future login(
    store,
    phoneNumber,
    Function onSuccess,
    Function(dynamic error) onError,
  ) async {
    await chargeApi.loginWithSMS(phoneNumber);
    rootRouter.push(VerifyPhoneNumber());
    onSuccess();
  }

  @override
  Future verify(store, verificationCode, onSuccess) async {
    final String phoneNumber = store.state.userState.phoneNumber;
    final String accountAddress = store.state.userState.accountAddress;
    final String jwtToken = await chargeApi.verifySMS(
      verificationCode,
      phoneNumber,
      accountAddress,
    );
    onSuccess(jwtToken);
  }
}

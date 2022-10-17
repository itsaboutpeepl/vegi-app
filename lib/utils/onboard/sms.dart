import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class SmsStrategy implements IOnBoardStrategy {
  SmsStrategy({this.strategy = OnboardStrategy.sms});

  @override
  final OnboardStrategy strategy;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    await chargeApi.loginWithSMS(phoneNumber ?? '');
    onSuccess();
    await rootRouter.push(VerifyPhoneNumber());
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String? verificationCode,
    void Function(String) onSuccess,
  ) async {
    final String phoneNumber = store.state.userState.phoneNumber;
    final String accountAddress = store.state.userState.accountAddress;
    final String jwtToken = await chargeApi.verifySMS(
      verificationCode ?? '',
      phoneNumber,
      accountAddress,
    );
    onSuccess(jwtToken);
  }
}

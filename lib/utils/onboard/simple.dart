import 'package:flutter_segment/flutter_segment.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';
import 'package:vegan_liverpool/constants/strings.dart';

class SimpleStrategy implements IOnBoardStrategy {
  final OnboardStrategy strategy;
  SimpleStrategy({this.strategy = OnboardStrategy.none});

  @override
  Future login(store, phoneNumber) async {
    final String accountAddress = store.state.userState.accountAddress;
    final jwtToken = await walletApi.requestToken(
      phoneNumber,
      accountAddress,
      appName: Strings.appName,
    );
    store.dispatch(LoginVerifySuccess(jwtToken));
    store.dispatch(SetIsVerifyRequest(isLoading: false));
    Segment.track(
      eventName: 'Sign up: VerificationCode_NextBtn_Press',
    );
    rootRouter.push(UserNameScreen());
  }

  @override
  Future verify(store, verificationCode, onSuccess) async {
    // No need
  }
}

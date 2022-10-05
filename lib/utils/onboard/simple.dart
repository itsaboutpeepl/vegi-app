import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/onboarding_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class SimpleStrategy implements IOnBoardStrategy {
  @override
  final OnboardStrategy strategy;
  SimpleStrategy({this.strategy = OnboardStrategy.none});

  final authLayer = OnboardingAuthChain.createEmpty();

  @override
  Future login(
    Store<AppState> store,
    String phoneNumber,
    Function onSuccess,
    Function(dynamic error) onError,
  ) async {
    final String accountAddress = store.state.userState.accountAddress;
    final jwtToken = await walletApi.requestToken(
      phoneNumber,
      accountAddress,
    );
    log.info('jwtToken $jwtToken');
    store.dispatch(LoginVerifySuccess(jwtToken));
    walletApi.setJwtToken(jwtToken);
    Segment.track(
      eventName: 'Sign up: VerificationCode_NextBtn_Press',
    );
    rootRouter.push(UserNameScreen());
    onSuccess();
  }

  @override
  Future verify(Store<AppState> store, String verificationCode,
      Function(String) onSuccess) async {
    // No need
  }
}

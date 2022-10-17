import 'package:flutter_segment/flutter_segment.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

class SimpleStrategy implements IOnBoardStrategy {
  SimpleStrategy({this.strategy = OnboardStrategy.none});

  @override
  final OnboardStrategy strategy;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    final String accountAddress = store.state.userState.accountAddress;
    final jwtToken = await chargeApi.requestToken(
      phoneNumber ?? '',
      accountAddress,
    );

    log.info('jwtToken $jwtToken');
    store.dispatch(LoginVerifySuccess(jwtToken));
    chargeApi.setJwtToken(jwtToken);

    await Segment.track(
      eventName: 'Sign up: VerificationCode_NextBtn_Press',
    );
    await rootRouter.push(UserNameScreen());
    onSuccess();
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String? verificationCode,
    void Function(String) onSuccess,
  ) async {
    throw UnimplementedError();
  }
}

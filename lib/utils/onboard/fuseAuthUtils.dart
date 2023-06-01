import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/signUpErrorDetails.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

Future<bool> authenticateSDK(Store<AppState> store) async {
  final EthPrivateKey credentials =
      EthPrivateKey.fromHex(store.state.userState.privateKey);
  final DC<Exception, String> authRes = await fuseWalletSDK.authenticate(
    credentials,
  );
  if (authRes.hasData) {
    final jwt = authRes.data!;
    store
      ..dispatch(LoginVerifySuccess(jwt))
      ..dispatch(
        SetUserAuthenticationStatus(
          fuseStatus: FuseAuthenticationStatus.created,
        ),
      );
    fuseWalletSDK.jwtToken = jwt;
    return true;
  } else if (authRes.hasError) {
    store
      ..dispatch(
        SetUserAuthenticationStatus(
          fuseStatus: FuseAuthenticationStatus.failedAuthentication,
        ),
      )
      ..dispatch(
        SignupFailed(
          error: SignUpErrorDetails(
            title: 'Fuse authentication failed',
            message: 'Error occurred in authenticate: ${authRes.error}',
          ),
        ),
      );
    return false;
  } else {
    store.dispatch(
      SetUserAuthenticationStatus(
        fuseStatus: FuseAuthenticationStatus.failedAuthentication,
      ),
    );
    final s = StackTrace.current;
    final errMsg =
        'Bad AuthRes from Fuse Authentication did not contain either data or an error';
    log.error(errMsg, stackTrace: s);
    await Sentry.captureException(
      errMsg,
      stackTrace: s, // from catch (err, s)
      hint: 'ERROR - fuaseAuthUtils.authenticateSDK $errMsg',
    );
    return false;
  }
}

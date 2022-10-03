import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class FUSEWalletApiLayer {
  FUSEWalletApiLayer();

  String _jwtToken = '';

  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn && _jwtToken != '';

  void setJwtToken(String token) {
    _jwtToken = token;
  }

  String getJwtToken() {
    return _jwtToken;
  }

  Future<String?> loginWithFirebase(
      {required String firebaseToken,
      required String walletAddress,
      required String identifier,
      required String firebaseAppName,
      required void Function(String errMessage) onError}) async {
    String? jwtToken;
    try {
      jwtToken = await walletApi.loginWithFirebase(
        firebaseToken,
        walletAddress,
        identifier,
        appName: firebaseAppName,
      );
      setJwtToken(jwtToken);
      _loggedIn = true;
      log.info('jwtToken $jwtToken');
    } catch (e) {
      onError(
          'The FUSE walletApi.loginWithFirebase call failed. Contact FUSE to connect vegiliverpool app to FUSE firebase api.');
    }
    return jwtToken;
  }
}

bool setJwtTokenApp(Store<AppState> store) {
  final String jwtToken = store.state.userState.jwtToken;
  if (![null, ''].contains(jwtToken)) {
    log.info('JWT: $jwtToken');
    walletApi.setJwtToken(jwtToken);
    store.dispatch(setUpFuseWeb3());
    return true;
  }
  return false;
}

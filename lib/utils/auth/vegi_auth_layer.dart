import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/admin/user.dart' as VegiUser;
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

Future<String?> vegiAuthChain(
    {required String phoneNumber,
    required PhoneAuthCredential credentials,
    required Store<AppState> store,
    required Function() refreshCredentials,
    required void Function(String errorMsg) onError}) async {
  String? token =
      await firebaseSignInWithPhoneCreds(credentials, refreshCredentials);
  if (token == null) {
    return null;
  }

  final String accountAddress = store.state.userState.accountAddress;
  final String firebaseIdentifier = store.state.userState.identifier;

  String? jwtToken;
  if (fUSEWalletApiLayer.isLoggedIn) {
    jwtToken = fUSEWalletApiLayer.getJwtToken();
  } else {
    jwtToken = await fUSEWalletApiLayer.loginWithFirebase(
        firebaseToken: token,
        walletAddress: accountAddress,
        identifier: firebaseIdentifier,
        firebaseAppName: 'vegiliverpool',
        onError: onError);
  }

  VegiUser.User? vegiUser;
  try {
    vegiUser = await peeplEatsService.signIn(
        phoneNumber: phoneNumber, firebaseSessionToken: token);
  } catch (e) {
    onError('Vegi Backend Signin Failed: $e');
  }

  log.info('user.id ${vegiUser?.id}');

  return jwtToken;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegan_liverpool/models/admin/user.dart' as VegiUser;
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/auth/firebase_auth_layer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

Future<String?> vegiAuthChain(
    {required String phoneNumber,
    required PhoneAuthCredential credentials,
    required String accountAddress,
    required String firebaseIdentifier,
    required Function() refreshCredentials,
    required void Function(String errorMsg) onError}) async {
  String? token =
      await firebaseSignInWithPhoneCreds(credentials, refreshCredentials);
  if (token == null) {
    return null;
  }

  String? jwtToken;
  if (!fUSEWalletApiLayer.isLoggedIn) {
    jwtToken = await fUSEWalletApiLayer.loginWithFirebase(
        firebaseToken: token,
        walletAddress: accountAddress,
        identifier: firebaseIdentifier,
        firebaseAppName: 'vegiliverpool',
        onError: onError);
  } else {
    jwtToken = fUSEWalletApiLayer.getJwtToken();
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

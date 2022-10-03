import 'package:firebase_auth/firebase_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

Future<String?> firebaseSignInWithPhoneCreds(
    PhoneAuthCredential credential, Function() refreshCredentials) async {
  try {
    UserCredential userCredential = await firebaseAuth.signInWithCredential(
      credential,
    );
    log.info('Signin with firebase phone creds succeeded');
    final User? currentUser = firebaseAuth.currentUser;
    assert(userCredential.user?.uid == currentUser?.uid);
    final String token = await userCredential.user!.getIdToken();
    return token;
  } on FirebaseAuthException catch (e, s) {
    if (e.code == 'session_expired') {
      log.error(e);
      refreshCredentials();
    } else {
      log.error('ERROR - Failed to Signin with firebase phone credentials: $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - FirebaseSignIn with Phone Credential $e',
      );
    }
  } on Exception catch (e, s) {
    log.error('ERROR - Failed to Signin with firebase phone credentials: $e');
    await Sentry.captureException(
      e,
      stackTrace: s,
      hint: 'ERROR - FirebaseSignIn with Phone Credential $e',
    );
  }
  return null;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';

class SignupLoading {
  SignupLoading({
    required this.isLoading,
  });

  final bool isLoading;

  @override
  String toString() {
    return 'SignupLoading : isLoading:"$isLoading"';
  }
}

class SignupFailed {
  SignupFailed({
    required this.error,
  });

  final ErrorDetails error;

  @override
  String toString() {
    return 'SignupFailed : error:"$error"';
  }
}

class SetConflictingFirebaseCredentials {
  SetConflictingFirebaseCredentials({
    required this.conflictingEmail,
    required this.conflictingCredentials,
  });

  final String conflictingEmail;
  final AuthCredential conflictingCredentials;

  @override
  String toString() {
    return 'SetConflictingFirebaseCredentials : conflictingEmail:"$conflictingEmail"';
  }
}

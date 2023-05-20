import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

class VerifyEmailLinkViewModel extends Equatable {
  const VerifyEmailLinkViewModel({
    required this.userIsVerified,
    required this.conflictingEmail,
    required this.conflictingCredentials,
    required this.linkConflictingFirebaseCredentials,
  });

  factory VerifyEmailLinkViewModel.fromStore(Store<AppState> store) {
    return VerifyEmailLinkViewModel(
        userIsVerified: store.state.userState.userIsVerified,
        conflictingEmail: store.state.onboardingState.conflictingEmail,
        conflictingCredentials:
            store.state.onboardingState.conflictingCredentials,
        linkConflictingFirebaseCredentials: (
            {required String emailLinkFromVerificationEmail,}) async {
          if (onBoardStrategy is FirebaseStrategy) {
            final firebaseOnBoardStrategy = onBoardStrategy as FirebaseStrategy;
            final email = store.state.onboardingState.conflictingEmail;
            final pendingCredential =
              store.state.onboardingState.conflictingCredentials;
            if (email == null || pendingCredential == null) {
              await firebaseOnBoardStrategy
                .emailLinkCallbackFromVerificationEmail(
                emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
              );
            } else {
              await firebaseOnBoardStrategy
                  .linkAccountsFromEmailLinkCallbackFromVerificationEmail(
                email: email,
                pendingCredential: pendingCredential,
                emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
              );
            }
          }
        },);
  }

  final bool userIsVerified;
  final String? conflictingEmail;
  final AuthCredential? conflictingCredentials;

  final Future<void> Function({required String emailLinkFromVerificationEmail,})
      linkConflictingFirebaseCredentials;

  @override
  List<Object?> get props => [
        userIsVerified,
      ];
}

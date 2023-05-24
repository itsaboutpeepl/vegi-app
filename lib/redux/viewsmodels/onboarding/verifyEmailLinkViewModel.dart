import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/signUpErrorDetails.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

class VerifyEmailLinkViewModel extends Equatable {
  const VerifyEmailLinkViewModel({
    required this.userIsVerified,
    required this.conflictingEmail,
    required this.conflictingCredentials,
    required this.signInWithEmailLinkCallback,
    required this.linkConflictingFirebaseCredentials,
  });

  factory VerifyEmailLinkViewModel.fromStore(Store<AppState> store) {
    return VerifyEmailLinkViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      conflictingEmail: store.state.onboardingState.conflictingEmail,
      conflictingCredentials:
          store.state.onboardingState.conflictingCredentials,
      signInWithEmailLinkCallback: ({
        required String emailAddress,
        required String emailLinkFromVerificationEmail,
      }) async {
        if (onBoardStrategy is FirebaseStrategy) {
          final firebaseOnBoardStrategy = onBoardStrategy as FirebaseStrategy;
          final email = emailAddress;
          await firebaseOnBoardStrategy.signInUserFromVerificationLink(
            email: email,
            emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
          );
        }
      },
      linkConflictingFirebaseCredentials: ({
        required String emailLinkFromVerificationEmail,
      }) async {
        if (onBoardStrategy is FirebaseStrategy) {
          final firebaseOnBoardStrategy = onBoardStrategy as FirebaseStrategy;
          final email = store.state.onboardingState.conflictingEmail;
          final pendingCredential =
              store.state.onboardingState.conflictingCredentials;
          if (email == null || pendingCredential == null) {
            store.dispatch(SignupFailed(
                error: SignUpErrorDetails(
              title: Messages.signInFailed,
              message: Messages.signInFailedEmailLinkMessage,
              code: SignUpErrCode.invalidEmail,
            ),),);
            return;
          } else {
            await firebaseOnBoardStrategy
                .linkAccountsFromEmailLinkCallbackFromVerificationEmail(
              email: email,
              pendingCredential: pendingCredential,
              emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
            );
          }
        }
      },
    );
  }

  final bool userIsVerified;
  final String? conflictingEmail;
  final AuthCredential? conflictingCredentials;

  final Future<void> Function({
    required String emailLinkFromVerificationEmail,
  }) linkConflictingFirebaseCredentials;
  final Future<void> Function({
    required String emailAddress,
    required String emailLinkFromVerificationEmail,
  }) signInWithEmailLinkCallback;

  @override
  List<Object?> get props => [
        userIsVerified,
      ];
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart' as VegiConstants;

class FirebaseAuthLinkViewModel extends Equatable {
  const FirebaseAuthLinkViewModel({
    required this.userIsVerified,
    required this.displayName,
    required this.email,
    required this.verificationId,
    required this.firebaseCredentials,
    required this.biometricAuth,
    required this.signupIsInFlux,
    required this.setSignupFailed,
    required this.setLoading,
    required this.setDisplayName,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.handleFirebaseAuthReCaptchaWebHook,
  });

  factory FirebaseAuthLinkViewModel.fromStore(Store<AppState> store) {
    return FirebaseAuthLinkViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      displayName: store.state.userState.displayName,
      email: store.state.userState.email,
      verificationId: store.state.userState.verificationId,
      firebaseCredentials: store.state.userState.firebaseCredentials,
      biometricAuth: store.state.userState.authType,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      signupIsInFlux: store.state.onboardingState.signupIsInFlux,
      setSignupFailed: (error) {
        store.dispatch(
          SignupFailed(
            error: error,
          ),
        );
      },
      setLoading: (isLoading) {
        store.dispatch(
          SignupLoading(
            isLoading: isLoading,
          ),
        );
      },
      setDisplayName: ({required displayName}) {
        isAuthenticatedRouteGuard = true;
        store
          ..dispatch(SetDisplayName(displayName))
          ..dispatch(
            authenticate(
                // todo confirm that this flow still works to initialise the new smartWallet
                // () {},
                ),
          );
        unawaited(Analytics.track(eventName: AnalyticsEvents.fillUserName));
      },
      handleFirebaseAuthReCaptchaWebHook: ({
        required recaptchaToken,
        required deepLinkId,
      }) async {
        return recaptchaToken == null
            ? null
            : onBoardStrategy.verifyRecaptchaToken(
                recaptchaToken: recaptchaToken,
                deepLinkId: deepLinkId,
              );
      },
    );
  }

  final bool userIsVerified;
  final String displayName;
  final String email;
  final String? verificationId;
  final AuthCredential? firebaseCredentials;
  final BiometricAuth biometricAuth;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final bool signupIsInFlux;
  final dynamic Function(
    ErrorDetails error,
  ) setSignupFailed;
  final dynamic Function(
    bool isLoading,
  ) setLoading;
  final void Function({required String displayName}) setDisplayName;
  final Future<void> Function({
    required String? recaptchaToken,
    required String? deepLinkId,
  }) handleFirebaseAuthReCaptchaWebHook;

  bool get displayNameIsSet =>
      displayName != '' && displayName != VegiConstants.defaultDisplayName;

  bool get biometricAuthIsSet => biometricAuth != BiometricAuth.none;

  bool get emailIsSet => email.isNotEmpty;

  @override
  List<Object?> get props => [
        userIsVerified,
        displayName,
        email,
        verificationId,
        biometricAuth,
        firebaseAuthenticationStatus,
        signupIsInFlux,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
      ];
}

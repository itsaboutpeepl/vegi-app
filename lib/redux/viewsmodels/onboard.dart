import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart' as VegiConstants;

class VerifyOnboardViewModel extends Equatable {
  const VerifyOnboardViewModel({
    required this.countryCode,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.biometricAuth,
    required this.verificationId,
    required this.firebaseCredentials,
    required this.verify,
    required this.setDisplayName,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
  });

  factory VerifyOnboardViewModel.fromStore(Store<AppState> store) {
    final UserState userState = store.state.userState;
    return VerifyOnboardViewModel(
      countryCode: store.state.userState.countryCode,
      phoneNumber: store.state.userState.phoneNumber,
      displayName: store.state.userState.displayName,
      email: store.state.userState.email,
      verificationId: store.state.userState.verificationId,
      biometricAuth: store.state.userState.authType,
      firebaseCredentials: userState.firebaseCredentials,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      verify: (
        String verificationCode,
        void Function(dynamic error) onError,
      ) {
        store.dispatch(
          verifyHandler(
            verificationCode,
            onError,
          ),
        );
      },
      setDisplayName: ({required displayName}) {
        isAuthenticatedRouteGuard = true;
        store
          ..dispatch(SetDisplayName(displayName))
          ..dispatch(
            createLocalAccountCall(
              // todo confirm that this flow still works to initialise the new smartWallet
              () {},
            ),
          );
        unawaited(Analytics.track(eventName: AnalyticsEvents.fillUserName));
      },
    );
  }

  final String countryCode;
  final String phoneNumber;
  final String displayName;
  final String email;
  final String? verificationId;
  final PhoneAuthCredential? firebaseCredentials;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final BiometricAuth biometricAuth;
  final dynamic Function(
    String code,
    dynamic Function(dynamic error) onError,
  ) verify;
  final void Function({required String displayName}) setDisplayName;

  bool get displayNameIsSet =>
      displayName != '' && displayName != VegiConstants.defaultDisplayName;

  bool get biometricAuthIsSet => biometricAuth != BiometricAuth.none;

  bool get emailIsSet => email.isNotEmpty;

  @override
  List<Object?> get props => [
        countryCode,
        phoneNumber,
        displayName,
        email,
        biometricAuth,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
      ];
}

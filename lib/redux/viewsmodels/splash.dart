import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SplashViewModel extends Equatable implements IAuthViewModel {
  const SplashViewModel({
    required this.privateKey,
    required this.jwtToken,
    required this.isLoggedOut,
    required this.accountDetailsExist,
    required this.email,
    required this.accountCreated,
    required this.logout,
    required this.initFuse,
    required this.surveyCompleted,
    required this.resetSurveyCompleted,
    required this.isWhiteListedAccount,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.firebaseAuthCredential,
    required this.firebaseAuthCredIsSet,
  });

  factory SplashViewModel.fromStore(Store<AppState> store) {
    return SplashViewModel(
      privateKey: store.state.userState.privateKey,
      jwtToken: store.state.userState.jwtToken,
      isLoggedOut: store.state.userState.isLoggedOut ||
          store.state.userState.jwtToken == '',
      accountDetailsExist: store.state.userState.accountDetailsExist,
      isWhiteListedAccount: store.state.userState.userIsVerified,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      firebaseAuthCredential: store.state.userState.firebaseCredentials,
      firebaseAuthCredIsSet: store.state.userState.firebaseCredentialIsValid,
      email: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress
          .isNotEmpty, //! BUG to do with jwt token not used to init fuse wallet ->
      logout: () {
        store.dispatch(LogoutRequestSuccess());
      },
      initFuse: () {
        store.dispatch(
          authenticate(),
        );
      }, //TODO: SignUpButtons uses this which needs to not do entire auth flow, but the authenticate action should auto push the signupScreen as from signup, if user selects CreateAccount, the authenticate flow should successfully init the fuse wallet and then fail on firebase part as we should ensure the createAccount action presets the firebaseCReds to empty.
      resetSurveyCompleted: () {
        store.dispatch(ResetSurveyCompleted());
      },
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String privateKey;
  final String jwtToken;
  final bool isLoggedOut;
  final bool accountDetailsExist;
  final bool surveyCompleted;
  final bool isWhiteListedAccount;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final AuthCredential? firebaseAuthCredential;
  final bool firebaseAuthCredIsSet;
  final String email;
  final bool accountCreated;
  final void Function() logout;
  final void Function() resetSurveyCompleted;
  final void Function() initFuse;

  bool get isLoggedIn => !isLoggedOut && accountDetailsExist;
  bool get accountIsWaitlisted => surveyCompleted && !isWhiteListedAccount;

  @override
  List<Object?> get props => [
        email,
        accountCreated,
        privateKey,
        jwtToken,
        isLoggedOut,
        accountDetailsExist,
        surveyCompleted,
        isWhiteListedAccount,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
        firebaseAuthCredential,
        firebaseAuthCredIsSet,
      ];
}

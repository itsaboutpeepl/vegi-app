import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

import '../../common/router/routes.gr.dart';

class BackupViewModel extends Equatable {
  const BackupViewModel({
    required this.backupWallet,
    required this.userMnemonic,
  });

  factory BackupViewModel.fromStore(Store<AppState> store) {
    return BackupViewModel(
      userMnemonic: store.state.userState.mnemonic,
      backupWallet: () {
        store.dispatch(
          BackupSuccess(),
        );
      },
    );
  }

  final void Function() backupWallet;
  final List<String> userMnemonic;

  @override
  List<Object?> get props => [userMnemonic];
}

class LockScreenViewModel extends Equatable implements IAuthViewModel {
  const LockScreenViewModel({
    required this.pincode,
    required this.loginAgain,
    required this.loggedIn,
    required this.signupInFlux,
    required this.biometricAuth,
    required this.biometricallyAuthenticated,
    required this.setBiometricallyAuthenticated,
    required this.loginToVegi,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.notAuthenticated,
  });

  factory LockScreenViewModel.fromStore(Store<AppState> store) {
    return LockScreenViewModel(
      pincode: store.state.userState.pincode,
      loggedIn: !store.state.userState.isLoggedOut,
      signupInFlux: store.state.onboardingState.signupIsInFlux,
      biometricAuth: store.state.userState.authType,
      biometricallyAuthenticated:
          store.state.userState.biometricallyAuthenticated,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      setBiometricallyAuthenticated: (
          {required bool isBiometricallyAuthenticated}) {
        store.dispatch(
          SetBiometricallyAuthenticated(
            isBiometricallyAuthenticated: isBiometricallyAuthenticated,
          ),
        );
      },
      loginToVegi: () async {
        if (store.state.userState.firebaseSessionToken == null) {
          return false;
        }
        store.dispatch(
          SignupLoading(
            isLoading: true,
          ),
        );
        final result = await onBoardStrategy.loginToVegi(
          store: store,
          phoneNumber: store.state.userState.phoneNumber,
          firebaseSessionToken: store.state.userState.firebaseSessionToken!,
        );
        store.dispatch(
          SignupLoading(
            isLoading: false,
          ),
        );
        return result == LoggedInToVegiResult.success;
      },
      loginAgain: () {
        store.dispatch(
          reLoginCall(),
        );
      },
      notAuthenticated: store.state.userState.isLoggedOut || store.state.userState.fuseAuthenticationStatus != FuseAuthenticationStatus.authenticated || store.state.userState.firebaseAuthenticationStatus != FirebaseAuthenticationStatus.authenticated,
    );
  }

  final String pincode;
  final bool loggedIn;
  final bool signupInFlux;
  final bool notAuthenticated;
  final BiometricAuth biometricAuth;
  final bool biometricallyAuthenticated;
  final Future<bool> Function() loginToVegi;
  final void Function() loginAgain;
  final void Function({required bool isBiometricallyAuthenticated})
      setBiometricallyAuthenticated;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;

  @override
  List<Object?> get props => [
        pincode,
        loggedIn,
        signupInFlux,
        biometricallyAuthenticated,
        biometricAuth,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
      ];
}

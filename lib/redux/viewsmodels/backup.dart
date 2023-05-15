import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

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
    required this.biometricAuth,
    required this.biometricallyAuthenticated,
    required this.setBiometricallyAuthenticated,
    required this.reauthenticateUserWithVegi,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
  });

  factory LockScreenViewModel.fromStore(Store<AppState> store) {
    return LockScreenViewModel(
      pincode: store.state.userState.pincode,
      loggedIn: !store.state.userState.isLoggedOut,
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
      reauthenticateUserWithVegi: () async {
        return onBoardStrategy.reauthenticateUser();
      },
      loginAgain: () {
        store.dispatch(
          reLoginCall(),
        );
      },
    );
  }

  final String pincode;
  final bool loggedIn;
  final BiometricAuth biometricAuth;
  final bool biometricallyAuthenticated;
  final Future<bool> Function() reauthenticateUserWithVegi;
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
        biometricallyAuthenticated,
        biometricAuth,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
      ];
}

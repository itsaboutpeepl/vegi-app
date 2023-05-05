import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
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

class LockScreenViewModel extends Equatable {
  const LockScreenViewModel({
    required this.pincode,
    required this.loginAgain,
    required this.biometricAuth,
    required this.userAuthenticationStatus,
    required this.fuseWalletCreationStatus,
  });

  factory LockScreenViewModel.fromStore(Store<AppState> store) {
    return LockScreenViewModel(
      pincode: store.state.userState.pincode,
      biometricAuth: store.state.userState.authType,
      userAuthenticationStatus: store.state.userState.userAuthenticationStatus,
      fuseWalletCreationStatus: store.state.userState.fuseWalletCreationStatus,
      loginAgain: () {
        store.dispatch(
          reLoginCall(
            reOnboardRequired: () {
              if (DebugHelpers.inDebugMode) {
                log.verbose('Reauthentication of user requires reonboarding');
              }
              rootRouter.push(const SignUpScreen());
            },
          ),
        );
      },
    );
  }

  final String pincode;
  final BiometricAuth biometricAuth;
  final void Function() loginAgain;
  final UserAuthenticationStatus userAuthenticationStatus;
  final FuseWalletCreationStatus fuseWalletCreationStatus;

  @override
  List<Object?> get props => [
    pincode, 
    biometricAuth,
    userAuthenticationStatus,
    fuseWalletCreationStatus,
  ];
}

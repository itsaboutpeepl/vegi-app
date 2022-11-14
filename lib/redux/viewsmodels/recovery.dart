import 'dart:core';

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';

class RecoveryViewModel {
  RecoveryViewModel({
    required this.generateWalletFromBackup,
    required this.validateWalletRecoveryPhrase,
  });

  factory RecoveryViewModel.fromStore(Store<AppState> store) {
    return RecoveryViewModel(
      generateWalletFromBackup: (
        mnemonic,
        VoidCallback successCallback,
        VoidCallback failureCallback,
      ) {
        store.dispatch(
          restoreWalletCall(
            mnemonic
                .replaceAll(RegExp(r'[^A-Za-z0-9\s]'), '')
                .split(RegExp(r'\s'))
                .toList(),
            successCallback,
            failureCallback,
          ),
        );
      },
      validateWalletRecoveryPhrase: (mnemonic) {
        final validMnemonicRE =
            RegExp(r'[^A-Za-z0-9\s]').allMatches(mnemonic).isEmpty;
        final validMnemonicWeb3 = Web3.validateMnemonic(mnemonic);
        return validMnemonicRE && validMnemonicWeb3;
      },
    );
  }

  final void Function(
    String,
    VoidCallback successCallback,
    VoidCallback failureCallback,
  ) generateWalletFromBackup;

  final bool Function(
    String,
  ) validateWalletRecoveryPhrase;
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class SplashViewModel extends Equatable {
  const SplashViewModel({
    required this.privateKey,
    required this.jwtToken,
    required this.isLoggedOut,
    required this.accountDetailsExist,
    required this.createLocalAccount,
    required this.loginAgain,
    required this.surveyCompleted,
  });

  factory SplashViewModel.fromStore(Store<AppState> store) {
    return SplashViewModel(
      privateKey: store.state.userState.privateKey,
      jwtToken: store.state.userState.jwtToken,
      isLoggedOut: store.state.userState.isLoggedOut,
      accountDetailsExist: store.state.userState.accountDetailsExist,
      createLocalAccount: (
        VoidCallback successCallback,
      ) {
        store.dispatch(
          createLocalAccountCall(
            successCallback,
          ),
        );
      },
      loginAgain: (BuildContext context) {
        store.dispatch(reLoginCall(
          onSuccess: () {
            showInfoSnack(
              context,
              title: Messages.walletLoadedSnackbarMessage,
            );
          },
          onFailure: () {
            showInfoSnack(
              context,
              title: Messages.walletSignedOutSnackbarMessage,
            );
          },
          onError: (error) {
            if (inDebugMode) {
              showErrorSnack(
                context: context,
                title: Messages.walletSignedOutSnackbarMessage,
                message: 'Error fetching smart wallet: $error',
              );
            } else {
              showInfoSnack(
                context,
                title: Messages.walletSignedOutSnackbarMessage,
              );
            }
          },
        ));
      },
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String privateKey;
  final String jwtToken;
  final bool isLoggedOut;
  final bool accountDetailsExist;
  final void Function(BuildContext context) loginAgain;
  final bool surveyCompleted;

  final void Function(
    VoidCallback successCallback,
  ) createLocalAccount;

  @override
  List<Object> get props => [
        privateKey,
        jwtToken,
        isLoggedOut,
        accountDetailsExist,
        surveyCompleted,
      ];
}

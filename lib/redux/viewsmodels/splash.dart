import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SplashViewModel extends Equatable {
  const SplashViewModel({
    required this.privateKey,
    required this.jwtToken,
    required this.isLoggedOut,
    required this.accountDetailsExist,
    required this.createLocalAccount,
    required this.loginAgain,
    required this.surveyCompleted,
    required this.isWhiteListedAccount,
  });

  factory SplashViewModel.fromStore(Store<AppState> store) {
    return SplashViewModel(
      privateKey: store.state.userState.privateKey,
      jwtToken: store.state.userState.jwtToken,
      isLoggedOut: store.state.userState.isLoggedOut ||
          store.state.userState.jwtToken == '',
      accountDetailsExist: store.state.userState.accountDetailsExist,
      isWhiteListedAccount: store.state.userState.userIsVerified,
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
          reOnboardRequired: () {
            if (DebugHelpers.inDebugMode) {
              log.verbose('Reauthentication of user requires reonboarding');
            }
            rootRouter.push(const SignUpScreen());
          },
          onFailure: (Exception e) {
            if (DebugHelpers.inDebugMode) {
              return showErrorSnack(
                context: context,
                title: Messages.walletSignedOutSnackbarMessage,
                message: e.toString(),
              );
            }
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
  final bool isWhiteListedAccount;

  bool get isLoggedIn => !isLoggedOut;
  bool get accountIsWaitlisted => surveyCompleted && !isWhiteListedAccount;

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
        isWhiteListedAccount,
      ];
}

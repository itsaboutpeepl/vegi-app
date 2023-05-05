import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SurveyThanksViewModel extends Equatable {
  const SurveyThanksViewModel({
    required this.email,
    required this.accountCreated,
    required this.createLocalAccount,
    required this.loginAgain,
    required this.logout,
    required this.isLoggedOut,
    required this.surveyCompleted,
    required this.userAuthenticationStatus,
    required this.fuseWalletCreationStatus,
  });

  factory SurveyThanksViewModel.fromStore(Store<AppState> store) {
    return SurveyThanksViewModel(
      email: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress
          .isNotEmpty, //! BUG to do with jwt token not used to init fuse wallet ->
      isLoggedOut: store.state.userState.isLoggedOut,
      createLocalAccount: (
        VoidCallback successCallback,
      ) {
        store.dispatch(
          createLocalAccountCall(
            successCallback,
          ),
        );
      },
      userAuthenticationStatus: store.state.userState.userAuthenticationStatus,
      fuseWalletCreationStatus: store.state.userState.fuseWalletCreationStatus,
      loginAgain: () {
        store.dispatch(
          reLoginCall(
            reOnboardRequired: () {
              rootRouter.push(const SignUpScreen());
            },
          ),
        );
      },
      logout: () {
        store.dispatch(LogoutRequestSuccess());
      },
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String email;
  final bool accountCreated;
  final bool isLoggedOut;
  final UserAuthenticationStatus userAuthenticationStatus;
  final FuseWalletCreationStatus fuseWalletCreationStatus;
  final void Function() logout;
  final void Function() loginAgain;
  final bool surveyCompleted;

  final void Function(
    VoidCallback successCallback,
  ) createLocalAccount;

  @override
  List<Object> get props => [
        email,
        accountCreated,
        isLoggedOut,
        surveyCompleted,
        userAuthenticationStatus,
        fuseWalletCreationStatus,
      ];
}

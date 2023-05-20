import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SurveyThanksViewModel extends Equatable implements IAuthViewModel {
  const SurveyThanksViewModel({
    required this.email,
    required this.accountCreated,
    required this.initFuse,
    required this.loginAgain,
    required this.logout,
    required this.isLoggedOut,
    required this.surveyCompleted,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
  });

  factory SurveyThanksViewModel.fromStore(Store<AppState> store) {
    return SurveyThanksViewModel(
      email: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress
          .isNotEmpty, //! BUG to do with jwt token not used to init fuse wallet ->
      isLoggedOut: store.state.userState.isLoggedOut,
      initFuse: () {
        store.dispatch(
          authenticate(),
        );
      },
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      loginAgain: () {
        store.dispatch(
          reLoginCall(),
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
  final bool surveyCompleted;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final void Function() logout;
  final void Function() loginAgain;
  final void Function() initFuse;

  @override
  List<Object> get props => [
        email,
        accountCreated,
        isLoggedOut,
        surveyCompleted,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
      ];
}

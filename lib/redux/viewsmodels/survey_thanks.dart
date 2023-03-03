import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class SurveyThanksViewModel extends Equatable {
  const SurveyThanksViewModel({
    required this.email,
    required this.accountCreated,
    required this.createLocalAccount,
    required this.logout,
    required this.isLoggedOut,
    required this.surveyCompleted,
  });

  factory SurveyThanksViewModel.fromStore(Store<AppState> store) {
    return SurveyThanksViewModel(
      email: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress.isNotEmpty,
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
      logout: () {
        store.dispatch(LogoutRequestSuccess());
      },
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String email;
  final bool accountCreated;
  final bool isLoggedOut;
  final void Function() logout;
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
      ];
}

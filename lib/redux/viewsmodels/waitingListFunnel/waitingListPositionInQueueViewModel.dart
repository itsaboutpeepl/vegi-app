import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart'
    as cart_actions;
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class WaitinglistPositionInQueueViewModel extends Equatable {
  const WaitinglistPositionInQueueViewModel({
    required this.userIsVerified,
    required this.positionInQueue,
    required this.surveyCompleted,
    required this.userEmail,
    required this.accountCreated,
    required this.isLoggedIn,
    required this.subscribeToWaitingListEmails,
    required this.authenticateUser,
  });

  factory WaitinglistPositionInQueueViewModel.fromStore(Store<AppState> store) {
    return WaitinglistPositionInQueueViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      surveyCompleted: store.state.userState.surveyCompleted,
      positionInQueue: store.state.userState.positionInWaitingList,
      userEmail: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress.isNotEmpty,
      isLoggedIn: !store.state.userState.isLoggedOut,
      authenticateUser: () {
        if (store.state.onboardingState.signupIsInFlux) {
          return;
        }
        store.dispatch(authenticate());
      },
      subscribeToWaitingListEmails: ({
        required bool receiveNotifications,
      }) {
        cart_actions.subscribeToWaitingListEmails(
          email: store.state.userState.email,
          receiveUpdates: receiveNotifications,
        );
      },
    );
  }

  final bool userIsVerified;
  final bool surveyCompleted;
  final int? positionInQueue;
  final String userEmail;
  final bool accountCreated;
  final bool isLoggedIn;
  final void Function() authenticateUser;
  final void Function({
    required bool receiveNotifications,
  }) subscribeToWaitingListEmails;

  @override
  List<Object?> get props => [
        userIsVerified,
        positionInQueue,
        surveyCompleted,
        userEmail,
        accountCreated,
        isLoggedIn,
      ];
}

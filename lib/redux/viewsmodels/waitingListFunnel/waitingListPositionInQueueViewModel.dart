import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart'
    as cart_actions;

class WaitinglistPositionInQueueViewModel extends Equatable {
  const WaitinglistPositionInQueueViewModel({
    required this.userIsVerified,
    required this.positionInQueue,
    required this.surveyCompleted,
    required this.userEmail,
    required this.subscribeToWaitingListEmails,
    required this.accountCreated,
  });

  factory WaitinglistPositionInQueueViewModel.fromStore(Store<AppState> store) {
    return WaitinglistPositionInQueueViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      surveyCompleted: store.state.userState.surveyCompleted,
      positionInQueue: store.state.userState.positionInWaitingList,
      userEmail: store.state.userState.email,
      accountCreated: store.state.userState.walletAddress.isNotEmpty,
      subscribeToWaitingListEmails: ({
        required bool receiveNotifications,
        required void Function(String) onError,
      }) {
        cart_actions.subscribeToWaitingListEmails(
          email: store.state.userState.email,
          receiveUpdates: receiveNotifications,
          onError: onError,
        );
      },
    );
  }

  final bool userIsVerified;
  final bool surveyCompleted;
  final int? positionInQueue;
  final String userEmail;
  final bool accountCreated;
  final void Function({
    required bool receiveNotifications,
    required void Function(String) onError,
  }) subscribeToWaitingListEmails;

  @override
  List<Object?> get props => [
        userIsVerified,
        positionInQueue,
        surveyCompleted,
        userEmail,
        accountCreated,
      ];
}

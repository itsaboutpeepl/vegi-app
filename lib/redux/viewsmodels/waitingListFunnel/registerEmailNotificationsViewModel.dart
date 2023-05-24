import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';

class RegisterEmailNotificationsViewModel extends Equatable {
  const RegisterEmailNotificationsViewModel({
    required this.userIsVerified,
    required this.positionInQueue,
    required this.surveyCompleted,
    required this.userEmail,
    required this.surveyEmailUsed,
    required this.subscribedToWaitingListUpdates,
    required this.waitingListEntryId,
    required this.biometricAuth,
    required this.registerEmailToWaitingList,
    required this.cartError,
    required this.isLoadingCartState,
  });

  factory RegisterEmailNotificationsViewModel.fromStore(Store<AppState> store) {
    return RegisterEmailNotificationsViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      surveyCompleted: store.state.userState.surveyCompleted,
      positionInQueue: store.state.userState.positionInWaitingList,
      userEmail: store.state.userState.email,
      surveyEmailUsed: store.state.userState.surveyEmailUsed,
      subscribedToWaitingListUpdates:
          store.state.userState.subscribedToWaitingListUpdates,
      waitingListEntryId: store.state.userState.waitingListEntryId,
      biometricAuth: store.state.userState.authType,
      cartError: store.state.cartState.errorDetails,
      isLoadingCartState: store.state.cartState.isLoadingCartState,
      registerEmailToWaitingList: ({
        required String email,
      }) =>
          store.dispatch(
        registerEmailWaitingListHandler(
          email: email,
        ),
      ),
    );
  }

  final bool userIsVerified;
  final bool surveyCompleted;
  final int? positionInQueue;
  final String userEmail;
  final String surveyEmailUsed;
  final bool subscribedToWaitingListUpdates;
  final int? waitingListEntryId;
  final ErrorDetails<CartErrCode>? cartError;
  final bool isLoadingCartState;
  final BiometricAuth biometricAuth;
  final dynamic Function({
    required String email,
  }) registerEmailToWaitingList;

  bool get biometricAuthIsSet => biometricAuth != BiometricAuth.none;
  bool get emailIsSet => userEmail.isNotEmpty;
  bool get emailIsRegistered =>
      waitingListEntryId != null && surveyEmailUsed.isNotEmpty;

  @override
  List<Object?> get props => [
        userIsVerified,
        positionInQueue,
        surveyCompleted,
        userEmail,
        surveyEmailUsed,
        subscribedToWaitingListUpdates,
        waitingListEntryId,
        biometricAuth,
        cartError,
        isLoadingCartState,
      ];
}

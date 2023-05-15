import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class RegisterEmailNotificationsViewModel extends Equatable {
  const RegisterEmailNotificationsViewModel({
    required this.userIsVerified,
    required this.positionInQueue,
    required this.surveyCompleted,
    required this.userEmail,
    required this.biometricAuth,
    required this.registerEmailToWaitingList,
  });

  factory RegisterEmailNotificationsViewModel.fromStore(Store<AppState> store) {
    return RegisterEmailNotificationsViewModel(
      userIsVerified: store.state.userState.userIsVerified,
      surveyCompleted: store.state.userState.surveyCompleted,
      positionInQueue: store.state.userState.positionInWaitingList,
      userEmail: store.state.userState.email,
      biometricAuth: store.state.userState.authType,
      registerEmailToWaitingList: ({
        required String email,
        void Function()? onSuccess,
        required dynamic Function(dynamic) onError,
      }) =>
          store.dispatch(
        registerEmailWaitingListHandler(
          email,
          onSuccess,
          onError,
        ),
      ),
    );
  }

  final bool userIsVerified;
  final bool surveyCompleted;
  final int? positionInQueue;
  final String userEmail;
  final BiometricAuth biometricAuth;
  final dynamic Function({
    required String email,
    void Function()? onSuccess,
    required dynamic Function(dynamic) onError,
  }) registerEmailToWaitingList;

  bool get biometricAuthIsSet => biometricAuth != BiometricAuth.none;
  bool get emailIsSet => userEmail.isNotEmpty;

  @override
  List<Object?> get props => [
        userIsVerified,
        positionInQueue,
        surveyCompleted,
        userEmail,
        biometricAuth,
      ];
}

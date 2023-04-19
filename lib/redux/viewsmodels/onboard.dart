import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class VerifyOnboardViewModel extends Equatable {
  const VerifyOnboardViewModel({
    required this.countryCode,
    required this.phoneNumber,
    required this.verificationId,
    required this.firebaseCredentials,
    required this.verify,
  });

  factory VerifyOnboardViewModel.fromStore(Store<AppState> store) {
    final UserState userState = store.state.userState;
    return VerifyOnboardViewModel(
      countryCode: store.state.userState.countryCode,
      phoneNumber: store.state.userState.phoneNumber,
      verificationId: store.state.userState.verificationId,
      firebaseCredentials: userState.firebaseCredentials,
      verify: (
        String verificationCode,
        Function onSuccess,
        void Function(dynamic error) onError,
      ) {
        store.dispatch(
          verifyHandler(
            verificationCode,
            onSuccess,
            onError,
          ),
        );
      },
    );
  }

  final String countryCode;
  final String phoneNumber;
  final String? verificationId;
  final PhoneAuthCredential? firebaseCredentials;
  final Function(
    String code,
    Function onSuccess,
    Function(dynamic error) onError,
  ) verify;

  @override
  List<Object?> get props => [
        countryCode,
        phoneNumber,
      ];
}

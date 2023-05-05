import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart' as VegiConstants;

class VerifyOnboardViewModel extends Equatable {
  const VerifyOnboardViewModel({
    required this.countryCode,
    required this.displayName,
    required this.phoneNumber,
    required this.biometricAuth,
    required this.verificationId,
    required this.firebaseCredentials,
    required this.verify,
  });

  factory VerifyOnboardViewModel.fromStore(Store<AppState> store) {
    final UserState userState = store.state.userState;
    return VerifyOnboardViewModel(
      countryCode: store.state.userState.countryCode,
      phoneNumber: store.state.userState.phoneNumber,
      displayName: store.state.userState.displayName,
      verificationId: store.state.userState.verificationId,
      biometricAuth: store.state.userState.authType,
      firebaseCredentials: userState.firebaseCredentials,
      verify: (
        String verificationCode,
        void Function()? onSuccess,
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
  final String displayName;
  final String? verificationId;
  final PhoneAuthCredential? firebaseCredentials;
  final BiometricAuth biometricAuth;
  final Function(
    String code,
    void Function()? onSuccess,
    Function(dynamic error) onError,
  ) verify;

  bool get displayNameIsSet =>
      displayName != '' && displayName != VegiConstants.defaultDisplayName;

  bool get biometricAuthIsSet => biometricAuth != BiometricAuth.none;

  @override
  List<Object?> get props => [
        countryCode,
        phoneNumber,
        displayName,
        biometricAuth,
      ];
}

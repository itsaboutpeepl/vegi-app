import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class SecurityViewModel extends Equatable {
  const SecurityViewModel({
    required this.setSecurityType,
    required this.authType,
    required this.isBackup,
    required this.setBiometricallyAuthenticated,
  });
  final Function(BiometricAuth) setSecurityType;
  final bool isBackup;
  final BiometricAuth authType;
  final void Function({required bool isBiometricallyAuthenticated})
      setBiometricallyAuthenticated;

  static SecurityViewModel fromStore(Store<AppState> store) {
    return SecurityViewModel(
      isBackup: store.state.userState.backup,
      authType: store.state.userState.authType,
      setSecurityType: (biometricAuth) {
        store.dispatch(SetSecurityType(biometricAuth: biometricAuth));
      },
      setBiometricallyAuthenticated: (
          {required bool isBiometricallyAuthenticated}) {
        store.dispatch(
          SetBiometricallyAuthenticated(
            isBiometricallyAuthenticated: isBiometricallyAuthenticated,
          ),
        );
      },
    );
  }

  @override
  List get props => [isBackup];
}

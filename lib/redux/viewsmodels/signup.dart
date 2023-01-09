import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class SignUpViewModel extends Equatable {
  const SignUpViewModel({
    required this.walletAddress,
    required this.userIsVerified,
  });

  factory SignUpViewModel.fromStore(Store<AppState> store) {
    return SignUpViewModel(
      walletAddress:
          store.state.userState.walletAddress, //.replaceFirst('x', 'f'),
      userIsVerified: store.state.userState.userIsVerified,
    );
  }

  final String walletAddress;
  final bool userIsVerified;

  @override
  List<Object> get props => [
        walletAddress,
        userIsVerified,
      ];
}

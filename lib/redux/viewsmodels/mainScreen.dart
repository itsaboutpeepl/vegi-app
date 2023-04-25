import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class MainScreenViewModel extends Equatable {
  const MainScreenViewModel({
    required this.walletAddress,
    required this.userIsVerified,
    required this.loggedIn,
    required this.surveyCompleted,
  });

  factory MainScreenViewModel.fromStore(Store<AppState> store) {
    return MainScreenViewModel(
      walletAddress:
          store.state.userState.walletAddress, //.replaceFirst('x', 'f'),
      userIsVerified: store.state.userState.userIsVerified,
      loggedIn: !store.state.userState.isLoggedOut,
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String walletAddress;
  final bool userIsVerified;
  final bool loggedIn;
  final bool surveyCompleted;

  @override
  List<Object> get props => [
        walletAddress,
        userIsVerified,
        loggedIn,
        surveyCompleted,
      ];
}

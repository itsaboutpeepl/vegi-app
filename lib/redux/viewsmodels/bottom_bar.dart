import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class BottomBarViewModel extends Equatable {
  final String walletAddress;

  BottomBarViewModel({
    required this.walletAddress,
  });

  static BottomBarViewModel fromStore(Store<AppState> store) {
    return BottomBarViewModel(
      walletAddress: store.state.userState.walletAddress,
    );
  }

  @override
  List<Object> get props => [
        walletAddress,
      ];
}

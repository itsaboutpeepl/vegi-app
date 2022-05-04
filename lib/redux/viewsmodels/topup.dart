import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class TopUpViewModel extends Equatable {
  final String walletAddress;
  final int topUpAmount;

  TopUpViewModel({required this.walletAddress, required this.topUpAmount});

  static TopUpViewModel fromStore(Store<AppState> store) {
    return TopUpViewModel(
      walletAddress: store.state.userState.walletAddress,
      topUpAmount: store.state.cartState.cartTotal == 0 ? 25 : store.state.cartState.cartTotal,
    );
  }

  @override
  List<Object> get props => [
        walletAddress,
      ];
}

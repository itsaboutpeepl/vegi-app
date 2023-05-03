import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class TopUpViewModel extends Equatable {
  const TopUpViewModel({
    required this.recipientWalletAddress,
    required this.senderWalletAddress,
    required this.orderId,
    required this.accountId,
    required this.topUpAmount,
  });

  factory TopUpViewModel.fromStore(Store<AppState> store) {
    return TopUpViewModel(
      recipientWalletAddress: store.state.userState.walletAddress,
      senderWalletAddress: store.state.userState.walletAddress,
      orderId: num.parse(store.state.cartState.orderID),
      accountId: store.state.userState.vegiAccountId,
      topUpAmount: store.state.cartState.cartTotal == 0
          ? 25
          : store.state.cartState.cartTotal,
    );
  }

  final String recipientWalletAddress;
  final String senderWalletAddress;
  final num orderId;
  final num? accountId;
  final int topUpAmount;

  @override
  List<Object> get props => [
        recipientWalletAddress,
      ];
}

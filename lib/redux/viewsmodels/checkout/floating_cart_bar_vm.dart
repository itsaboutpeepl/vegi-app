import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';

class FloatingCartBarViewModel extends Equatable {
  const FloatingCartBarViewModel({
    required this.hasItems,
    required this.itemCount,
    required this.itemTotal,
    required this.isBelowOrderMinimum,
    required this.orderMinimum,
  });

  factory FloatingCartBarViewModel.fromStore(Store<AppState> store) {
    return FloatingCartBarViewModel(
      hasItems: store.state.cartState.cartItems.isNotEmpty,
      itemCount: store.state.cartState.cartItems.length,
      itemTotal: store.state.cartState.cartSubTotal,
      isBelowOrderMinimum: store.state.cartState.restaurantMinimumOrder >
          store.state.cartState.cartSubTotal.inGBPxValue,
      orderMinimum:
          store.state.cartState.restaurantMinimumOrder.formattedGBPxPrice,
    );
  }

  final bool hasItems;
  final int itemCount;
  final Money itemTotal;
  final bool isBelowOrderMinimum;
  final String orderMinimum;

  @override
  List<Object?> get props => [itemCount, itemTotal];
}

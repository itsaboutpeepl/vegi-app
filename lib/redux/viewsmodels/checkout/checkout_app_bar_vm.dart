import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class CheckoutAppBarViewModel extends Equatable {
  const CheckoutAppBarViewModel({
    required this.restaurantName,
    required this.clearCart,
  });

  factory CheckoutAppBarViewModel.fromStore(Store<AppState> store) {
    return CheckoutAppBarViewModel(
      restaurantName: store.state.cartState.restaurantName,
      clearCart: () {
        store.dispatch(ClearCart());
      },
    );
  }

  final String restaurantName;
  final void Function() clearCart;

  @override
  List<Object?> get props => [restaurantName];
}

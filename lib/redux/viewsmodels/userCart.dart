import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class UserCartViewModel extends Equatable {
  final List<CartItem> cartItems;
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountPercent;
  final int cartDiscountComputed;
  final int cartDeliveryCharge;
  final int cartServiceCharge;
  final int minimumOrderAmount;
  final String avatarUrl;
  final String pplBalance;
  final String gbpXBalance;
  final bool isDelivery;
  final Function(CartItem itemToAdd) addCartItem;
  final Function(CartItem itemToUpdate) updateCartItem;
  final Function() clearCart;

  UserCartViewModel({
    required this.cartItems,
    required this.cartSubTotal,
    required this.cartTax,
    required this.cartTotal,
    required this.cartDeliveryCharge,
    required this.cartDiscountPercent,
    required this.cartDiscountComputed,
    required this.avatarUrl,
    required this.pplBalance,
    required this.gbpXBalance,
    required this.addCartItem,
    required this.updateCartItem,
    required this.clearCart,
    required this.cartServiceCharge,
    required this.minimumOrderAmount,
    required this.isDelivery,
  });

  static UserCartViewModel fromStore(Store<AppState> store) {
    return UserCartViewModel(
      cartItems: store.state.cartState.cartItems,
      cartSubTotal: store.state.cartState.cartSubTotal,
      cartTax: store.state.cartState.cartTax,
      cartTotal: store.state.cartState.cartTotal,
      cartDeliveryCharge: store.state.cartState.cartDeliveryCharge,
      cartServiceCharge: store.state.cartState.restaurantPlatformFee,
      minimumOrderAmount: store.state.cartState.restaurantMinimumOrder,
      cartDiscountComputed: store.state.cartState.cartDiscountComputed,
      cartDiscountPercent: store.state.cartState.cartDiscountPercent,
      avatarUrl: store.state.userState.avatarUrl,
      isDelivery: store.state.cartState.isDelivery,
      pplBalance: store.state.cashWalletState.tokens[PeeplToken.address]!.getBalance(),
      gbpXBalance: store.state.cashWalletState.tokens[GBPxToken.address]!.getBalance(),
      addCartItem: (itemToAdd) {
        //store.dispatch(updateCartItems(itemToAdd));
      },
      updateCartItem: (itemToAdd) {
        store.dispatch(updateCartItemQuantity(itemToAdd));
      },
      clearCart: () {
        store.dispatch(ClearCart());
      },
    );
  }

  @override
  List<Object> get props => [
        cartItems,
        cartSubTotal,
        cartTax,
        cartTotal,
        cartDiscountPercent,
        cartDiscountComputed,
        isDelivery,
        cartDeliveryCharge,
        cartServiceCharge,
      ];
}

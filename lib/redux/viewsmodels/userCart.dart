import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class UserCartViewModel extends Equatable {
  final List<OrderItem> cartItems;
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountPercent;
  final int cartDiscountComputed;
  final String avatarUrl;
  final Function(OrderItem itemToAdd) addOrderItem;
  final Function(int discount) updateDiscount;
  final Function(OrderItem itemToUpdate) updateOrderItem;
  final Function() clearCart;

  UserCartViewModel({
    required this.cartItems,
    required this.cartSubTotal,
    required this.cartTax,
    required this.cartTotal,
    required this.cartDiscountPercent,
    required this.cartDiscountComputed,
    required this.avatarUrl,
    required this.addOrderItem,
    required this.updateDiscount,
    required this.updateOrderItem,
    required this.clearCart,
  });

  static UserCartViewModel fromStore(Store<AppState> store) {
    return UserCartViewModel(
      cartItems: store.state.cartState.cartItems,
      cartSubTotal: store.state.cartState.cartSubTotal,
      cartTax: store.state.cartState.cartTax,
      cartTotal: store.state.cartState.cartTotal,
      cartDiscountComputed: store.state.cartState.cartDiscountComputed,
      cartDiscountPercent: store.state.cartState.cartDiscountPercent,
      avatarUrl: store.state.userState.avatarUrl,
      addOrderItem: (itemToAdd) {
        store.dispatch(updateCartItems(itemToAdd));
      },
      updateDiscount: (newDiscount) {
        store.dispatch(updateCartDiscount(newDiscount));
      },
      updateOrderItem: (itemToAdd) {
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
      ];
}

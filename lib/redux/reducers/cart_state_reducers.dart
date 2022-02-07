import 'package:vegan_liverpool/models/user_cart_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

final CartStateReducers = combineReducers<UserCartState>([
  TypedReducer<UserCartState, UpdateCartItems>(_updateCartItems),
  TypedReducer<UserCartState, UpdateComputedCartValues>(_computeCartTotals),
  TypedReducer<UserCartState, UpdateCartDiscount>(_updateCartDiscount),
  TypedReducer<UserCartState, ClearCart>(_clearCart),
]);

UserCartState _updateCartItems(
  UserCartState state,
  UpdateCartItems action,
) {
  return state.copyWith(cartItems: action.cartItems);
}

UserCartState _computeCartTotals(
  UserCartState state,
  UpdateComputedCartValues action,
) {
  return state.copyWith(
      cartSubTotal: action.cartSubTotal,
      cartTax: action.cartTax,
      cartTotal: action.cartTotal,
      cartDiscountComputed: action.cartDiscountComputed);
}

UserCartState _clearCart(
  UserCartState state,
  ClearCart action,
) {
  return state.copyWith(
    cartItems: [],
    cartSubTotal: 0,
    cartTax: 0,
    cartTotal: 0,
    cartDiscountPercent: 0,
    cartDiscountComputed: 0,
  );
}

UserCartState _updateCartDiscount(
  UserCartState state,
  UpdateCartDiscount action,
) {
  return state.copyWith(cartDiscountPercent: action.cartDiscountPercent);
}

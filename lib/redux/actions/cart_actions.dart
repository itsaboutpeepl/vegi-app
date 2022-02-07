import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux/redux.dart';

class UpdateCartItems {
  final List<OrderItem> cartItems;
  UpdateCartItems({required this.cartItems});
}

class UpdateComputedCartValues {
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountComputed;

  UpdateComputedCartValues(this.cartSubTotal, this.cartTax, this.cartTotal,
      this.cartDiscountComputed);
}

class UpdateCartDiscount {
  final int cartDiscountPercent;
  UpdateCartDiscount(this.cartDiscountPercent);
}

class ClearCart {
  ClearCart();
}

ThunkAction updateCartDiscount(int newCartDiscount) {
  return (Store store) async {
    try {
      store.dispatch(UpdateCartDiscount(newCartDiscount));
      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction updateCartItems(OrderItem itemToAdd) {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;

      cartItems.add(itemToAdd);

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction updateCartItemQuantity(OrderItem itemToAdd) {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;
      if (itemToAdd.itemQuantity == 0) {
        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);
      } else {
        int index = cartItems.indexWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.insert(index, itemToAdd);
      }

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction computeCartTotals() {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;

      int cartSubTotal = 0;
      int cartTax = 0;
      int cartTotal = 0;
      int cartDiscountPercent = store.state.cartState.cartDiscountPercent;
      int cartDiscountComputed = 0;

      cartItems.forEach((element) {
        cartSubTotal += element.totalItemPrice;
      });

      cartDiscountComputed = (cartSubTotal * cartDiscountPercent) ~/ 100;

      cartTax = ((cartSubTotal - cartDiscountComputed) * 5) ~/ 100;

      cartTotal = (cartSubTotal + cartTax) - cartDiscountComputed;

      store.dispatch(UpdateComputedCartValues(
          cartSubTotal, cartTax, cartTotal, cartDiscountComputed));
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

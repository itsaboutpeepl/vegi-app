import 'package:vegan_liverpool/models/user_cart_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

final CartStateReducers = combineReducers<UserCartState>([
  TypedReducer<UserCartState, UpdateCartItems>(_updateCartItems),
  TypedReducer<UserCartState, UpdateComputedCartValues>(_computeCartTotals),
  TypedReducer<UserCartState, UpdateCartDiscount>(_updateCartDiscount),
  TypedReducer<UserCartState, ClearCart>(_clearCart),
  TypedReducer<UserCartState, UpdateSlots>(_updateSlots),
  TypedReducer<UserCartState, UpdateSlotIndex>(_updateSlotIndex),
  TypedReducer<UserCartState, UpdateTipAmount>(_updateTipAmount),
  TypedReducer<UserCartState, UpdateDeliveryAddressIndex>(
      _updateDeliveryAddressIndex),
  TypedReducer<UserCartState, CreateOrder>(_createOrder),
  TypedReducer<UserCartState, SetTransferringPayment>(_toggleTransfer),
  TypedReducer<UserCartState, SetError>(_toggleError),
  TypedReducer<UserCartState, SetConfirmed>(_toggleConfirmed),
  TypedReducer<UserCartState, UpdateSelectedAmounts>(_updateSelectedAmounts),
  TypedReducer<UserCartState, SetRestaurantDetails>(_setRestaurantDetails),
  TypedReducer<UserCartState, SetDeliveryCharge>(_setDeliveryCharge),
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
    selectedSlotIndex: 0,
    selectedTipAmount: 0,
    discountCode: "",
    selectedDeliveryAddressIndex: 1,
    paymentIntentID: "",
    orderID: "",
    selectedGBPxAmount: 0.0,
    selectedPPLAmount: 0.0,
    transferringTokens: false,
    errorCompletingPayment: false,
    confirmedPayment: false,
    restaurantName: "",
    restaurantID: "",
    restaurantAddress: demoAddress,
  );
}

UserCartState _updateCartDiscount(
  UserCartState state,
  UpdateCartDiscount action,
) {
  return state.copyWith(
      cartDiscountPercent: action.cartDiscountPercent,
      discountCode: action.discountCode);
}

UserCartState _updateSlots(
  UserCartState state,
  UpdateSlots action,
) {
  return state.copyWith(
      deliverySlots: action.deliverySlots,
      collectionSlots: action.collectionSlots);
}

UserCartState _updateSlotIndex(
  UserCartState state,
  UpdateSlotIndex action,
) {
  return state.copyWith(selectedSlotIndex: action.index);
}

UserCartState _updateTipAmount(
  UserCartState state,
  UpdateTipAmount action,
) {
  return state.copyWith(selectedTipAmount: action.tipAmount);
}

UserCartState _updateDeliveryAddressIndex(
  UserCartState state,
  UpdateDeliveryAddressIndex action,
) {
  return state.copyWith(selectedDeliveryAddressIndex: action.indexOfAddress);
}

UserCartState _createOrder(
  UserCartState state,
  CreateOrder action,
) {
  return state.copyWith(
      orderID: action.orderID, paymentIntentID: action.paymentIntentID);
}

UserCartState _toggleTransfer(
  UserCartState state,
  SetTransferringPayment action,
) {
  return state.copyWith(transferringTokens: action.flag);
}

UserCartState _toggleError(
  UserCartState state,
  SetError action,
) {
  return state.copyWith(errorCompletingPayment: action.flag);
}

UserCartState _toggleConfirmed(
  UserCartState state,
  SetConfirmed action,
) {
  return state.copyWith(confirmedPayment: action.flag);
}

UserCartState _updateSelectedAmounts(
  UserCartState state,
  UpdateSelectedAmounts action,
) {
  return state.copyWith(
      selectedGBPxAmount: action.GBPxAmount,
      selectedPPLAmount: action.PPLAmount);
}

UserCartState _setRestaurantDetails(
  UserCartState state,
  SetRestaurantDetails action,
) {
  return state.copyWith(
    restaurantID: action.restaurantID,
    restaurantName: action.restaurantName,
    restaurantAddress: action.restaurantAddress,
  );
}

UserCartState _setDeliveryCharge(
  UserCartState state,
  SetDeliveryCharge action,
) {
  return state.copyWith(
    cartDeliveryCharge: action.deliveryCharge,
  );
}

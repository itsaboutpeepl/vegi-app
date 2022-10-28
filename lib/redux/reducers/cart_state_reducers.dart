import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/user_cart_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

final cartStateReducers = combineReducers<UserCartState>([
  TypedReducer<UserCartState, UpdateCartItems>(_updateCartItems),
  TypedReducer<UserCartState, UpdateComputedCartValues>(_computeCartTotals),
  TypedReducer<UserCartState, UpdateCartDiscount>(_updateCartDiscount),
  TypedReducer<UserCartState, ClearCart>(_clearCart),
  TypedReducer<UserCartState, UpdateSlots>(_updateSlots),
  TypedReducer<UserCartState, UpdateSelectedTimeSlot>(_updateSelectedTimeSlot),
  TypedReducer<UserCartState, UpdateTipAmount>(_updateTipAmount),
  TypedReducer<UserCartState, UpdateSelectedDeliveryAddress>(
    _updateSelectedDeliveryAddress,
  ),
  TypedReducer<UserCartState, CreateOrder>(_createOrder),
  TypedReducer<UserCartState, SetTransferringPayment>(_toggleTransfer),
  TypedReducer<UserCartState, SetError>(_toggleError),
  TypedReducer<UserCartState, SetConfirmed>(_toggleConfirmed),
  TypedReducer<UserCartState, UpdateSelectedAmounts>(_updateSelectedAmounts),
  TypedReducer<UserCartState, SetRestaurantDetails>(_setRestaurantDetails),
  TypedReducer<UserCartState, SetDeliveryCharge>(_setDeliveryCharge),
  TypedReducer<UserCartState, SetFulfilmentFees>(_setFulfilmentFees),
  TypedReducer<UserCartState, SetFulfilmentMethod>(_setFulfilmentMethod),
  TypedReducer<UserCartState, SetIsDelivery>(_setIsDelivery),
  TypedReducer<UserCartState, SetDeliveryInstructions>(
    _setDeliveryInstructions,
  ),
  TypedReducer<UserCartState, SetFulfilmentMethodIds>(_setFulfilmentMethodIds),
  TypedReducer<UserCartState, SetPaymentMethod>(_setPaymentMethod),
  TypedReducer<UserCartState, SetPaymentButtonFlag>(_setPaymentButtonFlag)
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
    cartDiscountComputed: action.cartDiscountComputed,
  );
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
    selectedTimeSlot: {},
    selectedTipAmount: 0,
    discountCode: '',
    selectedDeliveryAddress: null,
    paymentIntentID: '',
    orderID: '',
    selectedGBPxAmount: 0,
    selectedPPLAmount: 0,
    transferringTokens: false,
    errorCompletingPayment: false,
    confirmedPayment: false,
    payButtonLoading: false,
    restaurantName: '',
    restaurantID: '',
    restaurantAddress: null,
  );
}

UserCartState _updateCartDiscount(
  UserCartState state,
  UpdateCartDiscount action,
) {
  return state.copyWith(
    cartDiscountPercent: action.cartDiscountPercent,
    discountCode: action.discountCode,
  );
}

UserCartState _updateSlots(
  UserCartState state,
  UpdateSlots action,
) {
  return state.copyWith(
    deliverySlots: action.deliverySlots,
    collectionSlots: action.collectionSlots,
  );
}

UserCartState _updateSelectedTimeSlot(
  UserCartState state,
  UpdateSelectedTimeSlot action,
) {
  return state.copyWith(selectedTimeSlot: action.selectedTimeSlot);
}

UserCartState _updateTipAmount(
  UserCartState state,
  UpdateTipAmount action,
) {
  return state.copyWith(selectedTipAmount: action.tipAmount);
}

UserCartState _updateSelectedDeliveryAddress(
  UserCartState state,
  UpdateSelectedDeliveryAddress action,
) {
  return state.copyWith(selectedDeliveryAddress: action.selectedAddress);
}

UserCartState _createOrder(
  UserCartState state,
  CreateOrder action,
) {
  return state.copyWith(
    orderID: action.orderID,
    paymentIntentID: action.paymentIntentID,
  );
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
    selectedGBPxAmount: action.gbpxAmount,
    selectedPPLAmount: action.pplAmount,
  );
}

UserCartState _setRestaurantDetails(
  UserCartState state,
  SetRestaurantDetails action,
) {
  return state.copyWith(
    restaurantID: action.restaurantID,
    restaurantName: action.restaurantName,
    restaurantAddress: action.restaurantAddress,
    restaurantWalletAddress: action.walletAddress,
    restaurantMinimumOrder: action.minimumOrder,
    restaurantPlatformFee: action.platformFee,
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

UserCartState _setFulfilmentFees(
  UserCartState state,
  SetFulfilmentFees action,
) {
  return state.copyWith(
    deliveryCharge: action.deliveryCharge,
    collectionCharge: action.collectionCharge,
  );
}

UserCartState _setFulfilmentMethod(
  UserCartState state,
  SetFulfilmentMethod action,
) {
  return state.copyWith(fulfilmentMethod: action.fulfilmentMethod);
}

UserCartState _setIsDelivery(UserCartState state, SetIsDelivery action) {
  return state.copyWith(isDelivery: action.isDelivery);
}

UserCartState _setDeliveryInstructions(
  UserCartState state,
  SetDeliveryInstructions action,
) {
  return state.copyWith(deliveryInstructions: action.deliveryInstructions);
}

UserCartState _setFulfilmentMethodIds(
  UserCartState state,
  SetFulfilmentMethodIds action,
) {
  return state.copyWith(
    deliveryMethodId: action.deliveryMethodId,
    collectionMethodId: action.collectionMethodId,
  );
}

UserCartState _setPaymentMethod(UserCartState state, SetPaymentMethod action) {
  return state.copyWith(selectedPaymentMethod: action.paymentMethod);
}

UserCartState _setPaymentButtonFlag(
  UserCartState state,
  SetPaymentButtonFlag action,
) {
  return state.copyWith(payButtonLoading: action.flag);
}

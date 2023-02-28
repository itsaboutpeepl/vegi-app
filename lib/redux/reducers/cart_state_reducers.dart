import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/envService.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';
import 'package:vegan_liverpool/models/user_cart_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

final cartStateReducers = combineReducers<UserCartState>([
  TypedReducer<UserCartState, UpdateCartItems>(_updateCartItems),
  TypedReducer<UserCartState, UpdateCartItem>(_updateCartItem),
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
  TypedReducer<UserCartState, SetIsDelivery>(_setIsDelivery),
  TypedReducer<UserCartState, SetDeliveryInstructions>(
    _setDeliveryInstructions,
  ),
  TypedReducer<UserCartState, SetPaymentMethod>(_setPaymentMethod),
  TypedReducer<UserCartState, SetPaymentButtonFlag>(_setPaymentButtonFlag),
  TypedReducer<UserCartState, UpdateEligibleOrderDates>(
    _updateEligibleOrderDates,
  ),
  TypedReducer<UserCartState, UpdateNextAvaliableTimeSlots>(
    _updateNextAvaliableSlots,
  ),
  TypedReducer<UserCartState, AddImageToProductSuggestionRTO>(
    _addImageToProductSuggestion,
  ),
  TypedReducer<UserCartState, AddQRCodeToProductSuggestionRTO>(
    _addQRCodeToProductSuggestion,
  ),
  TypedReducer<UserCartState, AddAdditionalInformationToProductSuggestionRTO>(
    _addAdditionalInfoToProductSuggestion,
  ),
  TypedReducer<UserCartState, AddProductNameToProductSuggestionRTO>(
    _addProductNameToProductSuggestion,
  ),
  TypedReducer<UserCartState, CreateProductSuggestion>(
    _createProductSuggestion,
  ),
]);

UserCartState _updateCartItems(
  UserCartState state,
  UpdateCartItems action,
) {
  return state.copyWith(cartItems: action.cartItems);
}

UserCartState _updateCartItem(
  UserCartState state,
  UpdateCartItem action,
) {
  return state.copyWith(
    cartItems: state.cartItems
        .where(
          (element) => element.internalID != action.cartItem.internalID,
        )
        .toList()
      ..add(action.cartItem),
  );
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
    selectedTimeSlot: null,
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
    restaurantIsLive: !EnvService.isUsingProdServices,
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
    restaurantIsLive: !EnvService.isUsingProdServices,
    restaurantName: action.restaurantName,
    restaurantAddress: action.restaurantAddress,
    restaurantWalletAddress: action.walletAddress,
    restaurantMinimumOrder: action.minimumOrder,
    restaurantPlatformFee: action.platformFee,
    fulfilmentPostalDistricts: action.fulfilmentPostalDistricts,
  );
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

UserCartState _setPaymentMethod(UserCartState state, SetPaymentMethod action) {
  return state.copyWith(selectedPaymentMethod: action.paymentMethod);
}

UserCartState _setPaymentButtonFlag(
  UserCartState state,
  SetPaymentButtonFlag action,
) {
  return state.copyWith(payButtonLoading: action.flag);
}

UserCartState _updateEligibleOrderDates(
  UserCartState state,
  UpdateEligibleOrderDates action,
) {
  return state.copyWith(eligibleOrderDates: action.eligibleOrderDates);
}

UserCartState _updateNextAvaliableSlots(
  UserCartState state,
  UpdateNextAvaliableTimeSlots action,
) {
  return state.copyWith(
    nextDeliverySlot: action.deliverySlot,
    nextCollectionSlot: action.collectionSlot,
  );
}

UserCartState _createProductSuggestion(
  UserCartState state,
  CreateProductSuggestion action,
) {
  return state.copyWith(
    productSuggestion: action.productSuggestion,
  );
}

UserCartState _addImageToProductSuggestion(
  UserCartState state,
  AddImageToProductSuggestionRTO action,
) {
  return state.copyWith(
    productSuggestion: state.productSuggestion?.copyWith(
      images: Map.fromEntries(<
          MapEntry<ProductSuggestionImageType,
              UploadProductSuggestionImageResponse>>[
        ...state.productSuggestion!.images.entries,
        MapEntry(action.imageType, action.image),
      ]),
    ),
  );
}

UserCartState _addQRCodeToProductSuggestion(
  UserCartState state,
  AddQRCodeToProductSuggestionRTO action,
) {
  return state.copyWith(
    productSuggestion: state.productSuggestion?.copyWith(
      qrCode: action.qrCode,
    ),
  );
}

UserCartState _addAdditionalInfoToProductSuggestion(
  UserCartState state,
  AddAdditionalInformationToProductSuggestionRTO action,
) {
  return state.copyWith(
    productSuggestion: state.productSuggestion
        ?.copyWith(additionalInformation: action.additionalInfo),
  );
}

UserCartState _addProductNameToProductSuggestion(
  UserCartState state,
  AddProductNameToProductSuggestionRTO action,
) {
  return state.copyWith(
    productSuggestion: state.productSuggestion?.copyWith(
      name: action.productName,
      store: action.retailerName,
    ),
  );
}

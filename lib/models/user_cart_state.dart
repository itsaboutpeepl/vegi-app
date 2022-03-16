import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

part 'user_cart_state.freezed.dart';
part 'user_cart_state.g.dart';

@freezed
class UserCartState with _$UserCartState {
  const UserCartState._();

  @JsonSerializable()
  factory UserCartState({
    required List<OrderItem> cartItems,
    required int cartSubTotal,
    required int cartTax,
    required int cartTotal,
    required int cartDiscountPercent,
    required int cartDiscountComputed,
    required List<Map<String, String>> deliverySlots,
    required List<Map<String, String>> collectionSlots,
    required int selectedSlotIndex,
    required int selectedTipAmount,
    required String discountCode,
    required int selectedDeliveryAddressIndex,
    required String paymentIntentID,
    required String orderID,
    required double selectedGBPxAmount,
    required double selectedPPLAmount,
    required bool transferringTokens,
    required bool errorCompletingPayment,
    required bool confirmedPayment,
    required String restaurantName,
    required String restaurantID,
    required DeliveryAddresses restaurantAddress,
  }) = _UserCartState;

  factory UserCartState.initial() => UserCartState(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartDiscountPercent: 0,
        cartDiscountComputed: 0,
        deliverySlots: [],
        collectionSlots: [],
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

  factory UserCartState.fromJson(dynamic json) => _$UserCartStateFromJson(json);
}

class UserCartStateConverter
    implements JsonConverter<UserCartState, Map<String, dynamic>?> {
  const UserCartStateConverter();

  @override
  UserCartState fromJson(Map<String, dynamic>? json) => UserCartState.initial();

  @override
  Map<String, dynamic> toJson(UserCartState instance) => instance.toJson();
}

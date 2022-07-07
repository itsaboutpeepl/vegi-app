import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

part 'user_cart_state.freezed.dart';
part 'user_cart_state.g.dart';

@Freezed()
class UserCartState with _$UserCartState {
  const UserCartState._();

  @JsonSerializable()
  factory UserCartState({
    @JsonKey(ignore: true) @Default([]) List<CartItem> cartItems,
    @JsonKey(ignore: true) @Default(0) int cartSubTotal,
    @JsonKey(ignore: true) @Default(0) int cartTax,
    @JsonKey(ignore: true) @Default(0) int cartTotal,
    @JsonKey(ignore: true) @Default(0) int cartDiscountPercent,
    @JsonKey(ignore: true) @Default(0) int cartDiscountComputed,
    @JsonKey(ignore: true) @Default(0) int cartDeliveryCharge,
    @JsonKey(ignore: true) @Default([]) List<Map<String, String>> deliverySlots,
    @JsonKey(ignore: true) @Default([]) List<Map<String, String>> collectionSlots,
    @JsonKey(ignore: true) @Default(null) DeliveryAddresses? selectedDeliveryAddress,
    @JsonKey(ignore: true) @Default({}) Map<String, String> selectedTimeSlot,
    @JsonKey(ignore: true) @Default(0) int selectedTipAmount,
    @JsonKey(ignore: true) @Default("") String discountCode,
    @JsonKey(ignore: true) @Default("") String paymentIntentID,
    @JsonKey(ignore: true) @Default("") String orderID,
    @JsonKey(ignore: true) @Default(0.0) double selectedGBPxAmount,
    @JsonKey(ignore: true) @Default(0.0) double selectedPPLAmount,
    @JsonKey(ignore: true) @Default(false) bool transferringTokens,
    @JsonKey(ignore: true) @Default(false) bool errorCompletingPayment,
    @JsonKey(ignore: true) @Default(false) bool confirmedPayment,
    @JsonKey(ignore: true) @Default("") String restaurantName,
    @JsonKey(ignore: true) @Default("") String restaurantID,
    @JsonKey(ignore: true) @Default(null) DeliveryAddresses? restaurantAddress,
    @JsonKey(ignore: true) @Default("") String restaurantWalletAddress,
    @JsonKey(ignore: true) @Default(0) int deliveryCharge,
    @JsonKey(ignore: true) @Default(0) int collectionCharge,
    @JsonKey(ignore: true) @Default(FulfilmentMethod.delivery) FulfilmentMethod fulfilmentMethod,
    @JsonKey(ignore: true) @Default(false) bool isDelivery,
  }) = _UserCartState;

  factory UserCartState.initial() => UserCartState(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartDiscountPercent: 0,
        cartDiscountComputed: 0,
        cartDeliveryCharge: 0,
        deliverySlots: [],
        collectionSlots: [],
        selectedTipAmount: 0,
        discountCode: "",
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
        restaurantWalletAddress: "",
        deliveryCharge: 0,
        collectionCharge: 0,
        selectedDeliveryAddress: null,
        selectedTimeSlot: {},
        fulfilmentMethod: FulfilmentMethod.delivery,
        isDelivery: false,
      );

  factory UserCartState.fromJson(dynamic json) => _$UserCartStateFromJson(json);
}

class UserCartStateConverter implements JsonConverter<UserCartState, Map<String, dynamic>?> {
  const UserCartStateConverter();

  @override
  UserCartState fromJson(Map<String, dynamic>? json) =>
      json != null ? UserCartState.fromJson(json) : UserCartState.initial();

  @override
  Map<String, dynamic> toJson(UserCartState instance) => instance.toJson();
}

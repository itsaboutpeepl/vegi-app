import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/envService.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/discount.dart';
import 'package:vegan_liverpool/models/cart/productSuggestion.dart';
import 'package:vegan_liverpool/models/payments/live_payment.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/payment_methods.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';
import 'package:vegan_liverpool/redux/viewsmodels/signUpErrorDetails.dart';

part 'user_cart_state.freezed.dart';
part 'user_cart_state.g.dart';

Map<String, dynamic> paymentInProcessToJson(
  LivePayment? paymentInProcess,
) =>
    paymentInProcess?.toJson() ?? {};

@Freezed()
class UserCartState with _$UserCartState {
  @JsonSerializable()
  factory UserCartState({
    @Default([])
        List<CartItem> cartItems,
    @Default(0)
        num cartSubTotal,
    @Default(0)
        num cartTax,
    @Default(0)
        num cartTotal,
    @Default(Currency.GBP)
        Currency cartCurrency,
    @Default(0)
        int cartDiscountPercent,
    @Default(0)
        num cartDiscountComputed,
    @JsonKey(
      fromJson: Money.fromJson,
      toJson: Money.toJson,
    )
    @Default(Money.zero())
        Money voucherPotValue,
    @Default([])
        List<Discount> appliedVouchers,
    @Default([])
        List<TimeSlot> deliverySlots,
    @Default([])
        List<TimeSlot> collectionSlots,
    @Default(null)
        DeliveryAddresses? selectedDeliveryAddress,
    @Default(null)
        TimeSlot? selectedTimeSlot,
    @Default(0)
        int selectedTipAmount,
    @Default('')
        String discountCode,
    @Default('')
        String paymentIntentID,
    @Default('')
        String orderID,
    @Default(0.0)
        double selectedGBPxAmount,
    @Default(0.0)
        double selectedPPLAmount,
    @Default(false)
        bool payButtonLoading,
    @Default(false)
        bool transferringTokens,
    @Default(false)
        bool errorCompletingPayment,
    @Default(false)
        bool confirmedPayment,
    @Default('')
        String restaurantName,
    @Default('')
        String restaurantID,
    @Default(false)
        bool restaurantIsLive,
    @Default(null)
        DeliveryAddresses? restaurantAddress,
    @Default('')
        String restaurantWalletAddress,
    @Default(FulfilmentMethodType.delivery)
        FulfilmentMethodType fulfilmentMethod,
    @Default(0)
        int restaurantMinimumOrder,
    @Default(0)
        int restaurantPlatformFee,
    @Default('')
        String deliveryInstructions,
    @Default(null)
        PaymentMethod? selectedPaymentMethod,
    @Default([])
        List<String> fulfilmentPostalDistricts,
    @Default([])
        List<DateTime> eligibleOrderDates,
    @Default(null)
        TimeSlot? nextCollectionSlot,
    @Default(null)
        TimeSlot? nextDeliverySlot,
    @Default(null)
        ProductSuggestion? productSuggestion,
    @Default(OrderCreationProcessStatus.none)
        OrderCreationProcessStatus orderCreationProcessStatus,
    @Default(StripePaymentStatus.none)
        StripePaymentStatus stripePaymentStatus,
    @JsonKey(
      fromJson: LivePayment.fromJson,
      toJson: paymentInProcessToJson,
    )
    @Default(null)
        LivePayment? paymentInProcess,
    @JsonKey(ignore: true)
    @Default(false)
        bool isLoadingCartState,
    @JsonKey(ignore: true)
    @Default(null)
        ErrorDetails<CartErrCode>? errorDetails,
  }) = _UserCartState;

  const UserCartState._();

  factory UserCartState.initial() => UserCartState(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartCurrency: Currency.GBP,
        cartDiscountPercent: 0,
        cartDiscountComputed: 0,
        deliverySlots: [],
        collectionSlots: [],
        selectedTipAmount: 0,
        discountCode: '',
        paymentIntentID: '',
        orderID: '',
        selectedGBPxAmount: 0,
        selectedPPLAmount: 0,
        payButtonLoading: false,
        transferringTokens: false,
        errorCompletingPayment: false,
        confirmedPayment: false,
        restaurantName: '',
        restaurantID: '',
        restaurantIsLive: !EnvService.isUsingProdServices,
        restaurantWalletAddress: '',
        fulfilmentMethod: FulfilmentMethodType.delivery,
        fulfilmentPostalDistricts: [],
        eligibleOrderDates: [],
        paymentInProcess: LivePayment.initial(),
      );

  factory UserCartState.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$UserCartStateFromJson(json),
      );

  bool get isDelivery => fulfilmentMethod == FulfilmentMethodType.delivery;
  bool get isCollection => fulfilmentMethod == FulfilmentMethodType.collection;
  bool get isInStore => fulfilmentMethod == FulfilmentMethodType.inStore;

  Money cartTotalMoney({
    required Currency inCurrency,
  }) =>
      Money(
        currency: inCurrency,
        value: convertCurrencyAmount(
          amount: cartTotal,
          fromCurrency: cartCurrency,
          toCurrency: inCurrency,
        ),
      );

  Money get cartTotalGBP => Money(
        currency: Currency.GBP,
        value: convertCurrencyAmount(
          amount: cartTotal,
          fromCurrency: cartCurrency,
          toCurrency: Currency.GBP,
        ),
      );
}

class UserCartStateConverter
    implements JsonConverter<UserCartState, Map<String, dynamic>?> {
  const UserCartStateConverter();

  @override
  UserCartState fromJson(Map<String, dynamic>? json) => tryCatchRethrowInline(
        () => json != null
            ? UserCartState.fromJson(json)
            : UserCartState.initial(),
      );

  @override
  Map<String, dynamic> toJson(UserCartState instance) => instance.toJson();
}

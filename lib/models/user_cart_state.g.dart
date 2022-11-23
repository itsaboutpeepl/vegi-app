// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCartState _$$_UserCartStateFromJson(Map<String, dynamic> json) =>
    _$_UserCartState(
      cartItems: (json['cartItems'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cartSubTotal: json['cartSubTotal'] as int? ?? 0,
      cartTax: json['cartTax'] as int? ?? 0,
      cartTotal: json['cartTotal'] as int? ?? 0,
      cartDiscountPercent: json['cartDiscountPercent'] as int? ?? 0,
      cartDiscountComputed: json['cartDiscountComputed'] as int? ?? 0,
      deliverySlots: (json['deliverySlots'] as List<dynamic>?)
              ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      collectionSlots: (json['collectionSlots'] as List<dynamic>?)
              ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedDeliveryAddress: json['selectedDeliveryAddress'] == null
          ? null
          : DeliveryAddresses.fromJson(
              json['selectedDeliveryAddress'] as Map<String, dynamic>),
      selectedTimeSlot: json['selectedTimeSlot'] == null
          ? null
          : TimeSlot.fromJson(json['selectedTimeSlot'] as Map<String, dynamic>),
      selectedTipAmount: json['selectedTipAmount'] as int? ?? 0,
      discountCode: json['discountCode'] as String? ?? '',
      paymentIntentID: json['paymentIntentID'] as String? ?? '',
      orderID: json['orderID'] as String? ?? '',
      selectedGBPxAmount:
          (json['selectedGBPxAmount'] as num?)?.toDouble() ?? 0.0,
      selectedPPLAmount: (json['selectedPPLAmount'] as num?)?.toDouble() ?? 0.0,
      payButtonLoading: json['payButtonLoading'] as bool? ?? false,
      transferringTokens: json['transferringTokens'] as bool? ?? false,
      errorCompletingPayment: json['errorCompletingPayment'] as bool? ?? false,
      confirmedPayment: json['confirmedPayment'] as bool? ?? false,
      restaurantName: json['restaurantName'] as String? ?? '',
      restaurantID: json['restaurantID'] as String? ?? '',
      restaurantIsLive: json['restaurantIsLive'] as bool? ?? false,
      restaurantAddress: json['restaurantAddress'] == null
          ? null
          : DeliveryAddresses.fromJson(
              json['restaurantAddress'] as Map<String, dynamic>),
      restaurantWalletAddress: json['restaurantWalletAddress'] as String? ?? '',
      fulfilmentMethod: $enumDecodeNullable(
              _$FulfilmentMethodTypeEnumMap, json['fulfilmentMethod']) ??
          FulfilmentMethodType.delivery,
      isDelivery: json['isDelivery'] as bool? ?? false,
      restaurantMinimumOrder: json['restaurantMinimumOrder'] as int? ?? 0,
      restaurantPlatformFee: json['restaurantPlatformFee'] as int? ?? 0,
      deliveryInstructions: json['deliveryInstructions'] as String? ?? '',
      selectedPaymentMethod: $enumDecodeNullable(
              _$PaymentMethodEnumMap, json['selectedPaymentMethod']) ??
          null,
      fulfilmentPostalDistricts:
          (json['fulfilmentPostalDistricts'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      eligibleOrderDates: (json['eligibleOrderDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      nextCollectionSlot: json['nextCollectionSlot'] == null
          ? null
          : TimeSlot.fromJson(
              json['nextCollectionSlot'] as Map<String, dynamic>),
      nextDeliverySlot: json['nextDeliverySlot'] == null
          ? null
          : TimeSlot.fromJson(json['nextDeliverySlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserCartStateToJson(_$_UserCartState instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartSubTotal': instance.cartSubTotal,
      'cartTax': instance.cartTax,
      'cartTotal': instance.cartTotal,
      'cartDiscountPercent': instance.cartDiscountPercent,
      'cartDiscountComputed': instance.cartDiscountComputed,
      'deliverySlots': instance.deliverySlots.map((e) => e.toJson()).toList(),
      'collectionSlots':
          instance.collectionSlots.map((e) => e.toJson()).toList(),
      'selectedDeliveryAddress': instance.selectedDeliveryAddress?.toJson(),
      'selectedTimeSlot': instance.selectedTimeSlot?.toJson(),
      'selectedTipAmount': instance.selectedTipAmount,
      'discountCode': instance.discountCode,
      'paymentIntentID': instance.paymentIntentID,
      'orderID': instance.orderID,
      'selectedGBPxAmount': instance.selectedGBPxAmount,
      'selectedPPLAmount': instance.selectedPPLAmount,
      'payButtonLoading': instance.payButtonLoading,
      'transferringTokens': instance.transferringTokens,
      'errorCompletingPayment': instance.errorCompletingPayment,
      'confirmedPayment': instance.confirmedPayment,
      'restaurantName': instance.restaurantName,
      'restaurantID': instance.restaurantID,
      'restaurantIsLive': instance.restaurantIsLive,
      'restaurantAddress': instance.restaurantAddress?.toJson(),
      'restaurantWalletAddress': instance.restaurantWalletAddress,
      'fulfilmentMethod':
          _$FulfilmentMethodTypeEnumMap[instance.fulfilmentMethod]!,
      'isDelivery': instance.isDelivery,
      'restaurantMinimumOrder': instance.restaurantMinimumOrder,
      'restaurantPlatformFee': instance.restaurantPlatformFee,
      'deliveryInstructions': instance.deliveryInstructions,
      'selectedPaymentMethod':
          _$PaymentMethodEnumMap[instance.selectedPaymentMethod],
      'fulfilmentPostalDistricts': instance.fulfilmentPostalDistricts,
      'eligibleOrderDates':
          instance.eligibleOrderDates.map((e) => e.toIso8601String()).toList(),
      'nextCollectionSlot': instance.nextCollectionSlot?.toJson(),
      'nextDeliverySlot': instance.nextDeliverySlot?.toJson(),
    };

const _$FulfilmentMethodTypeEnumMap = {
  FulfilmentMethodType.collection: 'collection',
  FulfilmentMethodType.delivery: 'delivery',
  FulfilmentMethodType.none: 'none',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.stripe: 'stripe',
  PaymentMethod.peeplPay: 'peeplPay',
  PaymentMethod.applePay: 'applePay',
  PaymentMethod.qrPay: 'qrPay',
};

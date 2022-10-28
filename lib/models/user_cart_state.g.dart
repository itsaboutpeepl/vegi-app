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
      cartDeliveryCharge: json['cartDeliveryCharge'] as int? ?? 0,
      deliverySlots: (json['deliverySlots'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      collectionSlots: (json['collectionSlots'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      selectedDeliveryAddress: json['selectedDeliveryAddress'] == null
          ? null
          : DeliveryAddresses.fromJson(
              json['selectedDeliveryAddress'] as Map<String, dynamic>),
      selectedTimeSlot:
          (json['selectedTimeSlot'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
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
      restaurantAddress: json['restaurantAddress'] == null
          ? null
          : DeliveryAddresses.fromJson(
              json['restaurantAddress'] as Map<String, dynamic>),
      restaurantWalletAddress: json['restaurantWalletAddress'] as String? ?? '',
      deliveryCharge: json['deliveryCharge'] as int? ?? 0,
      collectionCharge: json['collectionCharge'] as int? ?? 0,
      fulfilmentMethod: $enumDecodeNullable(
              _$FulfilmentMethodEnumMap, json['fulfilmentMethod']) ??
          FulfilmentMethod.delivery,
      isDelivery: json['isDelivery'] as bool? ?? false,
      restaurantMinimumOrder: json['restaurantMinimumOrder'] as int? ?? 0,
      restaurantPlatformFee: json['restaurantPlatformFee'] as int? ?? 0,
      deliveryInstructions: json['deliveryInstructions'] as String? ?? '',
      deliveryMethodId: json['deliveryMethodId'] as int? ?? 0,
      collectionMethodId: json['collectionMethodId'] as int? ?? 0,
      selectedPaymentMethod: $enumDecodeNullable(
              _$PaymentMethodEnumMap, json['selectedPaymentMethod']) ??
          null,
    );

Map<String, dynamic> _$$_UserCartStateToJson(_$_UserCartState instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartSubTotal': instance.cartSubTotal,
      'cartTax': instance.cartTax,
      'cartTotal': instance.cartTotal,
      'cartDiscountPercent': instance.cartDiscountPercent,
      'cartDiscountComputed': instance.cartDiscountComputed,
      'cartDeliveryCharge': instance.cartDeliveryCharge,
      'deliverySlots': instance.deliverySlots,
      'collectionSlots': instance.collectionSlots,
      'selectedDeliveryAddress': instance.selectedDeliveryAddress?.toJson(),
      'selectedTimeSlot': instance.selectedTimeSlot,
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
      'restaurantAddress': instance.restaurantAddress?.toJson(),
      'restaurantWalletAddress': instance.restaurantWalletAddress,
      'deliveryCharge': instance.deliveryCharge,
      'collectionCharge': instance.collectionCharge,
      'fulfilmentMethod': _$FulfilmentMethodEnumMap[instance.fulfilmentMethod]!,
      'isDelivery': instance.isDelivery,
      'restaurantMinimumOrder': instance.restaurantMinimumOrder,
      'restaurantPlatformFee': instance.restaurantPlatformFee,
      'deliveryInstructions': instance.deliveryInstructions,
      'deliveryMethodId': instance.deliveryMethodId,
      'collectionMethodId': instance.collectionMethodId,
      'selectedPaymentMethod':
          _$PaymentMethodEnumMap[instance.selectedPaymentMethod],
    };

const _$FulfilmentMethodEnumMap = {
  FulfilmentMethod.collection: 'collection',
  FulfilmentMethod.delivery: 'delivery',
  FulfilmentMethod.none: 'none',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.stripe: 'stripe',
  PaymentMethod.peeplPay: 'peeplPay',
  PaymentMethod.applePay: 'applePay',
};

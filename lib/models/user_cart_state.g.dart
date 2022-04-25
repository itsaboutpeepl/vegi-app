// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCartState _$$_UserCartStateFromJson(Map<String, dynamic> json) =>
    _$_UserCartState(
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      cartSubTotal: json['cartSubTotal'] as int,
      cartTax: json['cartTax'] as int,
      cartTotal: json['cartTotal'] as int,
      cartDiscountPercent: json['cartDiscountPercent'] as int,
      cartDiscountComputed: json['cartDiscountComputed'] as int,
      cartDeliveryCharge: json['cartDeliveryCharge'] as int,
      deliverySlots: (json['deliverySlots'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      collectionSlots: (json['collectionSlots'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      selectedDeliveryAddress: json['selectedDeliveryAddress'] == null
          ? null
          : DeliveryAddresses.fromJson(json['selectedDeliveryAddress']),
      selectedTimeSlot:
          Map<String, String>.from(json['selectedTimeSlot'] as Map),
      selectedTipAmount: json['selectedTipAmount'] as int,
      discountCode: json['discountCode'] as String,
      paymentIntentID: json['paymentIntentID'] as String,
      orderID: json['orderID'] as String,
      selectedGBPxAmount: (json['selectedGBPxAmount'] as num).toDouble(),
      selectedPPLAmount: (json['selectedPPLAmount'] as num).toDouble(),
      transferringTokens: json['transferringTokens'] as bool,
      errorCompletingPayment: json['errorCompletingPayment'] as bool,
      confirmedPayment: json['confirmedPayment'] as bool,
      restaurantName: json['restaurantName'] as String,
      restaurantID: json['restaurantID'] as String,
      restaurantAddress: DeliveryAddresses.fromJson(json['restaurantAddress']),
      restaurantWalletAddress: json['restaurantWalletAddress'] as String,
      deliveryCharge: json['deliveryCharge'] as int,
      collectionCharge: json['collectionCharge'] as int,
      fulfilmentMethod:
          $enumDecode(_$FulfilmentMethodEnumMap, json['fulfilmentMethod']),
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
      'transferringTokens': instance.transferringTokens,
      'errorCompletingPayment': instance.errorCompletingPayment,
      'confirmedPayment': instance.confirmedPayment,
      'restaurantName': instance.restaurantName,
      'restaurantID': instance.restaurantID,
      'restaurantAddress': instance.restaurantAddress.toJson(),
      'restaurantWalletAddress': instance.restaurantWalletAddress,
      'deliveryCharge': instance.deliveryCharge,
      'collectionCharge': instance.collectionCharge,
      'fulfilmentMethod': _$FulfilmentMethodEnumMap[instance.fulfilmentMethod],
    };

const _$FulfilmentMethodEnumMap = {
  FulfilmentMethod.collection: 'collection',
  FulfilmentMethod.delivery: 'delivery',
};

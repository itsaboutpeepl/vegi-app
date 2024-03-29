// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createOrderForDelivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateOrderForDelivery _$$_CreateOrderForDeliveryFromJson(
        Map<String, dynamic> json) =>
    _$_CreateOrderForDelivery(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      tipAmount: json['tipAmount'] as int,
      marketingOptIn: json['marketingOptIn'] as bool,
      discountCode: json['discountCode'] as String,
      vendor: json['vendor'] as String,
      walletAddress: json['walletAddress'] as String,
      address:
          DeliveryAddresses.fromJson(json['address'] as Map<String, dynamic>),
      fulfilmentMethod: json['fulfilmentMethod'] as int,
      fulfilmentSlotFrom: json['fulfilmentSlotFrom'] as String,
      fulfilmentSlotTo: json['fulfilmentSlotTo'] as String,
    );

Map<String, dynamic> _$$_CreateOrderForDeliveryToJson(
        _$_CreateOrderForDelivery instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'tipAmount': instance.tipAmount,
      'marketingOptIn': instance.marketingOptIn,
      'discountCode': instance.discountCode,
      'vendor': instance.vendor,
      'walletAddress': instance.walletAddress,
      'address': instance.address.toJson(),
      'fulfilmentMethod': instance.fulfilmentMethod,
      'fulfilmentSlotFrom': instance.fulfilmentSlotFrom,
      'fulfilmentSlotTo': instance.fulfilmentSlotTo,
    };

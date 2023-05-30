// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createOrderForInStorePayment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateOrderForInStorePayment _$$_CreateOrderForInStorePaymentFromJson(
        Map<String, dynamic> json) =>
    _$_CreateOrderForInStorePayment(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as num,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      tipAmount: json['tipAmount'] as int,
      marketingOptIn: json['marketingOptIn'] as bool,
      discountCodes: (json['discountCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      vendor: json['vendor'] as String,
      walletAddress: json['walletAddress'] as String,
      publicId: json['publicId'] as String,
    )
      ..address =
          DeliveryAddresses.fromJson(json['address'] as Map<String, dynamic>)
      ..fulfilmentMethod = json['fulfilmentMethod'] as int
      ..fulfilmentSlotFrom = json['fulfilmentSlotFrom'] as String
      ..fulfilmentSlotTo = json['fulfilmentSlotTo'] as String
      ..isDelivery = json['isDelivery'] as bool;

Map<String, dynamic> _$$_CreateOrderForInStorePaymentToJson(
        _$_CreateOrderForInStorePayment instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'fulfilmentMethod': instance.fulfilmentMethod,
      'fulfilmentSlotFrom': instance.fulfilmentSlotFrom,
      'fulfilmentSlotTo': instance.fulfilmentSlotTo,
      'isDelivery': instance.isDelivery,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'tipAmount': instance.tipAmount,
      'marketingOptIn': instance.marketingOptIn,
      'discountCodes': instance.discountCodes,
      'vendor': instance.vendor,
      'walletAddress': instance.walletAddress,
      'publicId': instance.publicId,
    };

const _$CurrencyEnumMap = {
  Currency.GBP: 'GBP',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
  Currency.GBPx: 'GBPx',
  Currency.PPL: 'PPL',
  Currency.GBT: 'GBT',
  Currency.FUSE: 'FUSE',
  Currency.percent: 'percent',
};

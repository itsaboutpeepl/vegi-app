// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfilmentMethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FulfilmentMethod _$$_FulfilmentMethodFromJson(Map<String, dynamic> json) =>
    _$_FulfilmentMethod(
      id: json['id'] as int,
      methodType:
          $enumDecode(_$FulfilmentMethodTypeEnumMap, json['methodType']),
      slotLength: json['slotLength'] as num?,
      bufferLength: json['bufferLength'] as num?,
      orderCutoff: json['orderCutoff'] as String?,
      maxOrders: json['maxOrders'] as int?,
      maxDeliveryDistance: json['maxDeliveryDistance'] as int? ?? null,
      priceModifier: json['priceModifier'] as num?,
      vendor: json['vendor'] == null
          ? null
          : VendorDTO.fromJson(json['vendor'] as Map<String, dynamic>),
      deliveryPartner: json['deliveryPartner'] == null
          ? null
          : DeliveryPartnerDTO.fromJson(
              json['deliveryPartner'] as Map<String, dynamic>),
      openingHours: json['openingHours'] == null
          ? null
          : OpeningHours.fromJson(json['openingHours'] as Map<String, dynamic>),
      fulfilmentOrigin: json['fulfilmentOrigin'] == null
          ? null
          : DeliveryAddresses.fromJson(
              json['fulfilmentOrigin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FulfilmentMethodToJson(_$_FulfilmentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'methodType': _$FulfilmentMethodTypeEnumMap[instance.methodType]!,
      'slotLength': instance.slotLength,
      'bufferLength': instance.bufferLength,
      'orderCutoff': instance.orderCutoff,
      'maxOrders': instance.maxOrders,
      'maxDeliveryDistance': instance.maxDeliveryDistance,
      'priceModifier': instance.priceModifier,
      'vendor': instance.vendor?.toJson(),
      'deliveryPartner': instance.deliveryPartner?.toJson(),
      'openingHours': instance.openingHours?.toJson(),
      'fulfilmentOrigin': instance.fulfilmentOrigin?.toJson(),
    };

const _$FulfilmentMethodTypeEnumMap = {
  FulfilmentMethodType.collection: 'collection',
  FulfilmentMethodType.delivery: 'delivery',
  FulfilmentMethodType.inStore: 'inStore',
  FulfilmentMethodType.none: 'none',
};

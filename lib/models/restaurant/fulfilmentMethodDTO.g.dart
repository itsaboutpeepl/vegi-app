// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfilmentMethodDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FulfilmentMethodDTO _$$_FulfilmentMethodDTOFromJson(
        Map<String, dynamic> json) =>
    _$_FulfilmentMethodDTO(
      id: json['id'] as int,
      methodType:
          $enumDecode(_$FulfilmentMethodTypeEnumMap, json['methodType']),
      slotLength: json['slotLength'] as num,
      bufferLength: json['bufferLength'] as num?,
      orderCutoff: json['orderCutoff'] as String?,
      maxOrders: json['maxOrders'] as int?,
      maxDeliveryDistance: json['maxDeliveryDistance'] as num?,
      priceModifier: json['priceModifier'] as num?,
      vendor: fromJsonVendorDTO(json['vendor']),
      deliveryPartner: fromJsonDeliveryPartnerDTO(json['deliveryPartner']),
      fulfilmentOrigin: fromJsonAddressDTO(json['fulfilmentOrigin']),
      openingHours: fromJsonOpeningHours(json['openingHours']),
    );

Map<String, dynamic> _$$_FulfilmentMethodDTOToJson(
        _$_FulfilmentMethodDTO instance) =>
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
      'fulfilmentOrigin': instance.fulfilmentOrigin?.toJson(),
      'openingHours': instance.openingHours?.toJson(),
    };

const _$FulfilmentMethodTypeEnumMap = {
  FulfilmentMethodType.collection: 'collection',
  FulfilmentMethodType.delivery: 'delivery',
  FulfilmentMethodType.inStore: 'inStore',
  FulfilmentMethodType.none: 'none',
};

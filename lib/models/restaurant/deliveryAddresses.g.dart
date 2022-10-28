// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryAddresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryAddresses _$$_DeliveryAddressesFromJson(Map<String, dynamic> json) =>
    _$_DeliveryAddresses(
      internalID: json['internalID'] as int,
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String,
      townCity: json['townCity'] as String,
      postalCode: json['postalCode'] as String,
      label: $enumDecode(_$DeliveryAddressLabelEnumMap, json['label']),
    );

Map<String, dynamic> _$$_DeliveryAddressesToJson(
        _$_DeliveryAddresses instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'townCity': instance.townCity,
      'postalCode': instance.postalCode,
      'label': _$DeliveryAddressLabelEnumMap[instance.label]!,
    };

const _$DeliveryAddressLabelEnumMap = {
  DeliveryAddressLabel.home: 'home',
  DeliveryAddressLabel.work: 'work',
  DeliveryAddressLabel.hotel: 'hotel',
};

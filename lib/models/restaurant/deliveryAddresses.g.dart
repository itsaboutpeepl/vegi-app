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
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      instructions: json['instructions'] as String?,
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
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'email': instance.email,
      'instructions': instance.instructions,
    };

const _$DeliveryAddressLabelEnumMap = {
  DeliveryAddressLabel.home: 'home',
  DeliveryAddressLabel.work: 'work',
  DeliveryAddressLabel.hotel: 'hotel',
  DeliveryAddressLabel.Store: 'Store',
};

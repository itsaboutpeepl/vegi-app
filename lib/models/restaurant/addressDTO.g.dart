// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressDTO _$$_AddressDTOFromJson(Map<String, dynamic> json) =>
    _$_AddressDTO(
      id: json['id'] as int,
      label: $enumDecode(_$DeliveryAddressLabelEnumMap, json['label']),
      addressLineOne: json['addressLineOne'] as String,
      addressLineTwo: json['addressLineTwo'] as String,
      addressTownCity: json['addressTownCity'] as String,
      addressPostCode: json['addressPostCode'] as String,
      addressCountryCode: json['addressCountryCode'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      vendor: fromJsonVendorDTO(json['vendor']),
      deliveryPartner: fromJsonDeliveryPartnerDTO(json['deliveryPartner']),
      user: fromJsonUserDTO(json['user']),
    );

Map<String, dynamic> _$$_AddressDTOToJson(_$_AddressDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': _$DeliveryAddressLabelEnumMap[instance.label]!,
      'addressLineOne': instance.addressLineOne,
      'addressLineTwo': instance.addressLineTwo,
      'addressTownCity': instance.addressTownCity,
      'addressPostCode': instance.addressPostCode,
      'addressCountryCode': instance.addressCountryCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'vendor': instance.vendor?.toJson(),
      'deliveryPartner': instance.deliveryPartner?.toJson(),
      'user': instance.user?.toJson(),
    };

const _$DeliveryAddressLabelEnumMap = {
  DeliveryAddressLabel.home: 'home',
  DeliveryAddressLabel.work: 'work',
  DeliveryAddressLabel.hotel: 'hotel',
  DeliveryAddressLabel.Store: 'Store',
};

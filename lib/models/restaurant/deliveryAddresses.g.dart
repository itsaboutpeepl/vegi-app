// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryAddresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryAddresses _$$_DeliveryAddressesFromJson(Map<String, dynamic> json) =>
    _$_DeliveryAddresses(
      houseNumber: json['houseNumber'] as String,
      buildingName: json['buildingName'] as String,
      streetName: json['streetName'] as String,
      postalCode: json['postalCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DeliveryAddressesToJson(
        _$_DeliveryAddresses instance) =>
    <String, dynamic>{
      'houseNumber': instance.houseNumber,
      'buildingName': instance.buildingName,
      'streetName': instance.streetName,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

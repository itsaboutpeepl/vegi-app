// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryAddresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryAddresses _$$_DeliveryAddressesFromJson(Map<String, dynamic> json) =>
    _$_DeliveryAddresses(
      internalID: json['internalID'] as int,
      houseNumber: json['houseNumber'] as String,
      buildingName: json['buildingName'] as String,
      townCity: json['townCity'] as String,
      postalCode: json['postalCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$_DeliveryAddressesToJson(
        _$_DeliveryAddresses instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
      'houseNumber': instance.houseNumber,
      'buildingName': instance.buildingName,
      'townCity': instance.townCity,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phoneNumber': instance.phoneNumber,
    };

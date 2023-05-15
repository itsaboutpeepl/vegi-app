// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      id: json['id'] as int,
      email: json['email'] as String?,
      phoneNoCountry: json['phoneNoCountry'] as String,
      phoneCountryCode: json['phoneCountryCode'] as int,
      marketingEmailContactAllowed:
          json['marketingEmailContactAllowed'] as bool,
      marketingPhoneContactAllowed:
          json['marketingPhoneContactAllowed'] as bool,
      marketingPushContactAllowed: json['marketingPushContactAllowed'] as bool,
      marketingNotificationUtility: json['marketingNotificationUtility'] as int,
      name: json['name'] as String,
      isSuperAdmin: json['isSuperAdmin'] as bool,
      role: $enumDecode(_$VegiRoleEnumMap, json['role']),
      vendorRole: json['vendorRole'] as String,
      deliveryPartnerRole: json['deliveryPartnerRole'] as String,
      vendor: fromJsonVendorDTO(json['vendor']),
      deliveryPartner: fromJsonDeliveryPartnerDTO(json['deliveryPartner']),
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNoCountry': instance.phoneNoCountry,
      'phoneCountryCode': instance.phoneCountryCode,
      'marketingEmailContactAllowed': instance.marketingEmailContactAllowed,
      'marketingPhoneContactAllowed': instance.marketingPhoneContactAllowed,
      'marketingPushContactAllowed': instance.marketingPushContactAllowed,
      'marketingNotificationUtility': instance.marketingNotificationUtility,
      'name': instance.name,
      'isSuperAdmin': instance.isSuperAdmin,
      'role': _$VegiRoleEnumMap[instance.role]!,
      'vendorRole': instance.vendorRole,
      'deliveryPartnerRole': instance.deliveryPartnerRole,
      'vendor': instance.vendor?.toJson(),
      'deliveryPartner': instance.deliveryPartner?.toJson(),
    };

const _$VegiRoleEnumMap = {
  VegiRole.admin: 'admin',
  VegiRole.vendor: 'vendor',
  VegiRole.deliveryPartner: 'deliveryPartner',
  VegiRole.consumer: 'consumer',
  VegiRole.service: 'service',
};

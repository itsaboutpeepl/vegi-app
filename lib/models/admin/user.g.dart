// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      phoneCountryCode: json['phoneCountryCode'] as int,
      phoneNoCountry: json['phoneNoCountry'] as int,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isSuperAdmin: json['isSuperAdmin'] as bool? ?? false,
      firebaseSessionToken: json['firebaseSessionToken'] as String? ?? '',
      role: json['role'] as String? ?? 'none',
      vendor: json['vendor'] as num? ?? null,
      vendorRole: json['vendorRole'] as String? ?? 'none',
      courier: json['courier'] as num? ?? null,
      courierRole: json['courierRole'] as String? ?? 'none',
      cookie: json['cookie'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNoCountry': instance.phoneNoCountry,
      'email': instance.email,
      'name': instance.name,
      'isSuperAdmin': instance.isSuperAdmin,
      'firebaseSessionToken': instance.firebaseSessionToken,
      'role': instance.role,
      'vendor': instance.vendor,
      'vendorRole': instance.vendorRole,
      'courier': instance.courier,
      'courierRole': instance.courierRole,
      'cookie': instance.cookie,
    };

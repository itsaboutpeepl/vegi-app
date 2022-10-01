// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isSuperAdmin: json['isSuperAdmin'] as bool? ?? false,
      firebaseSessionToken: json['firebaseSessionToken'] as String? ?? '',
      vendor: json['vendor'] as num? ?? null,
      vendorRole: json['vendorRole'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'name': instance.name,
      'isSuperAdmin': instance.isSuperAdmin,
      'firebaseSessionToken': instance.firebaseSessionToken,
      'vendor': instance.vendor,
      'vendorRole': instance.vendorRole,
    };

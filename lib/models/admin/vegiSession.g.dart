// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegiSession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VegiSession _$$_VegiSessionFromJson(Map<String, dynamic> json) =>
    _$_VegiSession(
      sessionCookie: json['sessionCookie'] as String,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VegiSessionToJson(_$_VegiSession instance) =>
    <String, dynamic>{
      'sessionCookie': instance.sessionCookie,
      'user': instance.user?.toJson(),
    };

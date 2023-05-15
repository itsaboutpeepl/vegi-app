// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitingListEntry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WaitingListEntry _$$_WaitingListEntryFromJson(Map<String, dynamic> json) =>
    _$_WaitingListEntry(
      id: json['id'] as int,
      email: json['email'] as String,
      onboarded: json['onboarded'] as bool,
      origin: json['origin'] as String,
      userType: json['userType'] as String,
      order: json['order'] as int,
      emailUpdates: json['emailUpdates'] as bool,
    );

Map<String, dynamic> _$$_WaitingListEntryToJson(_$_WaitingListEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'onboarded': instance.onboarded,
      'origin': instance.origin,
      'userType': instance.userType,
      'order': instance.order,
      'emailUpdates': instance.emailUpdates,
    };

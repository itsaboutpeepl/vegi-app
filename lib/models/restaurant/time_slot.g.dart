// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeSlot _$$_TimeSlotFromJson(Map<String, dynamic> json) => _$_TimeSlot(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      priceModifier: json['priceModifier'] as int,
      fulfilmentMethodId: json['fulfilmentMethodId'] as int,
    );

Map<String, dynamic> _$$_TimeSlotToJson(_$_TimeSlot instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'priceModifier': instance.priceModifier,
      'fulfilmentMethodId': instance.fulfilmentMethodId,
    };

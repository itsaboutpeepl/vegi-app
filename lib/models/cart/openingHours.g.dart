// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openingHours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpeningHours _$$_OpeningHoursFromJson(Map<String, dynamic> json) =>
    _$_OpeningHours(
      id: json['id'] as int,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      timezone: json['timezone'] as String?,
      specialDate: json['specialDate'] as String?,
      dayOfWeek: $enumDecode(_$DayOfWeekEnumMap, json['dayOfWeek']),
      isOpen: json['isOpen'] as bool? ?? false,
      logicId: json['logicId'] as String?,
    );

Map<String, dynamic> _$$_OpeningHoursToJson(_$_OpeningHours instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'timezone': instance.timezone,
      'specialDate': instance.specialDate,
      'dayOfWeek': _$DayOfWeekEnumMap[instance.dayOfWeek]!,
      'isOpen': instance.isOpen,
      'logicId': instance.logicId,
    };

const _$DayOfWeekEnumMap = {
  DayOfWeek.Monday: 'Monday',
  DayOfWeek.Tuesday: 'Tuesday',
  DayOfWeek.Wednesday: 'Wednesday',
  DayOfWeek.Thursday: 'Thursday',
  DayOfWeek.Friday: 'Friday',
  DayOfWeek.Saturday: 'Saturday',
  DayOfWeek.Sunday: 'Sunday',
};

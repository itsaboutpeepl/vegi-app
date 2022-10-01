// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibleOrderDates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EligibleOrderDates _$$_EligibleOrderDatesFromJson(
        Map<String, dynamic> json) =>
    _$_EligibleOrderDates(
      availableDaysOfWeek: (json['availableDaysOfWeek'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      availableSpecialDates: (json['availableSpecialDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toSet() ??
          const <DateTime>{},
    );

Map<String, dynamic> _$$_EligibleOrderDatesToJson(
        _$_EligibleOrderDates instance) =>
    <String, dynamic>{
      'availableDaysOfWeek': instance.availableDaysOfWeek.toList(),
      'availableSpecialDates': instance.availableSpecialDates
          .map((e) => e.toIso8601String())
          .toList(),
    };

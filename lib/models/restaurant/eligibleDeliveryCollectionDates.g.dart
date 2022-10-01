// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibleDeliveryCollectionDates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EligibleDeliveryCollectionDates _$$_EligibleDeliveryCollectionDatesFromJson(
        Map<String, dynamic> json) =>
    _$_EligibleDeliveryCollectionDates(
      eligibleCollectionDates: EligibleOrderDates.fromJson(
          json['eligibleCollectionDates'] as Map<String, dynamic>),
      eligibleDeliveryDates: EligibleOrderDates.fromJson(
          json['eligibleDeliveryDates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EligibleDeliveryCollectionDatesToJson(
        _$_EligibleDeliveryCollectionDates instance) =>
    <String, dynamic>{
      'eligibleCollectionDates': instance.eligibleCollectionDates.toJson(),
      'eligibleDeliveryDates': instance.eligibleDeliveryDates.toJson(),
    };

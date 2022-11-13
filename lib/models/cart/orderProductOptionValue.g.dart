// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderProductOptionValue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProductOptionValue _$$_OrderProductOptionValueFromJson(
        Map<String, dynamic> json) =>
    _$_OrderProductOptionValue(
      name: json['name'] as String,
      chosenOption: json['chosenOption'] as String,
      priceModifier: json['priceModifier'] as int,
    );

Map<String, dynamic> _$$_OrderProductOptionValueToJson(
        _$_OrderProductOptionValue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'chosenOption': instance.chosenOption,
      'priceModifier': instance.priceModifier,
    };

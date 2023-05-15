// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOptionValue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOptions _$$_ProductOptionsFromJson(Map<String, dynamic> json) =>
    _$_ProductOptions(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      priceModifier: json['priceModifier'] as int? ?? 0,
      isAvaliable: json['isAvaliable'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProductOptionsToJson(_$_ProductOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priceModifier': instance.priceModifier,
      'isAvaliable': instance.isAvaliable,
    };

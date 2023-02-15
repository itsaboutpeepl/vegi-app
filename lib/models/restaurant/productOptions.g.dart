// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOptions _$$_ProductOptionsFromJson(Map<String, dynamic> json) =>
    _$_ProductOptions(
      optionID: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['priceModifier'] as int? ?? 0,
      isAvaliable: json['isAvaliable'] as bool? ?? false,
      productBarCode: json['productBarCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductOptionsToJson(_$_ProductOptions instance) =>
    <String, dynamic>{
      'id': instance.optionID,
      'name': instance.name,
      'description': instance.description,
      'priceModifier': instance.price,
      'isAvaliable': instance.isAvaliable,
      'productBarCode': instance.productBarCode,
    };

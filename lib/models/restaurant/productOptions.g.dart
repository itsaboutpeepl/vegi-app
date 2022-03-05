// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOptions _$$_ProductOptionsFromJson(Map<String, dynamic> json) =>
    _$_ProductOptions(
      optionID: json['optionID'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      isAvaliable: json['isAvaliable'] as bool,
    );

Map<String, dynamic> _$$_ProductOptionsToJson(_$_ProductOptions instance) =>
    <String, dynamic>{
      'optionID': instance.optionID,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isAvaliable': instance.isAvaliable,
    };

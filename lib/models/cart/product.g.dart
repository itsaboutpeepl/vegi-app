// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String,
      basePrice: json['basePrice'] as int,
      options: json['options'] == null
          ? const []
          : fromJsonOrderProductOptionValueList(json['options']),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'basePrice': instance.basePrice,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

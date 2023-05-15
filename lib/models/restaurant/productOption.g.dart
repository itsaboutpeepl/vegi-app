// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOption _$$_ProductOptionFromJson(Map<String, dynamic> json) =>
    _$_ProductOption(
      id: json['id'] as int,
      name: json['name'] as String,
      isRequired: json['isRequired'] as bool,
      values: fromJsonProductOptionValueList(json['values']),
    );

Map<String, dynamic> _$$_ProductOptionToJson(_$_ProductOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRequired': instance.isRequired,
      'values': instance.values.map((e) => e.toJson()).toList(),
    };

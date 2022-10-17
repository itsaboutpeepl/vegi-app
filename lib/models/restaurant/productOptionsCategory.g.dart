// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOptionsCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOptionsCategory _$$_ProductOptionsCategoryFromJson(
        Map<String, dynamic> json) =>
    _$_ProductOptionsCategory(
      categoryID: json['categoryID'] as int,
      name: json['name'] as String,
      listOfOptions: (json['listOfOptions'] as List<dynamic>)
          .map((e) => ProductOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductOptionsCategoryToJson(
        _$_ProductOptionsCategory instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'name': instance.name,
      'listOfOptions': instance.listOfOptions.map((e) => e.toJson()).toList(),
    };

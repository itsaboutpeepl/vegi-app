// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItem _$$_MenuItemFromJson(Map<String, dynamic> json) => _$_MenuItem(
      menuID: json['menuID'] as String,
      name: json['name'] as String,
      imageURLs:
          (json['imageURLs'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      options: Map<String, int>.from(json['options'] as Map),
    );

Map<String, dynamic> _$$_MenuItemToJson(_$_MenuItem instance) =>
    <String, dynamic>{
      'menuID': instance.menuID,
      'name': instance.name,
      'imageURLs': instance.imageURLs,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'options': instance.options,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItem _$_$_MenuItemFromJson(Map<String, dynamic> json) {
  return _$_MenuItem(
    name: json['name'] as String,
    imageURLs:
        (json['imageURLs'] as List<dynamic>).map((e) => e as String).toList(),
    category: json['category'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    options: (json['options'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, (e as num).toDouble()),
    ),
  );
}

Map<String, dynamic> _$_$_MenuItemToJson(_$_MenuItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageURLs': instance.imageURLs,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'options': instance.options,
    };

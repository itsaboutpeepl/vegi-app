// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItem _$_$_MenuItemFromJson(Map<String, dynamic> json) {
  return _$_MenuItem(
    name: json['name'] as String,
    imageURL: json['imageURL'] as String,
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
      'imageURL': instance.imageURL,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'options': instance.options,
    };

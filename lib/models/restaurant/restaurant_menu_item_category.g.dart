// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_menu_item_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantMenuItemCategory _$$_RestaurantMenuItemCategoryFromJson(
        Map<String, dynamic> json) =>
    _$_RestaurantMenuItemCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
      groupId: json['groupId'] as int,
      menuItems: (json['menuItems'] as List<dynamic>)
          .map((e) => RestaurantMenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantMenuItemCategoryToJson(
        _$_RestaurantMenuItemCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'groupId': instance.groupId,
      'menuItems': instance.menuItems.map((e) => e.toJson()).toList(),
    };

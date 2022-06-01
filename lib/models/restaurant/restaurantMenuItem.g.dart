// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantMenuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantMenuItem _$$_RestaurantMenuItemFromJson(
        Map<String, dynamic> json) =>
    _$_RestaurantMenuItem(
      menuItemID: json['menuItemID'] as String,
      restaurantID: json['restaurantID'] as String,
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
      category: json['category'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      extras: Map<String, int>.from(json['extras'] as Map),
      listOfProductOptions: (json['listOfProductOptions'] as List<dynamic>)
          .map((e) => ProductOptionsCategory.fromJson(e))
          .toList(),
      isFeatured: json['isFeatured'] as bool,
    );

Map<String, dynamic> _$$_RestaurantMenuItemToJson(
        _$_RestaurantMenuItem instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'restaurantID': instance.restaurantID,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'extras': instance.extras,
      'listOfProductOptions':
          instance.listOfProductOptions.map((e) => e.toJson()).toList(),
      'isFeatured': instance.isFeatured,
    };

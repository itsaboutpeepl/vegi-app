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
      categoryName: json['categoryName'] as String,
      categoryId: json['categoryId'] as int,
      price: json['price'] as int,
      description: json['description'] as String,
      extras: Map<String, int>.from(json['extras'] as Map),
      listOfProductOptions: (json['listOfProductOptions'] as List<dynamic>)
          .map(
              (e) => ProductOptionsCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFeatured: json['isFeatured'] as bool,
      priority: json['priority'] as int,
    );

Map<String, dynamic> _$$_RestaurantMenuItemToJson(
        _$_RestaurantMenuItem instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'restaurantID': instance.restaurantID,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'price': instance.price,
      'description': instance.description,
      'extras': instance.extras,
      'listOfProductOptions':
          instance.listOfProductOptions.map((e) => e.toJson()).toList(),
      'isFeatured': instance.isFeatured,
      'priority': instance.priority,
    };

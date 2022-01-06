// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantCategory _$$_RestaurantCategoryFromJson(
        Map<String, dynamic> json) =>
    _$_RestaurantCategory(
      categoryName: json['categoryName'] as String,
      imageURL: json['imageURL'] as String,
      listOfRestaurants: (json['listOfRestaurants'] as List<dynamic>)
          .map((e) => RestaurantItem.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantCategoryToJson(
        _$_RestaurantCategory instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'imageURL': instance.imageURL,
      'listOfRestaurants':
          instance.listOfRestaurants.map((e) => e.toJson()).toList(),
    };

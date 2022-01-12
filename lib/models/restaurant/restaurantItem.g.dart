// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantItem _$$_RestaurantItemFromJson(Map<String, dynamic> json) =>
    _$_RestaurantItem(
      restaurantID: json['restaurantID'] as String,
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
      category: json['category'] as String,
      costLevel: json['costLevel'] as String,
      deliveryTime: json['deliveryTime'] as String,
      rating: json['rating'] as String,
      address: json['address'] as String,
      listOfMenuItems: (json['listOfMenuItems'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantItemToJson(_$_RestaurantItem instance) =>
    <String, dynamic>{
      'restaurantID': instance.restaurantID,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'category': instance.category,
      'costLevel': instance.costLevel,
      'deliveryTime': instance.deliveryTime,
      'rating': instance.rating,
      'address': instance.address,
      'listOfMenuItems':
          instance.listOfMenuItems.map((e) => e.toJson()).toList(),
    };

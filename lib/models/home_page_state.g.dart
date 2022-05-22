// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomePageState _$$_HomePageStateFromJson(Map<String, dynamic> json) =>
    _$_HomePageState(
      restaurantCategories: (json['restaurantCategories'] as List<dynamic>)
          .map((e) => RestaurantCategory.fromJson(e))
          .toList(),
      featuredRestaurants: (json['featuredRestaurants'] as List<dynamic>)
          .map((e) => RestaurantItem.fromJson(e))
          .toList(),
      currentUserCart: UserCart.fromJson(json['currentUserCart']),
      isLoadingHomePage: json['isLoadingHomePage'] as bool,
      postalCodes: (json['postalCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_HomePageStateToJson(_$_HomePageState instance) =>
    <String, dynamic>{
      'restaurantCategories':
          instance.restaurantCategories.map((e) => e.toJson()).toList(),
      'featuredRestaurants':
          instance.featuredRestaurants.map((e) => e.toJson()).toList(),
      'currentUserCart': instance.currentUserCart.toJson(),
      'isLoadingHomePage': instance.isLoadingHomePage,
      'postalCodes': instance.postalCodes,
    };

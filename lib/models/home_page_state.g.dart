// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomePageState _$$_HomePageStateFromJson(Map<String, dynamic> json) =>
    _$_HomePageState(
      filteredRestaurants: (json['filteredRestaurants'] as List<dynamic>?)
              ?.map((e) => RestaurantItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filterRestaurantsQuery: json['filterRestaurantsQuery'] as String? ?? '',
      filteredMenuItems: (json['filteredMenuItems'] as List<dynamic>?)
              ?.map(
                  (e) => RestaurantMenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filterMenuQuery: json['filterMenuQuery'] as String? ?? '',
    );

Map<String, dynamic> _$$_HomePageStateToJson(_$_HomePageState instance) =>
    <String, dynamic>{
      'filteredRestaurants':
          instance.filteredRestaurants.map((e) => e.toJson()).toList(),
      'filterRestaurantsQuery': instance.filterRestaurantsQuery,
      'filteredMenuItems':
          instance.filteredMenuItems.map((e) => e.toJson()).toList(),
      'filterMenuQuery': instance.filterMenuQuery,
    };

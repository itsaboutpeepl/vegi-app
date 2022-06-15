import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

part 'restaurantCategory.freezed.dart';
part 'restaurantCategory.g.dart';

@Freezed()
class RestaurantCategory with _$RestaurantCategory {
  const RestaurantCategory._();

  @JsonSerializable()
  factory RestaurantCategory({
    required String categoryName,
    required String imageURL,
    required List<RestaurantItem> listOfRestaurants,
  }) = _RestaurantCategory;

  factory RestaurantCategory.fromJson(dynamic json) => _$RestaurantCategoryFromJson(json);
}

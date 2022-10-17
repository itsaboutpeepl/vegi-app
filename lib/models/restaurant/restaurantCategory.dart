import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

part 'restaurantCategory.freezed.dart';
part 'restaurantCategory.g.dart';

@Freezed()
class RestaurantCategory with _$RestaurantCategory {
  @JsonSerializable()
  factory RestaurantCategory({
    required String categoryName,
    required String imageURL,
    required List<RestaurantItem> listOfRestaurants,
  }) = _RestaurantCategory;

  const RestaurantCategory._();

  factory RestaurantCategory.fromJson(Map<String, dynamic> json) =>
      _$RestaurantCategoryFromJson(json);
}

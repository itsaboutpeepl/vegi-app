import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'restaurant_menu_item_category.freezed.dart';
part 'restaurant_menu_item_category.g.dart';

@Freezed()
class RestaurantMenuItemCategory with _$RestaurantMenuItemCategory {
  @JsonSerializable()
  factory RestaurantMenuItemCategory({
    required int id,
    required String name,
    required String imageURL,
    required int groupId,
    required List<RestaurantMenuItem> menuItems,
  }) = _RestaurantMenuItemCategory;

  const RestaurantMenuItemCategory._();

  factory RestaurantMenuItemCategory.fromJson(Map<String, dynamic> json) =>
      _$RestaurantMenuItemCategoryFromJson(json);
}

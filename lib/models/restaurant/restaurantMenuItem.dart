import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';

part 'restaurantMenuItem.freezed.dart';
part 'restaurantMenuItem.g.dart';

@Freezed()
class RestaurantMenuItem with _$RestaurantMenuItem {
  const RestaurantMenuItem._();

  @JsonSerializable()
  factory RestaurantMenuItem({
    required String menuItemID,
    required String restaurantID,
    required String name,
    required String imageURL,
    required String category,
    required int price,
    required String description,
    required Map<String, int> extras,
    required List<ProductOptionsCategory> listOfProductOptions,
    required bool isFeatured,
    required int priority,
  }) = _RestaurantMenuItem;

  factory RestaurantMenuItem.fromJson(dynamic json) => _$RestaurantMenuItemFromJson(json);

  String get formattedPrice => "£" + (this.price * 0.01).toStringAsFixed(2);
}

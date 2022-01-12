import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';

part 'restaurantItem.freezed.dart';
part 'restaurantItem.g.dart';

@freezed
class RestaurantItem with _$RestaurantItem {
  const RestaurantItem._();

  @JsonSerializable()
  factory RestaurantItem({
    required String restaurantID,
    required String name,
    required String imageURL,
    required String category,
    required String costLevel,
    required String deliveryTime,
    required String rating,
    required String address,
    required List<MenuItem> listOfMenuItems,
  }) = _RestaurantItem;

  factory RestaurantItem.fromJson(dynamic json) =>
      _$RestaurantItemFromJson(json);
}

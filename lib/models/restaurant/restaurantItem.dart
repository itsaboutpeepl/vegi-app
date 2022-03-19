import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
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
    required String phoneNumber,
    required String description,
    required List<String> deliveryRestrictionDetails,
    required String imageURL,
    required String category,
    required int costLevel,
    required int rating,
    required DeliveryAddresses address,
    required List<MenuItem> listOfMenuItems,
    required String walletAddress,
  }) = _RestaurantItem;

  factory RestaurantItem.fromJson(dynamic json) =>
      _$RestaurantItemFromJson(json);
}

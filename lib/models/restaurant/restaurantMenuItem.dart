import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';

part 'restaurantMenuItem.freezed.dart';
part 'restaurantMenuItem.g.dart';

@Freezed()
class RestaurantMenuItem with _$RestaurantMenuItem {
  @JsonSerializable()
  factory RestaurantMenuItem({
    required String menuItemID,
    required String restaurantID,
    required String name,
    required String imageURL,
    required String categoryName,
    required int categoryId,
    required int price,
    required String description,
    required Map<String, int> extras,
    required List<ProductOptionsCategory> listOfProductOptionCategories,
    required bool isFeatured,
    required int priority,
  }) = _RestaurantMenuItem;

  const RestaurantMenuItem._();

  factory RestaurantMenuItem.fromJson(Map<String, dynamic> json) =>
      _$RestaurantMenuItemFromJson(json);

  String get formattedPrice => '£${(price * 0.01).toStringAsFixed(2)}';

  TotalPrice totalPrice({
    required int quantity,
    required Map<int,ProductOptions> selectedProductOptions,
    }) {
    var total = quantity * price;

    selectedProductOptions
        .forEach((int optionID, ProductOptions productOptions) {
      total += productOptions.price;
    });

    
    return TotalPrice(
      totalPrice: total,
      totalRewards: total * 5 ~/ 100,
    );
  }
}

class TotalPrice {
  const TotalPrice({
    required this.totalPrice,
    required this.totalRewards,
  });
  final int totalPrice;
  final int totalRewards;
}

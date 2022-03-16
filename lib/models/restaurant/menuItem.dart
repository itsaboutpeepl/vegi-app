import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';

part 'menuItem.freezed.dart';
part 'menuItem.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const MenuItem._();

  @JsonSerializable()
  factory MenuItem({
    required String menuItemID,
    required String restaurantID,
    required String name,
    required List<String> imageURLs,
    required String category,
    required int price,
    required String description,
    required Map<String, int> extras,
    required List<ProductOptionsCategory> listOfProductOptions,
    required bool isFeatured,
  }) = _MenuItem;

  factory MenuItem.fromJson(dynamic json) => _$MenuItemFromJson(json);

  String get formattedPrice => "£" + (this.price * 0.01).toString();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'menu_item_state.freezed.dart';
part 'menu_item_state.g.dart';

@Freezed()
class MenuItemState with _$MenuItemState {
  @JsonSerializable()
  factory MenuItemState({
    @JsonKey(ignore: true) @Default(null) RestaurantMenuItem? menuItem,
    @JsonKey(ignore: true) @Default(0) int totalPrice,
    @JsonKey(ignore: true) @Default(0) int itemReward,
    @JsonKey(ignore: true)
    @Default({})
        Map<int, ProductOptions> selectedProductOptionsForCategory,
    @JsonKey(ignore: true) @Default(false) bool loadingProductOptions,
    @JsonKey(ignore: true) @Default(0) int quantity,
  }) = _MenuItemState;

  const MenuItemState._();

  factory MenuItemState.initial() => MenuItemState(
        totalPrice: 0,
        itemReward: 0,
        quantity: 0,
        selectedProductOptionsForCategory: {},
      );

  factory MenuItemState.fromJson(Map<String, dynamic> json) =>
      _$MenuItemStateFromJson(json);
}

class MenuItemStateConverter
    implements JsonConverter<MenuItemState, Map<String, dynamic>?> {
  const MenuItemStateConverter();

  @override
  MenuItemState fromJson(Map<String, dynamic>? json) =>
      json != null ? MenuItemState.fromJson(json) : MenuItemState.initial();

  @override
  Map<String, dynamic> toJson(MenuItemState instance) => instance.toJson();
}

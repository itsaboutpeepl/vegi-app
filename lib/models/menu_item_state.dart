import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'menu_item_state.freezed.dart';
part 'menu_item_state.g.dart';

@Freezed()
class MenuItemState with _$MenuItemState {
  @JsonSerializable()
  factory MenuItemState({
    @JsonKey(ignore: true) @Default(null) RestaurantMenuItem? menuItem,
    @JsonKey(ignore: true) @Default(Money.zeroGBPx()) Money totalPrice,
    @JsonKey(ignore: true) @Default(0) num itemReward,
    @JsonKey(ignore: true)
    @Default({})
        Map<int, ProductOptionValue> selectedProductOptionsForCategory,
    @JsonKey(ignore: true) @Default(false) bool loadingProductOptions,
    @JsonKey(ignore: true) @Default(0) int quantity,
  }) = _MenuItemState;

  const MenuItemState._();

  Future<Money> totalPriceMoney({
    required Currency inCurrency,
  }) async =>
      Money(
        currency: inCurrency,
        value: await convertCurrencyAmount(
          amount: totalPrice.value,
          fromCurrency: totalPrice.currency,
          toCurrency: inCurrency,
        ),
      );

  Future<Money> get totalPriceGBP async => Money(
        currency: Currency.GBP,
        value: await convertCurrencyAmount(
          amount: totalPrice.value,
          fromCurrency: totalPrice.currency,
          toCurrency: Currency.GBP,
        ),
      );
  Money get totalPriceGBPx => Money(
        currency: Currency.GBPx,
        value: convertInternalCurrencyAmount(
          amount: totalPrice.value,
          fromCurrency: totalPrice.currency,
          toCurrency: Currency.GBPx,
        ),
      );

  Future<Money> itemRewardMoney({
    required Currency inCurrency,
  }) async =>
      Money(
        currency: inCurrency,
        value: await convertCurrencyAmount(
          amount: itemReward,
          fromCurrency: Currency.GBPx,
          toCurrency: inCurrency,
        ),
      );

  Future<Money> get itemRewardGBP async => Money(
        currency: Currency.GBP,
        value: await convertCurrencyAmount(
          amount: itemReward,
          fromCurrency: Currency.GBPx,
          toCurrency: Currency.GBP,
        ),
      );

  factory MenuItemState.initial() => MenuItemState(
        totalPrice: const Money.zeroGBPx(),
        itemReward: 0,
        quantity: 0,
        selectedProductOptionsForCategory: {},
      );

  factory MenuItemState.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$MenuItemStateFromJson(json),
      );
}

class MenuItemStateConverter
    implements JsonConverter<MenuItemState, Map<String, dynamic>?> {
  const MenuItemStateConverter();

  @override
  MenuItemState fromJson(Map<String, dynamic>? json) => tryCatchRethrowInline(
        () => json != null
            ? MenuItemState.fromJson(json)
            : MenuItemState.initial(),
      );

  @override
  Map<String, dynamic> toJson(MenuItemState instance) => instance.toJson();
}

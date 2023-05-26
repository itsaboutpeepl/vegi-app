import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/utils/constants.dart';

part 'cartItem.freezed.dart';
part 'cartItem.g.dart';

Money gbpxPriceFromJson(dynamic json) => Money(
      currency: Currency.GBPx,
      value: (json is int || json is num || json is double) ? json as num : 0.0,
    );

dynamic gbpxPriceToJson(Money money) => money.currency == Currency.GBPx
    ? money.value
    : money.currency == Currency.GBP
        ? money.value / CurrencyRateConstants.GBPxPoundPegValue
        : 0.0;

@Freezed()
class CartItem with _$CartItem {
  @JsonSerializable()
  factory CartItem({
    required int internalID,
    required RestaurantMenuItem menuItem,

    /// this is the price in pence of the restaurant item without any product options applied
    @JsonKey(
      fromJson: gbpxPriceFromJson,
      toJson: gbpxPriceToJson,
    )
        required Money totalItemPrice,
    required int itemQuantity,
    @Default(Currency.GBPx)
        Currency itemCurrency,
    required Map<int, ProductOptionValue> selectedProductOptions,
  }) = _CartItem;

  const CartItem._();

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  String get formattedPrice {
    return totalItemPrice.inGBPxValue.formattedGBPxPrice;
  }

  List<String> get selectedProductOptionsString {
    int _counter = 0;
    final List<String> optionValues = [];
    for (final element in selectedProductOptions.values) {
      _counter++;
      optionValues.add(
        '$_counter. ${element.name} -  ${element.description}'
            .capitalizeWords(),
      );
    }
    return optionValues;
  }

  Future<Money> totalItemPriceInCurrency({
    required Currency inCurrency,
  }) async =>
      Money(
        currency: inCurrency,
        value: await convertCurrencyAmount(
          amount: totalItemPrice.value,
          fromCurrency: totalItemPrice.currency,
          toCurrency: inCurrency,
        ),
      );

  Future<Money> get totalItemPriceGBP async => Money(
        currency: Currency.GBP,
        value: await convertCurrencyAmount(
          amount: totalItemPrice.value,
          fromCurrency: totalItemPrice.currency,
          toCurrency: Currency.GBP,
        ),
      );
}

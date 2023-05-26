import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/ESCRating.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/utils/constants.dart';

part 'restaurantMenuItem.freezed.dart';
part 'restaurantMenuItem.g.dart';

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
class RestaurantMenuItem with _$RestaurantMenuItem {
  @JsonSerializable()
  factory RestaurantMenuItem({
    required String menuItemID,
    required String restaurantID,
    required String name,
    required String imageURL,
    required String categoryName,
    required int categoryId,

    // required int price,
    /// this is the price in pence of the restaurant item without any product options applied
    @JsonKey(
      fromJson: gbpxPriceFromJson,
      toJson: gbpxPriceToJson,
    )
        required Money price,
    required String description,
    required Map<String, int> extras,
    required List<ProductOptionsCategory> listOfProductOptionCategories,
    required bool isAvailable,
    required int priority,
    required bool isFeatured,
    required ProductDiscontinuedStatus status,
    String? ingredients,
    @Default('')
        String vendorInternalId,
    @Default(0)
        int stockCount,
    @Default(1)
        num stockUnitsPerProduct,
    @Default(1)
        num sizeInnerUnitValue,
    @Default('')
        String sizeInnerUnitType,
    required String productBarCode,
    @Default('')
        String supplier,
    @Default('')
        String brandName,
    @Default('')
        String taxGroup,
    ESCRating? rating,
  }) = _RestaurantMenuItem;

  const RestaurantMenuItem._();

  factory RestaurantMenuItem.fromJson(Map<String, dynamic> json) =>
      _$RestaurantMenuItemFromJson(json);

  Future<Money> priceMoneyInCurrency({
    required Currency inCurrency,
  }) async =>
      Money(
        currency: inCurrency,
        value: await convertCurrencyAmount(
          amount: price.value,
          fromCurrency: price.currency,
          toCurrency: inCurrency,
        ),
      );

  Future<Money> get priceGBP async => Money(
        currency: Currency.GBP,
        value: await convertCurrencyAmount(
          amount: price.value,
          fromCurrency: price.currency,
          toCurrency: Currency.GBP,
        ),
      );

  String get formattedPrice =>
      '£${(price.value * CurrencyRateConstants.GBPxPoundPegValue).toStringAsFixed(2)}';

  Future<TotalPrice> totalPrice({
    required int quantity,
    required Map<int, ProductOptionValue> selectedProductOptions,
    required FulfilmentMethodType fulfilmentMethod,
  }) async {
    var total = price.inGBPx * quantity;

    selectedProductOptions
        .forEach((int optionID, ProductOptionValue productOptions) {
      total += productOptions.priceGBPx.value;
    });

    return TotalPrice(
      totalPrice: total,
      totalRewards: calculateRewardsForPrice(
        rating: rating,
        penceAmount: total.inGBPxValue,
        fulfilmentMethod: fulfilmentMethod,
      ),
    );
  }
}

class TotalPrice {
  const TotalPrice({
    required this.totalPrice,
    required this.totalRewards,
  });
  final Money totalPrice;
  final int totalRewards;
}

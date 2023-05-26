import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';

part 'productOptionValue.freezed.dart';
part 'productOptionValue.g.dart';

List<ProductOptionValue> fromJsonProductOptionValueList(dynamic json) =>
    fromSailsListOfObjectJson<ProductOptionValue>(ProductOptionValue.fromJson)(
        json);
ProductOptionValue? fromJsonProductOptionValue(dynamic json) =>
    fromSailsObjectJson<ProductOptionValue>(ProductOptionValue.fromJson)(json);

@Freezed()
class ProductOptionValue with _$ProductOptionValue {
  @JsonSerializable()
  factory ProductOptionValue({
    @JsonKey(defaultValue: 0) required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: 0) required int priceModifier,
    @JsonKey(defaultValue: false) required bool isAvaliable,
  }) = _ProductOptions;

  // int get price => priceModifier;
  int get optionID => id;

  Future<Money> priceMoney({
    required Currency inCurrency,
  }) async =>
      Money(
        currency: inCurrency,
        value: await convertCurrencyAmount(
          amount: priceModifier,
          fromCurrency: Currency.GBPx,
          toCurrency: inCurrency,
        ),
      );

  Future<Money> get priceGBP async => Money(
        currency: Currency.GBP,
        value: await convertCurrencyAmount(
          amount: priceModifier,
          fromCurrency: Currency.GBPx,
          toCurrency: Currency.GBP,
        ),
      );

  Money get priceGBPx => Money(
        currency: Currency.GBP,
        value: priceModifier,
      );

  const ProductOptionValue._();

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionValueFromJson(json);

  Money get priceModifierMoney => Money(
        currency: Currency.GBPx,
        value: priceModifier,
      );
}

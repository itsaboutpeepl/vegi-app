import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

class Money {
  const Money({
    required this.currency,
    required this.value,
  });

  final Currency currency;
  final num value;

  const Money.zeroGBP()
      : currency = Currency.GBP,
        value = 0.0;
  Money.zero({
    required Currency inCurrency,
  })  : currency = inCurrency,
        value = 0.0;
  const Money.zeroGBPx()
      : currency = Currency.GBPx,
        value = 0.0;

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        currency: EnumHelpers.enumFromString(
          Currency.values,
          json['currency'] as String,
        )!,
        value: json['value'] as num,
      );

  String get formattedGBPPrice => convertInternalCurrencyAmount(
        fromCurrency: currency,
        toCurrency: Currency.GBP,
        amount: value,
      ).formattedGBPPrice;

  num get inGBPValue => convertInternalCurrencyAmount(
        fromCurrency: currency,
        toCurrency: Currency.GBP,
        amount: value,
      );
  Money get inGBP => Money(
        currency: Currency.GBP,
        value: convertInternalCurrencyAmount(
          fromCurrency: currency,
          toCurrency: Currency.GBP,
          amount: value,
        ),
      );

  num get inGBPxValue => convertInternalCurrencyAmount(
        fromCurrency: currency,
        toCurrency: Currency.GBPx,
        amount: value,
      );
  Money get inGBPx => Money(
        currency: Currency.GBPx,
        value: convertInternalCurrencyAmount(
          fromCurrency: currency,
          toCurrency: Currency.GBPx,
          amount: value,
        ),
      );
  Money inCcy(Currency inCurrency) => Money(
        currency: inCurrency,
        value: convertInternalCurrencyAmount(
          fromCurrency: currency,
          toCurrency: inCurrency,
          amount: value,
        ),
      );

  Money operator +(num amount) =>
      Money(currency: currency, value: value + amount);
  Money operator -(num amount) =>
      Money(currency: currency, value: value - amount);
  Money operator *(num amount) =>
      Money(currency: currency, value: value * amount);
  Money operator /(num amount) =>
      Money(currency: currency, value: value / amount);

  /// Truncating division operator.
  ///
  /// Performs truncating division of this number by [other].
  /// Truncating division is division where a fractional result
  /// is converted to an integer by rounding towards zero.
  ///
  /// If both operands are [int]s, then [other] must not be zero.
  /// Then `a ~/ b` corresponds to `a.remainder(b)`
  /// such that `a == (a ~/ b) * b + a.remainder(b)`.
  ///
  /// If either operand is a [double], then the other operand is converted
  /// to a double before performing the division and truncation of the result.
  /// Then `a ~/ b` is equivalent to `(a / b).truncate()`.
  /// This means that the intermediate result of the double division
  /// must be a finite integer (not an infinity or [double.nan]).
  Money operator ~/(num amount) =>
      Money(currency: currency, value: (value / amount).truncate());

  static Map<String, dynamic> toJson(Money self) =>
      <String, dynamic>{'currency': self.currency.name, 'value': self.value};

  String get formattedCurrencySymbol => currency == Currency.GBP
      ? '£'
      : currency == Currency.USD
          ? "\$"
          : '${currency.name} ';

  String get formattedPrice =>
      '${formattedCurrencySymbol}${value.toStringAsFixed(2)}';
  String get formattedPriceNoDecimals =>
      '${formattedCurrencySymbol}${value.toStringAsFixed(0)}';

  @override
  String toString() {
    return '[$currency] ${value.toStringAsFixed(2)}';
  }
}

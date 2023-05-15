import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';

class Money {
  const Money({
    required this.currency,
    required this.value,
  });

  final Currency currency;
  final num value;

  const Money.zero()
      : currency = Currency.GBP,
        value = 0.0;

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        currency: EnumHelpers.enumFromString(
          Currency.values,
          json['currency'] as String,
        )!,
        value: json['value'] as num,
      );

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
}

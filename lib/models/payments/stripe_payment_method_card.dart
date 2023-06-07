import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_method_card_check.dart';

part 'stripe_payment_method_card.freezed.dart';
part 'stripe_payment_method_card.g.dart';

List<StripePaymentMethodCard> fromJsonStripePaymentMethodCardList(
        dynamic json) =>
    fromSailsListOfObjectJson<StripePaymentMethodCard>(
        StripePaymentMethodCard.fromJson)(json);
StripePaymentMethodCard? fromJsonStripePaymentMethodCard(dynamic json) =>
    fromSailsObjectJson<StripePaymentMethodCard>(
        StripePaymentMethodCard.fromJson)(json);

@Freezed()
class StripePaymentMethodCard with _$StripePaymentMethodCard {
  @JsonSerializable()
  factory StripePaymentMethodCard({
    String? brand,
    StripePaymentMethodCardCheck? checks,
    String? country,
    int? exp_month,
    int? exp_year,
    String? fingerprint,
    String? funding,
    String? last4,
    @Default({'supported': true}) Map<String, dynamic> three_d_secure_usage,
  }) = _StripePaymentMethodCard;

  const StripePaymentMethodCard._();

  factory StripePaymentMethodCard.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripePaymentMethodCardFromJson(json),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_internal.dart';

part 'stripe_payment_intent.freezed.dart';
part 'stripe_payment_intent.g.dart';

@Freezed()
class StripePaymentIntent with _$StripePaymentIntent {
  @JsonSerializable()
  factory StripePaymentIntent({
    required String customer,
    required String ephemeralKey,
    required String publishableKey,
    required StripePaymentIntentInternal paymentIntent,
  }) = _StripePaymentIntent;

  const StripePaymentIntent._();

  factory StripePaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentFromJson(json);
}

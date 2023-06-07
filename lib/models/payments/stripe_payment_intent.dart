import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/payments/stripe_customer.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_internal.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_method_internal.dart';

part 'stripe_payment_intent.freezed.dart';
part 'stripe_payment_intent.g.dart';

@Freezed()
class StripePaymentIntent with _$StripePaymentIntent {
  @JsonSerializable()
  factory StripePaymentIntent({
    StripeCustomer? customer,
    required String ephemeralKey,
    required String publishableKey,
    required StripePaymentIntentInternal paymentIntent,
    @Default([]) List<StripePaymentMethodInternal> paymentMethods,
  }) = _StripePaymentIntent;

  const StripePaymentIntent._();

  factory StripePaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentFromJson(json);
}

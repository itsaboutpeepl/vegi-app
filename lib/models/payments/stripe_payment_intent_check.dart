import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_internal.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_method_internal.dart';

part 'stripe_payment_intent_check.freezed.dart';
part 'stripe_payment_intent_check.g.dart';

List<StripePaymentIntentCheck> fromJsonStripePaymentIntentCheckList(dynamic json) =>
  fromSailsListOfObjectJson<StripePaymentIntentCheck>(StripePaymentIntentCheck.fromJson)(json);
StripePaymentIntentCheck? fromJsonStripePaymentIntentCheck(dynamic json) =>
  fromSailsObjectJson<StripePaymentIntentCheck>(StripePaymentIntentCheck.fromJson)(json);

@Freezed()
class StripePaymentIntentCheck with _$StripePaymentIntentCheck {
  @JsonSerializable()
  factory StripePaymentIntentCheck({
    required StripePaymentIntentInternal paymentIntent,
    @Default([]) List<StripePaymentMethodInternal> paymentMethods,
  }) = _StripePaymentIntentCheck;

  const StripePaymentIntentCheck._();

  factory StripePaymentIntentCheck.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripePaymentIntentCheckFromJson(json),
      );
}

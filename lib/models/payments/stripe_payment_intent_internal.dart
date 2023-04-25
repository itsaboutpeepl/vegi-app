import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_payment_intent_internal.freezed.dart';
part 'stripe_payment_intent_internal.g.dart';

@Freezed()
class StripePaymentIntentInternal with _$StripePaymentIntentInternal {
  @JsonSerializable()
  factory StripePaymentIntentInternal({
    @JsonKey(name: 'client_secret') required String clientSecret,
    required String id,
  }) = _StripePaymentIntentInternal;

  const StripePaymentIntentInternal._();

  factory StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentInternalFromJson(json);
}

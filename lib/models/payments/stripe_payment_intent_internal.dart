import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_payment_intent_internal.freezed.dart';
part 'stripe_payment_intent_internal.g.dart';

@Freezed()
class StripePaymentIntentInternal with _$StripePaymentIntentInternal {
  @JsonSerializable()
  factory StripePaymentIntentInternal({
    required String id,
    @JsonKey(name: 'client_secret') required String clientSecret,
    required num amount,
    required String currency,
    @Default({}) Map<String, dynamic> metadata,
    @JsonKey(name: 'payment_method_types')
    @Default([]) List<String> paymentMethodTypes,
    @Default({}) Map<String, dynamic> shipping,
    @Default('') String status,
  }) = _StripePaymentIntentInternal;

  const StripePaymentIntentInternal._();

  factory StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentInternalFromJson(json);
}

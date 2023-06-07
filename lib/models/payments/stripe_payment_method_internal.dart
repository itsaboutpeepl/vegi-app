import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_billing_details.dart';
import 'package:vegan_liverpool/models/payments/stripe_customer.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_method_card.dart';

part 'stripe_payment_method_internal.freezed.dart';
part 'stripe_payment_method_internal.g.dart';

List<StripePaymentMethodInternal> fromJsonStripePaymentMethodInternalList(
        dynamic json) =>
    fromSailsListOfObjectJson<StripePaymentMethodInternal>(
        StripePaymentMethodInternal.fromJson)(json);
StripePaymentMethodInternal? fromJsonStripePaymentMethodInternal(
        dynamic json) =>
    fromSailsObjectJson<StripePaymentMethodInternal>(
        StripePaymentMethodInternal.fromJson)(json);

@Freezed()
class StripePaymentMethodInternal with _$StripePaymentMethodInternal {
  @JsonSerializable()
  factory StripePaymentMethodInternal({
    required String id,
    required StripePaymentMethodType type,
    @JsonKey(name: 'billing_details') StripeBillingDetails? billingDetails,
    StripePaymentMethodCard? card, // Only if this is a card paymentMethod
    String? customer,
    @Default(0) num created,
    required bool livemode,
    @Default({}) Map<String, dynamic> metadata,
  }) = _StripePaymentMethodInternal;

  const StripePaymentMethodInternal._();

  factory StripePaymentMethodInternal.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripePaymentMethodInternalFromJson(json),
      );
}

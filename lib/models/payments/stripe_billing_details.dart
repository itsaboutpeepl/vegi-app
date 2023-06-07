import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_address.dart';
import 'package:vegan_liverpool/models/payments/stripe_customer.dart';

part 'stripe_billing_details.freezed.dart';
part 'stripe_billing_details.g.dart';

List<StripeBillingDetails> fromJsonStripeBillingDetailsList(dynamic json) =>
    fromSailsListOfObjectJson<StripeBillingDetails>(
        StripeBillingDetails.fromJson)(json);
StripeBillingDetails? fromJsonStripeBillingDetails(dynamic json) =>
    fromSailsObjectJson<StripeBillingDetails>(StripeBillingDetails.fromJson)(
        json);

@Freezed()
class StripeBillingDetails with _$StripeBillingDetails {
  @JsonSerializable()
  factory StripeBillingDetails({
    StripeAddress? address,
    String? email,
    String? name,
    String? phone,
  }) = _StripeBillingDetails;

  const StripeBillingDetails._();

  factory StripeBillingDetails.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripeBillingDetailsFromJson(json),
      );
}

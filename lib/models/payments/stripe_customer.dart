import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_address.dart';

part 'stripe_customer.freezed.dart';
part 'stripe_customer.g.dart';

List<StripeCustomer> fromJsonStripeCustomerList(dynamic json) =>
    fromSailsListOfObjectJson<StripeCustomer>(StripeCustomer.fromJson)(json);
StripeCustomer? fromJsonStripeCustomer(dynamic json) =>
    fromSailsObjectJson<StripeCustomer>(StripeCustomer.fromJson)(json);

@Freezed()
class StripeCustomer with _$StripeCustomer {
  @JsonSerializable()
  factory StripeCustomer({
    required String id,
    StripeAddress? address,
    @Default(0) num balance,
    @Default(0) num created,
    String? currency,
    required bool livemode,
    @Default({}) Map<String, dynamic> metadata,
    String? name,
    String? phone,
    @Default([]) List<String> preferred_locals,
  }) = _StripeCustomer;

  const StripeCustomer._();

  factory StripeCustomer.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripeCustomerFromJson(json),
      );
}

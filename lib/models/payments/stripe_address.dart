import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'stripe_address.freezed.dart';
part 'stripe_address.g.dart';

List<StripeAddress> fromJsonStripeAddressList(dynamic json) =>
  fromSailsListOfObjectJson<StripeAddress>(StripeAddress.fromJson)(json);
StripeAddress? fromJsonStripeAddress(dynamic json) =>
  fromSailsObjectJson<StripeAddress>(StripeAddress.fromJson)(json);

@Freezed()
class StripeAddress with _$StripeAddress {
  @JsonSerializable()
  factory StripeAddress({
    required String? city,
    required String? country,
    required String? line1,
    required String? line2,
    required String? postal_code,
    required String? state,
  }) = _StripeAddress;

  const StripeAddress._();

  factory StripeAddress.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripeAddressFromJson(json),
      );
}

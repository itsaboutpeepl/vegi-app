import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'stripe_payment_method_card_check.freezed.dart';
part 'stripe_payment_method_card_check.g.dart';

List<StripePaymentMethodCardCheck> fromJsonStripePaymentMethodCardCheckList(dynamic json) =>
  fromSailsListOfObjectJson<StripePaymentMethodCardCheck>(StripePaymentMethodCardCheck.fromJson)(json);
StripePaymentMethodCardCheck? fromJsonStripePaymentMethodCardCheck(dynamic json) =>
  fromSailsObjectJson<StripePaymentMethodCardCheck>(StripePaymentMethodCardCheck.fromJson)(json);

@Freezed()
class StripePaymentMethodCardCheck with _$StripePaymentMethodCardCheck {
  @JsonSerializable()
  factory StripePaymentMethodCardCheck({
    @Default(StripePaymentMethodCardChecks.unchecked) StripePaymentMethodCardChecks address_line1_check,
    @Default(StripePaymentMethodCardChecks.unchecked) StripePaymentMethodCardChecks address_postal_code_check,
    @Default(StripePaymentMethodCardChecks.unchecked) StripePaymentMethodCardChecks cvc_check,
  }) = _StripePaymentMethodCardCheck;

  const StripePaymentMethodCardCheck._();

  factory StripePaymentMethodCardCheck.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$StripePaymentMethodCardCheckFromJson(json),
      );
}

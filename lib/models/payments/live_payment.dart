import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';

part 'live_payment.freezed.dart';
part 'live_payment.g.dart';

@Freezed()
class LivePayment with _$LivePayment {
  @JsonSerializable()
  factory LivePayment({
    @Default(PaymentProcessingStatus.none) PaymentProcessingStatus status,
    @Default(0) num amount,
    @Default(Currency.GBP) Currency currency,
    @Default(PaymentType.cardPayment) PaymentType type,
    @Default(PaymentTechnology.card) PaymentTechnology technology,
  }) = _LivePayment;

  const LivePayment._();

  factory LivePayment.initial() => LivePayment(
    amount: 0.0,
    currency: Currency.GBP,
    status: PaymentProcessingStatus.none,
    technology: PaymentTechnology.card,
    type: PaymentType.cardPayment,
  );

  factory LivePayment.fromJson(Map<String, dynamic> json) =>
      _$LivePaymentFromJson(json);
}

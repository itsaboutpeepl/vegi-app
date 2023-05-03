import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/payments/green_bean_token.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@Freezed()
class Transaction with _$Transaction {
  @JsonSerializable()
  factory Transaction({
    required num amount,
    required Currency currency,
    required GreenBeanToken rewards,
    required PaymentStatus paymentStatus,
    required DateTime paymentCreatedTimeStamp,
    required DateTime paymentCompletedTimeStamp,
    required String receiverId,
    required String payerId,
    required PaymentNetworkType paymentNetworkType,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

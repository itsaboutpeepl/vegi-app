import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'transaction_item.freezed.dart';
part 'transaction_item.g.dart';

@Freezed()
class TransactionItem with _$TransactionItem {
  @JsonSerializable()
  factory TransactionItem({
    @JsonKey(fromJson: toTS) required DateTime timestamp,
    required num amount,
    required Currency currency,
    @JsonKey(fromJson: objectIdFromJson) required int receiver,
    @JsonKey(fromJson: objectIdFromJson) required int payer,
    @JsonKey(fromJson: objectIdFromJson) required int order,
  }) = _TransactionItem;

  const TransactionItem._();

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);
}

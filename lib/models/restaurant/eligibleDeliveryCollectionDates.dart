import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/eligibleOrderDates.dart';

part 'eligibleDeliveryCollectionDates.freezed.dart';
part 'eligibleDeliveryCollectionDates.g.dart';

@Freezed()
class EligibleDeliveryCollectionDates with _$EligibleDeliveryCollectionDates {
  const EligibleDeliveryCollectionDates._();

  @JsonSerializable()
  factory EligibleDeliveryCollectionDates({
    required EligibleOrderDates eligibleCollectionDates,
    required EligibleOrderDates eligibleDeliveryDates,
  }) = _EligibleDeliveryCollectionDates;

  factory EligibleDeliveryCollectionDates.fromJson(Map<String, dynamic> json) =>
      _$EligibleDeliveryCollectionDatesFromJson(json);
}

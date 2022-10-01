import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/eligibleOrderDates.dart';

part 'fullfilmentMethods.freezed.dart';
part 'fullfilmentMethods.g.dart';

eligibleOrderDatesFromJson(Map<String, Set<dynamic>> json) =>
    EligibleOrderDates.fromJson(json);

eligibleOrderDatesToJson(EligibleOrderDates dates) => <String, Set<dynamic>>{
      'availableDaysOfWeek': dates.availableDaysOfWeek,
      'availableSpecialDates': dates.availableSpecialDatesSanitized
    };

@Freezed()
class FullfilmentMethods with _$FullfilmentMethods {
  const FullfilmentMethods._();

  @JsonSerializable()
  factory FullfilmentMethods({
    required Map<String, dynamic>? collectionMethod,
    required Map<String, dynamic>? deliveryMethod,
    required List<Map<String, String>> collectionSlots,
    required List<Map<String, String>> deliverySlots,
    @JsonKey(fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
        required EligibleOrderDates eligibleCollectionDates,
    @JsonKey(fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
        required EligibleOrderDates eligibleDeliveryDates,
  }) = _FullfilmentMethods;

  factory FullfilmentMethods.fromJson(dynamic json) => _$FullfilmentMethodsFromJson(json);
}

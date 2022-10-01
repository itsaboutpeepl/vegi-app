import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'eligibleOrderDates.freezed.dart';
part 'eligibleOrderDates.g.dart';

@Freezed()
class EligibleOrderDates with _$EligibleOrderDates {
  const EligibleOrderDates._();

  Set<String> get availableSpecialDatesSanitized =>
      availableSpecialDates.map(sanitizeDateTime).toSet();

  @JsonSerializable()
  const factory EligibleOrderDates({
    @Default(<String>{}) Set<String> availableDaysOfWeek,
    @Default(<DateTime>{}) Set<DateTime> availableSpecialDates,
  }) = _EligibleOrderDates;

  factory EligibleOrderDates.fromJson(Map<String, dynamic> json) =>
      _$EligibleOrderDatesFromJson(json);
}

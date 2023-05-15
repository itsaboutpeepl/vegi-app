import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'openingHours.freezed.dart';
part 'openingHours.g.dart';

List<OpeningHours> fromJsonOpeningHoursList(dynamic json) =>
  fromSailsListOfObjectJson<OpeningHours>(OpeningHours.fromJson)(json);
OpeningHours? fromJsonOpeningHours(dynamic json) =>
  fromSailsObjectJson<OpeningHours>(OpeningHours.fromJson)(json);

@Freezed()
class OpeningHours with _$OpeningHours {
  @JsonSerializable()
  factory OpeningHours({
    required int id,
    required String openTime,
    required String
        closeTime, // For now retain as strings and parse when needed, create an Hour object if needed, dont use date which needs a date as well.
    required String? timezone,
    required String? specialDate,
    required DayOfWeek dayOfWeek,
    @Default(false) bool isOpen,
    required String? logicId,
  }) = _OpeningHours;

  const OpeningHours._();

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'waitingListEntry.freezed.dart';
part 'waitingListEntry.g.dart';

List<WaitingListEntry> fromJsonWaitingListEntryList(dynamic json) =>
  fromSailsListOfObjectJson<WaitingListEntry>(WaitingListEntry.fromJson)(json);
WaitingListEntry? fromJsonWaitingListEntry(dynamic json) =>
  fromSailsObjectJson<WaitingListEntry>(WaitingListEntry.fromJson)(json);


@Freezed()
class WaitingListEntry with _$WaitingListEntry {
  @JsonSerializable()
  factory WaitingListEntry({
    required int id,
    required String email,
    required bool onboarded,
    required String origin,
    required String userType,
    required int order,
    required bool emailUpdates,
  }) = _WaitingListEntry;

  const WaitingListEntry._();

  factory WaitingListEntry.fromJson(Map<String, dynamic> json) =>
      _$WaitingListEntryFromJson(json);

  @override
  String toString() =>
      'WaitingListEntry : email: $email [updates:$emailUpdates]';
}

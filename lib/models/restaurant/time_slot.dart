import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/cart/order.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

@Freezed()
class TimeSlot with _$TimeSlot {
  @JsonSerializable()
  factory TimeSlot({
    required final DateTime startTime,
    required final DateTime endTime,
    required final int priceModifier,
    required final int fulfilmentMethodId,
  }) = _TimeSlot;

  const TimeSlot._();

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);

  factory TimeSlot.fromJsonApi(Map<String, dynamic> json) {
    return TimeSlot(
      fulfilmentMethodId: json['fulfilmentMethod']['id'] as int? ?? 0,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      priceModifier: json['fulfilmentMethod']['priceModifier'] as int? ?? 0,
    );
  }

  String get formattedDate {
    final DateFormat hourMinFormatter = DateFormat(DateFormat.HOUR_MINUTE);
    final DateFormat monthFormatter = DateFormat(DateFormat.ABBR_MONTH);
    final String startHour = hourMinFormatter
        .format(startTime)
        .replaceAll(' AM', '')
        .replaceAll(' PM', '');

    final String endHour = hourMinFormatter.format(endTime).replaceAll(' ', '');

    final String month = monthFormatter.format(startTime);

    return '$startHour-$endHour, ${startTime.ordinalDate()} $month';
  }

  String get formattedDateTimeOnly {
    final DateFormat dateFormat = DateFormat(DateFormat.HOUR_MINUTE);

    return '${dateFormat.format(startTime).replaceAll(' AM', '').replaceAll(' PM', '')}-${dateFormat.format(endTime)}';
  }
}

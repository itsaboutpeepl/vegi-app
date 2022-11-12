import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

extension CapitalizeString on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  String maxChars(int count) {
    if (length > count) {
      return substring(0, count);
    }
    return this;
  }

  String capitalizeWords() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.capitalize())
        .join(' ');
  }
}

extension EnumHelpers on Enum {
  static T? enumFromStringPreDart2dot15<T>(Iterable<T> values, String? value) {
    return value == null
        ? null
        : values.firstWhereOrNull(
            (type) => type.toString().split('.').last == value);
  }

  static T? enumFromString<T extends Enum>(Iterable<T> values, String? value) {
    return value == null ? null : values.asNameMap()[value];
  }
}

extension NumHelpers on num {
  String get formattedPrice => '£${(this / 100).toStringAsFixed(2)}';
  String get formattedPriceNoDec => '£${(this / 100).toStringAsFixed(0)}';
}

extension DateTimeHelpers on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  String get formattedForAPI {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    return formatter.format(this);
  }

  static DateTime get nowDateOnly {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return DateTime.parse(formatter.format(DateTime.now()));
  }

  /// Returns a [String] containing the relative day from [other].
  /// Counts in terms of absolute values.
  ///
  /// Example:
  ///
  /// Current Date is 12-02-2022
  ///
  /// Other Date is 13-02-2022: Will return 'Today'
  ///
  /// Other date is 14-02-2022: Will return 'Tomorrow'
  ///
  /// Any other day is returned as [DateFormat.WEEKDAY]
  String relativeDay(DateTime other) {
    switch (difference(other).inDays.abs()) {
      case 0:
        return 'Today';
      case 1:
        return 'Tomorrow';
      default:
        return DateFormat(DateFormat.WEEKDAY).format(other);
    }
  }

  /// Returns a [String] containing the Ordinal Date
  ///
  /// Example:
  ///
  /// 01-12-2022 will return 1st
  ///
  /// 29-08-2021 will return 29th
  String ordinalDate() {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }

    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}

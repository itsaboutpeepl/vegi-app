import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:tuple/tuple.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

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

  String capitalizeWordsFromLowerCamelCase() {
    return replaceAll(RegExp('(a-z)([A-Z])'), r'$1'.toUpperCase() + r'_$2')
        .split('_')
        .map((str) => str.capitalize())
        .join(' ');
  }

  String capitalizeWordsFromLowerSnakeCase() {
    return split('_').map((str) => str.capitalize()).join(' ');
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
  String get formattedGBPxPrice => '£${(this / 100).toStringAsFixed(2)}';
  String get formattedGBPxPriceNoDec => '£${(this / 100).toStringAsFixed(0)}';
  String get formattedGBPPrice => '£${(this).toStringAsFixed(2)}';
  String get formattedGBPPriceNoDec => '£${(this).toStringAsFixed(0)}';
}

final _thLookUp = <int, String>{
  1: 'st',
  2: 'nd',
  3: 'rd',
  4: 'th',
  5: 'th',
  6: 'th',
  7: 'th',
  8: 'th',
  9: 'th',
};

String getThSuffix(int i) => _thLookUp.containsKey(i) ? _thLookUp[i]! : 'th';

extension IntHelpers on int {
  DateTime toTimeStamp() => DateTime.fromMillisecondsSinceEpoch(
        this,
      ).toLocal();
  String thFormatted({
    required int dontFormatStrictlyAbove,
  }) =>
      '$this${this <= dontFormatStrictlyAbove ? getThSuffix(this) : ''}';
}

extension DoubleHelpers on double {
  String toPercent([int decimalPlaces = 0]) =>
      '${(this * 100.0).toStringAsFixed(decimalPlaces)}%';
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

  String get formattedForUI {
    final DateFormat formatter = DateFormat(
      'HH:mm - E, d MMM',
    ); // ~ https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

    return formatter.format(this);
  }

  static DateTime get nowDateOnly {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return DateTime.parse(formatter.format(DateTime.now()));
  }

  static DateTime parseFormat(String value, DateFormat format) =>
      format.parse(value);
  static DateTime parseISOFormat(String value) => DateTime.parse(value);

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
        return DateFormat(DateFormat.WEEKDAY).format(this);
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

extension IterableHelpers<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (final element in this) {
      yield convert(index++, element);
    }
  }

  bool indexExists(int index) {
    return toList().length > index && index > -1;
  }

  Tuple2<T?, Iterable<T>> separateElement(
    bool Function(T element) selector,
  ) {
    var selected = false;
    final outL = <T>[];
    T? outEl;
    for (final element in this) {
      if (!selected && selector(element)) {
        selected = true;
        outEl = element;
      } else {
        outL.add(element);
      }
    }
    return Tuple2<T?, Iterable<T>>(outEl, outL);
  }
}

extension ListHelpers<T> on List<T> {
  List<T> sortInline(int Function(T a, T b) convert) {
    return sorted((a, b) => convert(a, b));
  }

  T? get firstOrNull => isEmpty ? null : first;
}

extension MapHelpers on Map<String, dynamic> {
  bool containsKeyAndNotNull(String key) =>
      containsKey(key) && this[key] != null;
}

extension MoneyIterableHelpers on Iterable<Money> {
  Future<Money> sum({
    Currency? outputCurrency,
  }) async {
    if (outputCurrency == null) {
      if (isEmpty) {
        return const Money.zeroGBP();
      }
      outputCurrency = first.currency;
    }
    final fxdAmounts = await Future.wait(
      map(
        (money) => convertCurrencyAmount(
          amount: money.value,
          fromCurrency: money.currency,
          toCurrency: outputCurrency!,
        ),
      ),
    );
    return Money(
      currency: outputCurrency,
      value: fxdAmounts.sum,
    );
  }
}

extension NumIterableHelpers<T> on Iterable<T> {
  /// Reduces a collection to a maximum value by iteratively comparing elements
  /// of the collection using the provided function.
  ///
  /// Provided maxComparitor(a,b) returns true if a > b else false
  ///
  /// Example of calculating the sum of an iterable:
  /// ```dart
  /// final numbers = <double>[10, 2, 5, 0.5];
  /// final result = numbers.min((a, b) => a > b);
  /// print(result); // 10
  /// ```
  T max({
    bool Function(T, T)? maxComparitor,
  }) {
    if (maxComparitor != null) {
      return reduce(
        (value, element) => maxComparitor(value, element) ? value : element,
      );
    } else if (length > 0 && [0] is num && this is Iterable<num>) {
      return (this as Iterable<num>).reduce(
        (value, element) => value > element ? value : element,
      ) as T;
    } else {
      log.error(
          'Type of array vals must either extend a num or have a comparitor defined!');
      throw TypeError();
    }
  }

  /// Reduces a collection to a minimum value by iteratively comparing elements
  /// of the collection using the provided function.
  ///
  /// Provided minComparitor(a,b) returns true if a < b else false
  ///
  /// Example of calculating the sum of an iterable:
  /// ```dart
  /// final numbers = <double>[10, 2, 5, 0.5];
  /// final result = numbers.min((a, b) => a < b);
  /// print(result); // 0.5
  /// ```
  T min({
    bool Function(T, T)? minComparitor,
  }) {
    if (minComparitor != null) {
      return reduce(
        (value, element) => minComparitor(value, element) ? value : element,
      );
    } else if (length > 0 && [0] is num && this is Iterable<num>) {
      return (this as Iterable<num>).reduce(
        (value, element) => value < element ? value : element,
      ) as T;
    } else {
      log.error(
          'Type of array vals must either extend a num or have a comparitor defined!');
      throw TypeError();
    }
  }

  /// Reduces a collection to its sum by iteratively summing elements
  /// of the collection.
  ///
  /// Example of calculating the sum of an iterable:
  /// ```dart
  /// final numbers = <T>[10, 2, 5, 0.5];
  /// final result = numbers.sum<T>((num previousValue, T nextValue) => nextValue + previousValue);
  /// print(result); // 17.5
  /// ```
  num sum([
    num Function(
      num previousVal,
      T next,
    )?
        sumFunc,
  ]) {
    if (sumFunc != null) {
      return fold<num>(
        0.0,
        (previousValue, element) => sumFunc(previousValue, element),
      );
    } else if (length > 0 && first is num && this is Iterable<num>) {
      if (T is num) {
        return (this as Iterable<num>).fold<num>(
          0.0,
          (previousValue, element) => previousValue + element,
        );
      } else if (T is double) {
        return (this as Iterable<double>).reduce(
          (value, element) => value + element,
        );
      } else if (T is int) {
        return (this as Iterable<int>).reduce(
          (value, element) => value + element,
        );
      } else {
        return cast<num>().reduce(
          (value, element) => value + element,
        );
      }
    } else if (length == 0) {
      return 0.0;
    } else {
      log.error(
          'Type of array vals must either extend a num or have a comparitor defined!');
      throw TypeError();
    }
  }

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// Example:
  /// ```dart
  /// final numbers = <int>[1, 2, 3, 5, 6, 7];
  /// var result = numbers.firstWhereExists((element) => element < 5); // 1
  /// result = numbers.firstWhereExists((element) => element > 5); // 6
  /// result =
  ///     numbers.firstWhereExists((element) => element > 10, orElse: () => -1); // -1
  /// ```
  ///
  /// If no element satisfies [test], the result of invoking the [orElse]
  /// function is returned.
  /// If [orElse] is omitted, it defaults to null.
  T? firstWhereExists(
    bool Function(T element) test, {
    T Function()? orElse,
  }) {
    for (final T element in this) {
      if (test(element)) return element;
    }
    if (orElse != null) {
      return orElse();
    } else {
      return null;
    }
  }
}

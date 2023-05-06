// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'openingHours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) {
  return _OpeningHours.fromJson(json);
}

/// @nodoc
mixin _$OpeningHours {
  int get id => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get closeTime =>
      throw _privateConstructorUsedError; // For now retain as strings and parse when needed, create an Hour object if needed, dont use date which needs a date as well.
  String? get timezone => throw _privateConstructorUsedError;
  String? get specialDate => throw _privateConstructorUsedError;
  DayOfWeek get dayOfWeek => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  String? get logicId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpeningHoursCopyWith<OpeningHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningHoursCopyWith<$Res> {
  factory $OpeningHoursCopyWith(
          OpeningHours value, $Res Function(OpeningHours) then) =
      _$OpeningHoursCopyWithImpl<$Res, OpeningHours>;
  @useResult
  $Res call(
      {int id,
      String openTime,
      String closeTime,
      String? timezone,
      String? specialDate,
      DayOfWeek dayOfWeek,
      bool isOpen,
      String? logicId});
}

/// @nodoc
class _$OpeningHoursCopyWithImpl<$Res, $Val extends OpeningHours>
    implements $OpeningHoursCopyWith<$Res> {
  _$OpeningHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? timezone = freezed,
    Object? specialDate = freezed,
    Object? dayOfWeek = null,
    Object? isOpen = null,
    Object? logicId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      specialDate: freezed == specialDate
          ? _value.specialDate
          : specialDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      logicId: freezed == logicId
          ? _value.logicId
          : logicId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpeningHoursCopyWith<$Res>
    implements $OpeningHoursCopyWith<$Res> {
  factory _$$_OpeningHoursCopyWith(
          _$_OpeningHours value, $Res Function(_$_OpeningHours) then) =
      __$$_OpeningHoursCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String openTime,
      String closeTime,
      String? timezone,
      String? specialDate,
      DayOfWeek dayOfWeek,
      bool isOpen,
      String? logicId});
}

/// @nodoc
class __$$_OpeningHoursCopyWithImpl<$Res>
    extends _$OpeningHoursCopyWithImpl<$Res, _$_OpeningHours>
    implements _$$_OpeningHoursCopyWith<$Res> {
  __$$_OpeningHoursCopyWithImpl(
      _$_OpeningHours _value, $Res Function(_$_OpeningHours) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? timezone = freezed,
    Object? specialDate = freezed,
    Object? dayOfWeek = null,
    Object? isOpen = null,
    Object? logicId = freezed,
  }) {
    return _then(_$_OpeningHours(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      specialDate: freezed == specialDate
          ? _value.specialDate
          : specialDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      logicId: freezed == logicId
          ? _value.logicId
          : logicId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OpeningHours extends _OpeningHours {
  _$_OpeningHours(
      {required this.id,
      required this.openTime,
      required this.closeTime,
      required this.timezone,
      required this.specialDate,
      required this.dayOfWeek,
      this.isOpen = false,
      required this.logicId})
      : super._();

  factory _$_OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$$_OpeningHoursFromJson(json);

  @override
  final int id;
  @override
  final String openTime;
  @override
  final String closeTime;
// For now retain as strings and parse when needed, create an Hour object if needed, dont use date which needs a date as well.
  @override
  final String? timezone;
  @override
  final String? specialDate;
  @override
  final DayOfWeek dayOfWeek;
  @override
  @JsonKey()
  final bool isOpen;
  @override
  final String? logicId;

  @override
  String toString() {
    return 'OpeningHours(id: $id, openTime: $openTime, closeTime: $closeTime, timezone: $timezone, specialDate: $specialDate, dayOfWeek: $dayOfWeek, isOpen: $isOpen, logicId: $logicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpeningHours &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.specialDate, specialDate) ||
                other.specialDate == specialDate) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.logicId, logicId) || other.logicId == logicId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, openTime, closeTime,
      timezone, specialDate, dayOfWeek, isOpen, logicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpeningHoursCopyWith<_$_OpeningHours> get copyWith =>
      __$$_OpeningHoursCopyWithImpl<_$_OpeningHours>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpeningHoursToJson(
      this,
    );
  }
}

abstract class _OpeningHours extends OpeningHours {
  factory _OpeningHours(
      {required final int id,
      required final String openTime,
      required final String closeTime,
      required final String? timezone,
      required final String? specialDate,
      required final DayOfWeek dayOfWeek,
      final bool isOpen,
      required final String? logicId}) = _$_OpeningHours;
  _OpeningHours._() : super._();

  factory _OpeningHours.fromJson(Map<String, dynamic> json) =
      _$_OpeningHours.fromJson;

  @override
  int get id;
  @override
  String get openTime;
  @override
  String get closeTime;
  @override // For now retain as strings and parse when needed, create an Hour object if needed, dont use date which needs a date as well.
  String? get timezone;
  @override
  String? get specialDate;
  @override
  DayOfWeek get dayOfWeek;
  @override
  bool get isOpen;
  @override
  String? get logicId;
  @override
  @JsonKey(ignore: true)
  _$$_OpeningHoursCopyWith<_$_OpeningHours> get copyWith =>
      throw _privateConstructorUsedError;
}

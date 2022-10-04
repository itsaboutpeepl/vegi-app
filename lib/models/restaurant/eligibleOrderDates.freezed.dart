// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'eligibleOrderDates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EligibleOrderDates _$EligibleOrderDatesFromJson(Map<String, dynamic> json) {
  return _EligibleOrderDates.fromJson(json);
}

/// @nodoc
mixin _$EligibleOrderDates {
  Set<String> get availableDaysOfWeek => throw _privateConstructorUsedError;
  Set<DateTime> get availableSpecialDates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EligibleOrderDatesCopyWith<EligibleOrderDates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibleOrderDatesCopyWith<$Res> {
  factory $EligibleOrderDatesCopyWith(
          EligibleOrderDates value, $Res Function(EligibleOrderDates) then) =
      _$EligibleOrderDatesCopyWithImpl<$Res>;
  $Res call(
      {Set<String> availableDaysOfWeek, Set<DateTime> availableSpecialDates});
}

/// @nodoc
class _$EligibleOrderDatesCopyWithImpl<$Res>
    implements $EligibleOrderDatesCopyWith<$Res> {
  _$EligibleOrderDatesCopyWithImpl(this._value, this._then);

  final EligibleOrderDates _value;
  // ignore: unused_field
  final $Res Function(EligibleOrderDates) _then;

  @override
  $Res call({
    Object? availableDaysOfWeek = freezed,
    Object? availableSpecialDates = freezed,
  }) {
    return _then(_value.copyWith(
      availableDaysOfWeek: availableDaysOfWeek == freezed
          ? _value.availableDaysOfWeek
          : availableDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      availableSpecialDates: availableSpecialDates == freezed
          ? _value.availableSpecialDates
          : availableSpecialDates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>,
    ));
  }
}

/// @nodoc
abstract class _$$_EligibleOrderDatesCopyWith<$Res>
    implements $EligibleOrderDatesCopyWith<$Res> {
  factory _$$_EligibleOrderDatesCopyWith(_$_EligibleOrderDates value,
          $Res Function(_$_EligibleOrderDates) then) =
      __$$_EligibleOrderDatesCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<String> availableDaysOfWeek, Set<DateTime> availableSpecialDates});
}

/// @nodoc
class __$$_EligibleOrderDatesCopyWithImpl<$Res>
    extends _$EligibleOrderDatesCopyWithImpl<$Res>
    implements _$$_EligibleOrderDatesCopyWith<$Res> {
  __$$_EligibleOrderDatesCopyWithImpl(
      _$_EligibleOrderDates _value, $Res Function(_$_EligibleOrderDates) _then)
      : super(_value, (v) => _then(v as _$_EligibleOrderDates));

  @override
  _$_EligibleOrderDates get _value => super._value as _$_EligibleOrderDates;

  @override
  $Res call({
    Object? availableDaysOfWeek = freezed,
    Object? availableSpecialDates = freezed,
  }) {
    return _then(_$_EligibleOrderDates(
      availableDaysOfWeek: availableDaysOfWeek == freezed
          ? _value.availableDaysOfWeek
          : availableDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      availableSpecialDates: availableSpecialDates == freezed
          ? _value.availableSpecialDates
          : availableSpecialDates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_EligibleOrderDates extends _EligibleOrderDates {
  const _$_EligibleOrderDates(
      {this.availableDaysOfWeek = const <String>{},
      this.availableSpecialDates = const <DateTime>{}})
      : super._();

  factory _$_EligibleOrderDates.fromJson(Map<String, dynamic> json) =>
      _$$_EligibleOrderDatesFromJson(json);

  @override
  @JsonKey()
  final Set<String> availableDaysOfWeek;
  @override
  @JsonKey()
  final Set<DateTime> availableSpecialDates;

  @override
  String toString() {
    return 'EligibleOrderDates(availableDaysOfWeek: $availableDaysOfWeek, availableSpecialDates: $availableSpecialDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EligibleOrderDates &&
            const DeepCollectionEquality()
                .equals(other.availableDaysOfWeek, availableDaysOfWeek) &&
            const DeepCollectionEquality()
                .equals(other.availableSpecialDates, availableSpecialDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableDaysOfWeek),
      const DeepCollectionEquality().hash(availableSpecialDates));

  @JsonKey(ignore: true)
  @override
  _$$_EligibleOrderDatesCopyWith<_$_EligibleOrderDates> get copyWith =>
      __$$_EligibleOrderDatesCopyWithImpl<_$_EligibleOrderDates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EligibleOrderDatesToJson(this);
  }
}

abstract class _EligibleOrderDates extends EligibleOrderDates {
  const factory _EligibleOrderDates(
      {final Set<String> availableDaysOfWeek,
      final Set<DateTime> availableSpecialDates}) = _$_EligibleOrderDates;
  const _EligibleOrderDates._() : super._();

  factory _EligibleOrderDates.fromJson(Map<String, dynamic> json) =
      _$_EligibleOrderDates.fromJson;

  @override
  Set<String> get availableDaysOfWeek => throw _privateConstructorUsedError;
  @override
  Set<DateTime> get availableSpecialDates => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EligibleOrderDatesCopyWith<_$_EligibleOrderDates> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'eligibleDeliveryCollectionDates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EligibleDeliveryCollectionDates _$EligibleDeliveryCollectionDatesFromJson(
    Map<String, dynamic> json) {
  return _EligibleDeliveryCollectionDates.fromJson(json);
}

/// @nodoc
mixin _$EligibleDeliveryCollectionDates {
  EligibleOrderDates get eligibleCollectionDates =>
      throw _privateConstructorUsedError;
  EligibleOrderDates get eligibleDeliveryDates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EligibleDeliveryCollectionDatesCopyWith<EligibleDeliveryCollectionDates>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibleDeliveryCollectionDatesCopyWith<$Res> {
  factory $EligibleDeliveryCollectionDatesCopyWith(
          EligibleDeliveryCollectionDates value,
          $Res Function(EligibleDeliveryCollectionDates) then) =
      _$EligibleDeliveryCollectionDatesCopyWithImpl<$Res>;
  $Res call(
      {EligibleOrderDates eligibleCollectionDates,
      EligibleOrderDates eligibleDeliveryDates});

  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates;
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates;
}

/// @nodoc
class _$EligibleDeliveryCollectionDatesCopyWithImpl<$Res>
    implements $EligibleDeliveryCollectionDatesCopyWith<$Res> {
  _$EligibleDeliveryCollectionDatesCopyWithImpl(this._value, this._then);

  final EligibleDeliveryCollectionDates _value;
  // ignore: unused_field
  final $Res Function(EligibleDeliveryCollectionDates) _then;

  @override
  $Res call({
    Object? eligibleCollectionDates = freezed,
    Object? eligibleDeliveryDates = freezed,
  }) {
    return _then(_value.copyWith(
      eligibleCollectionDates: eligibleCollectionDates == freezed
          ? _value.eligibleCollectionDates
          : eligibleCollectionDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      eligibleDeliveryDates: eligibleDeliveryDates == freezed
          ? _value.eligibleDeliveryDates
          : eligibleDeliveryDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
    ));
  }

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates {
    return $EligibleOrderDatesCopyWith<$Res>(_value.eligibleCollectionDates,
        (value) {
      return _then(_value.copyWith(eligibleCollectionDates: value));
    });
  }

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates {
    return $EligibleOrderDatesCopyWith<$Res>(_value.eligibleDeliveryDates,
        (value) {
      return _then(_value.copyWith(eligibleDeliveryDates: value));
    });
  }
}

/// @nodoc
abstract class _$EligibleDeliveryCollectionDatesCopyWith<$Res>
    implements $EligibleDeliveryCollectionDatesCopyWith<$Res> {
  factory _$EligibleDeliveryCollectionDatesCopyWith(
          _EligibleDeliveryCollectionDates value,
          $Res Function(_EligibleDeliveryCollectionDates) then) =
      __$EligibleDeliveryCollectionDatesCopyWithImpl<$Res>;
  @override
  $Res call(
      {EligibleOrderDates eligibleCollectionDates,
      EligibleOrderDates eligibleDeliveryDates});

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates;
  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates;
}

/// @nodoc
class __$EligibleDeliveryCollectionDatesCopyWithImpl<$Res>
    extends _$EligibleDeliveryCollectionDatesCopyWithImpl<$Res>
    implements _$EligibleDeliveryCollectionDatesCopyWith<$Res> {
  __$EligibleDeliveryCollectionDatesCopyWithImpl(
      _EligibleDeliveryCollectionDates _value,
      $Res Function(_EligibleDeliveryCollectionDates) _then)
      : super(_value, (v) => _then(v as _EligibleDeliveryCollectionDates));

  @override
  _EligibleDeliveryCollectionDates get _value =>
      super._value as _EligibleDeliveryCollectionDates;

  @override
  $Res call({
    Object? eligibleCollectionDates = freezed,
    Object? eligibleDeliveryDates = freezed,
  }) {
    return _then(_EligibleDeliveryCollectionDates(
      eligibleCollectionDates: eligibleCollectionDates == freezed
          ? _value.eligibleCollectionDates
          : eligibleCollectionDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      eligibleDeliveryDates: eligibleDeliveryDates == freezed
          ? _value.eligibleDeliveryDates
          : eligibleDeliveryDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_EligibleDeliveryCollectionDates
    extends _EligibleDeliveryCollectionDates {
  _$_EligibleDeliveryCollectionDates(
      {required this.eligibleCollectionDates,
      required this.eligibleDeliveryDates})
      : super._();

  factory _$_EligibleDeliveryCollectionDates.fromJson(
          Map<String, dynamic> json) =>
      _$$_EligibleDeliveryCollectionDatesFromJson(json);

  @override
  final EligibleOrderDates eligibleCollectionDates;
  @override
  final EligibleOrderDates eligibleDeliveryDates;

  @override
  String toString() {
    return 'EligibleDeliveryCollectionDates(eligibleCollectionDates: $eligibleCollectionDates, eligibleDeliveryDates: $eligibleDeliveryDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EligibleDeliveryCollectionDates &&
            const DeepCollectionEquality().equals(
                other.eligibleCollectionDates, eligibleCollectionDates) &&
            const DeepCollectionEquality()
                .equals(other.eligibleDeliveryDates, eligibleDeliveryDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eligibleCollectionDates),
      const DeepCollectionEquality().hash(eligibleDeliveryDates));

  @JsonKey(ignore: true)
  @override
  _$EligibleDeliveryCollectionDatesCopyWith<_EligibleDeliveryCollectionDates>
      get copyWith => __$EligibleDeliveryCollectionDatesCopyWithImpl<
          _EligibleDeliveryCollectionDates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EligibleDeliveryCollectionDatesToJson(this);
  }
}

abstract class _EligibleDeliveryCollectionDates
    extends EligibleDeliveryCollectionDates {
  factory _EligibleDeliveryCollectionDates(
          {required final EligibleOrderDates eligibleCollectionDates,
          required final EligibleOrderDates eligibleDeliveryDates}) =
      _$_EligibleDeliveryCollectionDates;
  _EligibleDeliveryCollectionDates._() : super._();

  factory _EligibleDeliveryCollectionDates.fromJson(Map<String, dynamic> json) =
      _$_EligibleDeliveryCollectionDates.fromJson;

  @override
  EligibleOrderDates get eligibleCollectionDates =>
      throw _privateConstructorUsedError;
  @override
  EligibleOrderDates get eligibleDeliveryDates =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EligibleDeliveryCollectionDatesCopyWith<_EligibleDeliveryCollectionDates>
      get copyWith => throw _privateConstructorUsedError;
}

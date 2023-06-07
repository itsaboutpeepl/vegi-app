// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripeAddress _$StripeAddressFromJson(Map<String, dynamic> json) {
  return _StripeAddress.fromJson(json);
}

/// @nodoc
mixin _$StripeAddress {
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get line1 => throw _privateConstructorUsedError;
  String? get line2 => throw _privateConstructorUsedError;
  String? get postal_code => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripeAddressCopyWith<StripeAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeAddressCopyWith<$Res> {
  factory $StripeAddressCopyWith(
          StripeAddress value, $Res Function(StripeAddress) then) =
      _$StripeAddressCopyWithImpl<$Res, StripeAddress>;
  @useResult
  $Res call(
      {String? city,
      String? country,
      String? line1,
      String? line2,
      String? postal_code,
      String? state});
}

/// @nodoc
class _$StripeAddressCopyWithImpl<$Res, $Val extends StripeAddress>
    implements $StripeAddressCopyWith<$Res> {
  _$StripeAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? country = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? postal_code = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postal_code: freezed == postal_code
          ? _value.postal_code
          : postal_code // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StripeAddressCopyWith<$Res>
    implements $StripeAddressCopyWith<$Res> {
  factory _$$_StripeAddressCopyWith(
          _$_StripeAddress value, $Res Function(_$_StripeAddress) then) =
      __$$_StripeAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? city,
      String? country,
      String? line1,
      String? line2,
      String? postal_code,
      String? state});
}

/// @nodoc
class __$$_StripeAddressCopyWithImpl<$Res>
    extends _$StripeAddressCopyWithImpl<$Res, _$_StripeAddress>
    implements _$$_StripeAddressCopyWith<$Res> {
  __$$_StripeAddressCopyWithImpl(
      _$_StripeAddress _value, $Res Function(_$_StripeAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? country = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? postal_code = freezed,
    Object? state = freezed,
  }) {
    return _then(_$_StripeAddress(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postal_code: freezed == postal_code
          ? _value.postal_code
          : postal_code // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripeAddress extends _StripeAddress {
  _$_StripeAddress(
      {required this.city,
      required this.country,
      required this.line1,
      required this.line2,
      required this.postal_code,
      required this.state})
      : super._();

  factory _$_StripeAddress.fromJson(Map<String, dynamic> json) =>
      _$$_StripeAddressFromJson(json);

  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? line1;
  @override
  final String? line2;
  @override
  final String? postal_code;
  @override
  final String? state;

  @override
  String toString() {
    return 'StripeAddress(city: $city, country: $country, line1: $line1, line2: $line2, postal_code: $postal_code, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripeAddress &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.postal_code, postal_code) ||
                other.postal_code == postal_code) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, city, country, line1, line2, postal_code, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripeAddressCopyWith<_$_StripeAddress> get copyWith =>
      __$$_StripeAddressCopyWithImpl<_$_StripeAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripeAddressToJson(
      this,
    );
  }
}

abstract class _StripeAddress extends StripeAddress {
  factory _StripeAddress(
      {required final String? city,
      required final String? country,
      required final String? line1,
      required final String? line2,
      required final String? postal_code,
      required final String? state}) = _$_StripeAddress;
  _StripeAddress._() : super._();

  factory _StripeAddress.fromJson(Map<String, dynamic> json) =
      _$_StripeAddress.fromJson;

  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get line1;
  @override
  String? get line2;
  @override
  String? get postal_code;
  @override
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$_StripeAddressCopyWith<_$_StripeAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

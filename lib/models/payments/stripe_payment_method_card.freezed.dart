// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_method_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentMethodCard _$StripePaymentMethodCardFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentMethodCard.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentMethodCard {
  String? get brand => throw _privateConstructorUsedError;
  StripePaymentMethodCardCheck? get checks =>
      throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  int? get exp_month => throw _privateConstructorUsedError;
  int? get exp_year => throw _privateConstructorUsedError;
  String? get fingerprint => throw _privateConstructorUsedError;
  String? get funding => throw _privateConstructorUsedError;
  String? get last4 => throw _privateConstructorUsedError;
  Map<String, dynamic> get three_d_secure_usage =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentMethodCardCopyWith<StripePaymentMethodCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentMethodCardCopyWith<$Res> {
  factory $StripePaymentMethodCardCopyWith(StripePaymentMethodCard value,
          $Res Function(StripePaymentMethodCard) then) =
      _$StripePaymentMethodCardCopyWithImpl<$Res, StripePaymentMethodCard>;
  @useResult
  $Res call(
      {String? brand,
      StripePaymentMethodCardCheck? checks,
      String? country,
      int? exp_month,
      int? exp_year,
      String? fingerprint,
      String? funding,
      String? last4,
      Map<String, dynamic> three_d_secure_usage});

  $StripePaymentMethodCardCheckCopyWith<$Res>? get checks;
}

/// @nodoc
class _$StripePaymentMethodCardCopyWithImpl<$Res,
        $Val extends StripePaymentMethodCard>
    implements $StripePaymentMethodCardCopyWith<$Res> {
  _$StripePaymentMethodCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = freezed,
    Object? checks = freezed,
    Object? country = freezed,
    Object? exp_month = freezed,
    Object? exp_year = freezed,
    Object? fingerprint = freezed,
    Object? funding = freezed,
    Object? last4 = freezed,
    Object? three_d_secure_usage = null,
  }) {
    return _then(_value.copyWith(
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      checks: freezed == checks
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardCheck?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      exp_month: freezed == exp_month
          ? _value.exp_month
          : exp_month // ignore: cast_nullable_to_non_nullable
              as int?,
      exp_year: freezed == exp_year
          ? _value.exp_year
          : exp_year // ignore: cast_nullable_to_non_nullable
              as int?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as String?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      three_d_secure_usage: null == three_d_secure_usage
          ? _value.three_d_secure_usage
          : three_d_secure_usage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StripePaymentMethodCardCheckCopyWith<$Res>? get checks {
    if (_value.checks == null) {
      return null;
    }

    return $StripePaymentMethodCardCheckCopyWith<$Res>(_value.checks!, (value) {
      return _then(_value.copyWith(checks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StripePaymentMethodCardCopyWith<$Res>
    implements $StripePaymentMethodCardCopyWith<$Res> {
  factory _$$_StripePaymentMethodCardCopyWith(_$_StripePaymentMethodCard value,
          $Res Function(_$_StripePaymentMethodCard) then) =
      __$$_StripePaymentMethodCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? brand,
      StripePaymentMethodCardCheck? checks,
      String? country,
      int? exp_month,
      int? exp_year,
      String? fingerprint,
      String? funding,
      String? last4,
      Map<String, dynamic> three_d_secure_usage});

  @override
  $StripePaymentMethodCardCheckCopyWith<$Res>? get checks;
}

/// @nodoc
class __$$_StripePaymentMethodCardCopyWithImpl<$Res>
    extends _$StripePaymentMethodCardCopyWithImpl<$Res,
        _$_StripePaymentMethodCard>
    implements _$$_StripePaymentMethodCardCopyWith<$Res> {
  __$$_StripePaymentMethodCardCopyWithImpl(_$_StripePaymentMethodCard _value,
      $Res Function(_$_StripePaymentMethodCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = freezed,
    Object? checks = freezed,
    Object? country = freezed,
    Object? exp_month = freezed,
    Object? exp_year = freezed,
    Object? fingerprint = freezed,
    Object? funding = freezed,
    Object? last4 = freezed,
    Object? three_d_secure_usage = null,
  }) {
    return _then(_$_StripePaymentMethodCard(
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      checks: freezed == checks
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardCheck?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      exp_month: freezed == exp_month
          ? _value.exp_month
          : exp_month // ignore: cast_nullable_to_non_nullable
              as int?,
      exp_year: freezed == exp_year
          ? _value.exp_year
          : exp_year // ignore: cast_nullable_to_non_nullable
              as int?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as String?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      three_d_secure_usage: null == three_d_secure_usage
          ? _value.three_d_secure_usage
          : three_d_secure_usage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentMethodCard extends _StripePaymentMethodCard {
  _$_StripePaymentMethodCard(
      {this.brand,
      this.checks,
      this.country,
      this.exp_month,
      this.exp_year,
      this.fingerprint,
      this.funding,
      this.last4,
      this.three_d_secure_usage = const {'supported': true}})
      : super._();

  factory _$_StripePaymentMethodCard.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentMethodCardFromJson(json);

  @override
  final String? brand;
  @override
  final StripePaymentMethodCardCheck? checks;
  @override
  final String? country;
  @override
  final int? exp_month;
  @override
  final int? exp_year;
  @override
  final String? fingerprint;
  @override
  final String? funding;
  @override
  final String? last4;
  @override
  @JsonKey()
  final Map<String, dynamic> three_d_secure_usage;

  @override
  String toString() {
    return 'StripePaymentMethodCard(brand: $brand, checks: $checks, country: $country, exp_month: $exp_month, exp_year: $exp_year, fingerprint: $fingerprint, funding: $funding, last4: $last4, three_d_secure_usage: $three_d_secure_usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentMethodCard &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.checks, checks) || other.checks == checks) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.exp_month, exp_month) ||
                other.exp_month == exp_month) &&
            (identical(other.exp_year, exp_year) ||
                other.exp_year == exp_year) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.funding, funding) || other.funding == funding) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            const DeepCollectionEquality()
                .equals(other.three_d_secure_usage, three_d_secure_usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      brand,
      checks,
      country,
      exp_month,
      exp_year,
      fingerprint,
      funding,
      last4,
      const DeepCollectionEquality().hash(three_d_secure_usage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentMethodCardCopyWith<_$_StripePaymentMethodCard>
      get copyWith =>
          __$$_StripePaymentMethodCardCopyWithImpl<_$_StripePaymentMethodCard>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentMethodCardToJson(
      this,
    );
  }
}

abstract class _StripePaymentMethodCard extends StripePaymentMethodCard {
  factory _StripePaymentMethodCard(
          {final String? brand,
          final StripePaymentMethodCardCheck? checks,
          final String? country,
          final int? exp_month,
          final int? exp_year,
          final String? fingerprint,
          final String? funding,
          final String? last4,
          final Map<String, dynamic> three_d_secure_usage}) =
      _$_StripePaymentMethodCard;
  _StripePaymentMethodCard._() : super._();

  factory _StripePaymentMethodCard.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentMethodCard.fromJson;

  @override
  String? get brand;
  @override
  StripePaymentMethodCardCheck? get checks;
  @override
  String? get country;
  @override
  int? get exp_month;
  @override
  int? get exp_year;
  @override
  String? get fingerprint;
  @override
  String? get funding;
  @override
  String? get last4;
  @override
  Map<String, dynamic> get three_d_secure_usage;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentMethodCardCopyWith<_$_StripePaymentMethodCard>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_billing_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripeBillingDetails _$StripeBillingDetailsFromJson(Map<String, dynamic> json) {
  return _StripeBillingDetails.fromJson(json);
}

/// @nodoc
mixin _$StripeBillingDetails {
  StripeAddress? get address => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripeBillingDetailsCopyWith<StripeBillingDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeBillingDetailsCopyWith<$Res> {
  factory $StripeBillingDetailsCopyWith(StripeBillingDetails value,
          $Res Function(StripeBillingDetails) then) =
      _$StripeBillingDetailsCopyWithImpl<$Res, StripeBillingDetails>;
  @useResult
  $Res call(
      {StripeAddress? address, String? email, String? name, String? phone});

  $StripeAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$StripeBillingDetailsCopyWithImpl<$Res,
        $Val extends StripeBillingDetails>
    implements $StripeBillingDetailsCopyWith<$Res> {
  _$StripeBillingDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as StripeAddress?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StripeAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $StripeAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StripeBillingDetailsCopyWith<$Res>
    implements $StripeBillingDetailsCopyWith<$Res> {
  factory _$$_StripeBillingDetailsCopyWith(_$_StripeBillingDetails value,
          $Res Function(_$_StripeBillingDetails) then) =
      __$$_StripeBillingDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StripeAddress? address, String? email, String? name, String? phone});

  @override
  $StripeAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_StripeBillingDetailsCopyWithImpl<$Res>
    extends _$StripeBillingDetailsCopyWithImpl<$Res, _$_StripeBillingDetails>
    implements _$$_StripeBillingDetailsCopyWith<$Res> {
  __$$_StripeBillingDetailsCopyWithImpl(_$_StripeBillingDetails _value,
      $Res Function(_$_StripeBillingDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_StripeBillingDetails(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as StripeAddress?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripeBillingDetails extends _StripeBillingDetails {
  _$_StripeBillingDetails({this.address, this.email, this.name, this.phone})
      : super._();

  factory _$_StripeBillingDetails.fromJson(Map<String, dynamic> json) =>
      _$$_StripeBillingDetailsFromJson(json);

  @override
  final StripeAddress? address;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? phone;

  @override
  String toString() {
    return 'StripeBillingDetails(address: $address, email: $email, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripeBillingDetails &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, email, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripeBillingDetailsCopyWith<_$_StripeBillingDetails> get copyWith =>
      __$$_StripeBillingDetailsCopyWithImpl<_$_StripeBillingDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripeBillingDetailsToJson(
      this,
    );
  }
}

abstract class _StripeBillingDetails extends StripeBillingDetails {
  factory _StripeBillingDetails(
      {final StripeAddress? address,
      final String? email,
      final String? name,
      final String? phone}) = _$_StripeBillingDetails;
  _StripeBillingDetails._() : super._();

  factory _StripeBillingDetails.fromJson(Map<String, dynamic> json) =
      _$_StripeBillingDetails.fromJson;

  @override
  StripeAddress? get address;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_StripeBillingDetailsCopyWith<_$_StripeBillingDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

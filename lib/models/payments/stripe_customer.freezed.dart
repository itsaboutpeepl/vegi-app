// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripeCustomer _$StripeCustomerFromJson(Map<String, dynamic> json) {
  return _StripeCustomer.fromJson(json);
}

/// @nodoc
mixin _$StripeCustomer {
  String get id => throw _privateConstructorUsedError;
  StripeAddress? get address => throw _privateConstructorUsedError;
  num get balance => throw _privateConstructorUsedError;
  num get created => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool get livemode => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  List<String> get preferred_locals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripeCustomerCopyWith<StripeCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeCustomerCopyWith<$Res> {
  factory $StripeCustomerCopyWith(
          StripeCustomer value, $Res Function(StripeCustomer) then) =
      _$StripeCustomerCopyWithImpl<$Res, StripeCustomer>;
  @useResult
  $Res call(
      {String id,
      StripeAddress? address,
      num balance,
      num created,
      String? currency,
      bool livemode,
      Map<String, dynamic> metadata,
      String? name,
      String? phone,
      List<String> preferred_locals});

  $StripeAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$StripeCustomerCopyWithImpl<$Res, $Val extends StripeCustomer>
    implements $StripeCustomerCopyWith<$Res> {
  _$StripeCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = freezed,
    Object? balance = null,
    Object? created = null,
    Object? currency = freezed,
    Object? livemode = null,
    Object? metadata = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? preferred_locals = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as StripeAddress?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as num,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      preferred_locals: null == preferred_locals
          ? _value.preferred_locals
          : preferred_locals // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_StripeCustomerCopyWith<$Res>
    implements $StripeCustomerCopyWith<$Res> {
  factory _$$_StripeCustomerCopyWith(
          _$_StripeCustomer value, $Res Function(_$_StripeCustomer) then) =
      __$$_StripeCustomerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      StripeAddress? address,
      num balance,
      num created,
      String? currency,
      bool livemode,
      Map<String, dynamic> metadata,
      String? name,
      String? phone,
      List<String> preferred_locals});

  @override
  $StripeAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_StripeCustomerCopyWithImpl<$Res>
    extends _$StripeCustomerCopyWithImpl<$Res, _$_StripeCustomer>
    implements _$$_StripeCustomerCopyWith<$Res> {
  __$$_StripeCustomerCopyWithImpl(
      _$_StripeCustomer _value, $Res Function(_$_StripeCustomer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = freezed,
    Object? balance = null,
    Object? created = null,
    Object? currency = freezed,
    Object? livemode = null,
    Object? metadata = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? preferred_locals = null,
  }) {
    return _then(_$_StripeCustomer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as StripeAddress?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as num,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      preferred_locals: null == preferred_locals
          ? _value.preferred_locals
          : preferred_locals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripeCustomer extends _StripeCustomer {
  _$_StripeCustomer(
      {required this.id,
      this.address,
      this.balance = 0,
      this.created = 0,
      this.currency,
      required this.livemode,
      this.metadata = const {},
      this.name,
      this.phone,
      this.preferred_locals = const []})
      : super._();

  factory _$_StripeCustomer.fromJson(Map<String, dynamic> json) =>
      _$$_StripeCustomerFromJson(json);

  @override
  final String id;
  @override
  final StripeAddress? address;
  @override
  @JsonKey()
  final num balance;
  @override
  @JsonKey()
  final num created;
  @override
  final String? currency;
  @override
  final bool livemode;
  @override
  @JsonKey()
  final Map<String, dynamic> metadata;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  @JsonKey()
  final List<String> preferred_locals;

  @override
  String toString() {
    return 'StripeCustomer(id: $id, address: $address, balance: $balance, created: $created, currency: $currency, livemode: $livemode, metadata: $metadata, name: $name, phone: $phone, preferred_locals: $preferred_locals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripeCustomer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.livemode, livemode) ||
                other.livemode == livemode) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other.preferred_locals, preferred_locals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      address,
      balance,
      created,
      currency,
      livemode,
      const DeepCollectionEquality().hash(metadata),
      name,
      phone,
      const DeepCollectionEquality().hash(preferred_locals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripeCustomerCopyWith<_$_StripeCustomer> get copyWith =>
      __$$_StripeCustomerCopyWithImpl<_$_StripeCustomer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripeCustomerToJson(
      this,
    );
  }
}

abstract class _StripeCustomer extends StripeCustomer {
  factory _StripeCustomer(
      {required final String id,
      final StripeAddress? address,
      final num balance,
      final num created,
      final String? currency,
      required final bool livemode,
      final Map<String, dynamic> metadata,
      final String? name,
      final String? phone,
      final List<String> preferred_locals}) = _$_StripeCustomer;
  _StripeCustomer._() : super._();

  factory _StripeCustomer.fromJson(Map<String, dynamic> json) =
      _$_StripeCustomer.fromJson;

  @override
  String get id;
  @override
  StripeAddress? get address;
  @override
  num get balance;
  @override
  num get created;
  @override
  String? get currency;
  @override
  bool get livemode;
  @override
  Map<String, dynamic> get metadata;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  List<String> get preferred_locals;
  @override
  @JsonKey(ignore: true)
  _$$_StripeCustomerCopyWith<_$_StripeCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

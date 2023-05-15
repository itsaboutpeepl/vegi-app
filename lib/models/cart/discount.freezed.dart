// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return _Discount.fromJson(json);
}

/// @nodoc
mixin _$Discount {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  DiscountType get discountType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  DateTime get expiryDateTime => throw _privateConstructorUsedError;
  int? get timesUsed => throw _privateConstructorUsedError;
  int? get maxUses => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  String? get linkedWalletAddress => throw _privateConstructorUsedError;
  @JsonKey()
  VendorDTO? get vendor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountCopyWith<Discount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCopyWith<$Res> {
  factory $DiscountCopyWith(Discount value, $Res Function(Discount) then) =
      _$DiscountCopyWithImpl<$Res, Discount>;
  @useResult
  $Res call(
      {int id,
      String code,
      num value,
      Currency currency,
      DiscountType discountType,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          DateTime expiryDateTime,
      int? timesUsed,
      int? maxUses,
      bool isEnabled,
      String? linkedWalletAddress,
      @JsonKey()
          VendorDTO? vendor});

  $VendorDTOCopyWith<$Res>? get vendor;
}

/// @nodoc
class _$DiscountCopyWithImpl<$Res, $Val extends Discount>
    implements $DiscountCopyWith<$Res> {
  _$DiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? value = null,
    Object? currency = null,
    Object? discountType = null,
    Object? expiryDateTime = null,
    Object? timesUsed = freezed,
    Object? maxUses = freezed,
    Object? isEnabled = null,
    Object? linkedWalletAddress = freezed,
    Object? vendor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      expiryDateTime: null == expiryDateTime
          ? _value.expiryDateTime
          : expiryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timesUsed: freezed == timesUsed
          ? _value.timesUsed
          : timesUsed // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUses: freezed == maxUses
          ? _value.maxUses
          : maxUses // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      linkedWalletAddress: freezed == linkedWalletAddress
          ? _value.linkedWalletAddress
          : linkedWalletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorDTOCopyWith<$Res>? get vendor {
    if (_value.vendor == null) {
      return null;
    }

    return $VendorDTOCopyWith<$Res>(_value.vendor!, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiscountCopyWith<$Res> implements $DiscountCopyWith<$Res> {
  factory _$$_DiscountCopyWith(
          _$_Discount value, $Res Function(_$_Discount) then) =
      __$$_DiscountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      num value,
      Currency currency,
      DiscountType discountType,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          DateTime expiryDateTime,
      int? timesUsed,
      int? maxUses,
      bool isEnabled,
      String? linkedWalletAddress,
      @JsonKey()
          VendorDTO? vendor});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
}

/// @nodoc
class __$$_DiscountCopyWithImpl<$Res>
    extends _$DiscountCopyWithImpl<$Res, _$_Discount>
    implements _$$_DiscountCopyWith<$Res> {
  __$$_DiscountCopyWithImpl(
      _$_Discount _value, $Res Function(_$_Discount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? value = null,
    Object? currency = null,
    Object? discountType = null,
    Object? expiryDateTime = null,
    Object? timesUsed = freezed,
    Object? maxUses = freezed,
    Object? isEnabled = null,
    Object? linkedWalletAddress = freezed,
    Object? vendor = freezed,
  }) {
    return _then(_$_Discount(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      expiryDateTime: null == expiryDateTime
          ? _value.expiryDateTime
          : expiryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timesUsed: freezed == timesUsed
          ? _value.timesUsed
          : timesUsed // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUses: freezed == maxUses
          ? _value.maxUses
          : maxUses // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      linkedWalletAddress: freezed == linkedWalletAddress
          ? _value.linkedWalletAddress
          : linkedWalletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Discount extends _Discount {
  _$_Discount(
      {required this.id,
      required this.code,
      required this.value,
      required this.currency,
      required this.discountType,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          required this.expiryDateTime,
      required this.timesUsed,
      required this.maxUses,
      this.isEnabled = false,
      required this.linkedWalletAddress,
      @JsonKey()
          this.vendor = null})
      : super._();

  factory _$_Discount.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final num value;
  @override
  final Currency currency;
  @override
  final DiscountType discountType;
  @override
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  final DateTime expiryDateTime;
  @override
  final int? timesUsed;
  @override
  final int? maxUses;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  final String? linkedWalletAddress;
  @override
  @JsonKey()
  final VendorDTO? vendor;

  @override
  String toString() {
    return 'Discount(id: $id, code: $code, value: $value, currency: $currency, discountType: $discountType, expiryDateTime: $expiryDateTime, timesUsed: $timesUsed, maxUses: $maxUses, isEnabled: $isEnabled, linkedWalletAddress: $linkedWalletAddress, vendor: $vendor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Discount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.expiryDateTime, expiryDateTime) ||
                other.expiryDateTime == expiryDateTime) &&
            (identical(other.timesUsed, timesUsed) ||
                other.timesUsed == timesUsed) &&
            (identical(other.maxUses, maxUses) || other.maxUses == maxUses) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.linkedWalletAddress, linkedWalletAddress) ||
                other.linkedWalletAddress == linkedWalletAddress) &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      value,
      currency,
      discountType,
      expiryDateTime,
      timesUsed,
      maxUses,
      isEnabled,
      linkedWalletAddress,
      vendor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountCopyWith<_$_Discount> get copyWith =>
      __$$_DiscountCopyWithImpl<_$_Discount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountToJson(
      this,
    );
  }
}

abstract class _Discount extends Discount {
  factory _Discount(
      {required final int id,
      required final String code,
      required final num value,
      required final Currency currency,
      required final DiscountType discountType,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          required final DateTime expiryDateTime,
      required final int? timesUsed,
      required final int? maxUses,
      final bool isEnabled,
      required final String? linkedWalletAddress,
      @JsonKey()
          final VendorDTO? vendor}) = _$_Discount;
  _Discount._() : super._();

  factory _Discount.fromJson(Map<String, dynamic> json) = _$_Discount.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  num get value;
  @override
  Currency get currency;
  @override
  DiscountType get discountType;
  @override
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  DateTime get expiryDateTime;
  @override
  int? get timesUsed;
  @override
  int? get maxUses;
  @override
  bool get isEnabled;
  @override
  String? get linkedWalletAddress;
  @override
  @JsonKey()
  VendorDTO? get vendor;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountCopyWith<_$_Discount> get copyWith =>
      throw _privateConstructorUsedError;
}

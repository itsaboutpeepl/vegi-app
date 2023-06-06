// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fulfilmentMethod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FulfilmentMethod _$FulfilmentMethodFromJson(Map<String, dynamic> json) {
  return _FulfilmentMethod.fromJson(json);
}

/// @nodoc
mixin _$FulfilmentMethod {
  int get id => throw _privateConstructorUsedError;
  FulfilmentMethodType get methodType => throw _privateConstructorUsedError;
  num? get slotLength => throw _privateConstructorUsedError;
  num? get bufferLength => throw _privateConstructorUsedError;
  String? get orderCutoff => throw _privateConstructorUsedError;
  int? get maxOrders => throw _privateConstructorUsedError;
  int? get maxDeliveryDistance => throw _privateConstructorUsedError;
  num? get priceModifier => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonOpeningHours)
  OpeningHours? get openingHours => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryAddresses)
  DeliveryAddresses? get fulfilmentOrigin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FulfilmentMethodCopyWith<FulfilmentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FulfilmentMethodCopyWith<$Res> {
  factory $FulfilmentMethodCopyWith(
          FulfilmentMethod value, $Res Function(FulfilmentMethod) then) =
      _$FulfilmentMethodCopyWithImpl<$Res, FulfilmentMethod>;
  @useResult
  $Res call(
      {int id,
      FulfilmentMethodType methodType,
      num? slotLength,
      num? bufferLength,
      String? orderCutoff,
      int? maxOrders,
      int? maxDeliveryDistance,
      num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonOpeningHours)
          OpeningHours? openingHours,
      @JsonKey(fromJson: fromJsonDeliveryAddresses)
          DeliveryAddresses? fulfilmentOrigin});

  $VendorDTOCopyWith<$Res>? get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $OpeningHoursCopyWith<$Res>? get openingHours;
  $DeliveryAddressesCopyWith<$Res>? get fulfilmentOrigin;
}

/// @nodoc
class _$FulfilmentMethodCopyWithImpl<$Res, $Val extends FulfilmentMethod>
    implements $FulfilmentMethodCopyWith<$Res> {
  _$FulfilmentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? methodType = null,
    Object? slotLength = freezed,
    Object? bufferLength = freezed,
    Object? orderCutoff = freezed,
    Object? maxOrders = freezed,
    Object? maxDeliveryDistance = freezed,
    Object? priceModifier = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? openingHours = freezed,
    Object? fulfilmentOrigin = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      methodType: null == methodType
          ? _value.methodType
          : methodType // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
      slotLength: freezed == slotLength
          ? _value.slotLength
          : slotLength // ignore: cast_nullable_to_non_nullable
              as num?,
      bufferLength: freezed == bufferLength
          ? _value.bufferLength
          : bufferLength // ignore: cast_nullable_to_non_nullable
              as num?,
      orderCutoff: freezed == orderCutoff
          ? _value.orderCutoff
          : orderCutoff // ignore: cast_nullable_to_non_nullable
              as String?,
      maxOrders: freezed == maxOrders
          ? _value.maxOrders
          : maxOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDeliveryDistance: freezed == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      priceModifier: freezed == priceModifier
          ? _value.priceModifier
          : priceModifier // ignore: cast_nullable_to_non_nullable
              as num?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
      fulfilmentOrigin: freezed == fulfilmentOrigin
          ? _value.fulfilmentOrigin
          : fulfilmentOrigin // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
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

  @override
  @pragma('vm:prefer-inline')
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner {
    if (_value.deliveryPartner == null) {
      return null;
    }

    return $DeliveryPartnerDTOCopyWith<$Res>(_value.deliveryPartner!, (value) {
      return _then(_value.copyWith(deliveryPartner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OpeningHoursCopyWith<$Res>? get openingHours {
    if (_value.openingHours == null) {
      return null;
    }

    return $OpeningHoursCopyWith<$Res>(_value.openingHours!, (value) {
      return _then(_value.copyWith(openingHours: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res>? get fulfilmentOrigin {
    if (_value.fulfilmentOrigin == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.fulfilmentOrigin!, (value) {
      return _then(_value.copyWith(fulfilmentOrigin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FulfilmentMethodCopyWith<$Res>
    implements $FulfilmentMethodCopyWith<$Res> {
  factory _$$_FulfilmentMethodCopyWith(
          _$_FulfilmentMethod value, $Res Function(_$_FulfilmentMethod) then) =
      __$$_FulfilmentMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      FulfilmentMethodType methodType,
      num? slotLength,
      num? bufferLength,
      String? orderCutoff,
      int? maxOrders,
      int? maxDeliveryDistance,
      num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonOpeningHours)
          OpeningHours? openingHours,
      @JsonKey(fromJson: fromJsonDeliveryAddresses)
          DeliveryAddresses? fulfilmentOrigin});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $OpeningHoursCopyWith<$Res>? get openingHours;
  @override
  $DeliveryAddressesCopyWith<$Res>? get fulfilmentOrigin;
}

/// @nodoc
class __$$_FulfilmentMethodCopyWithImpl<$Res>
    extends _$FulfilmentMethodCopyWithImpl<$Res, _$_FulfilmentMethod>
    implements _$$_FulfilmentMethodCopyWith<$Res> {
  __$$_FulfilmentMethodCopyWithImpl(
      _$_FulfilmentMethod _value, $Res Function(_$_FulfilmentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? methodType = null,
    Object? slotLength = freezed,
    Object? bufferLength = freezed,
    Object? orderCutoff = freezed,
    Object? maxOrders = freezed,
    Object? maxDeliveryDistance = freezed,
    Object? priceModifier = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? openingHours = freezed,
    Object? fulfilmentOrigin = freezed,
  }) {
    return _then(_$_FulfilmentMethod(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      methodType: null == methodType
          ? _value.methodType
          : methodType // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
      slotLength: freezed == slotLength
          ? _value.slotLength
          : slotLength // ignore: cast_nullable_to_non_nullable
              as num?,
      bufferLength: freezed == bufferLength
          ? _value.bufferLength
          : bufferLength // ignore: cast_nullable_to_non_nullable
              as num?,
      orderCutoff: freezed == orderCutoff
          ? _value.orderCutoff
          : orderCutoff // ignore: cast_nullable_to_non_nullable
              as String?,
      maxOrders: freezed == maxOrders
          ? _value.maxOrders
          : maxOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDeliveryDistance: freezed == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      priceModifier: freezed == priceModifier
          ? _value.priceModifier
          : priceModifier // ignore: cast_nullable_to_non_nullable
              as num?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
      fulfilmentOrigin: freezed == fulfilmentOrigin
          ? _value.fulfilmentOrigin
          : fulfilmentOrigin // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_FulfilmentMethod extends _FulfilmentMethod {
  _$_FulfilmentMethod(
      {required this.id,
      required this.methodType,
      required this.slotLength,
      required this.bufferLength,
      required this.orderCutoff,
      required this.maxOrders,
      this.maxDeliveryDistance = null,
      required this.priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          this.vendor = null,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          this.deliveryPartner = null,
      @JsonKey(fromJson: fromJsonOpeningHours)
          this.openingHours = null,
      @JsonKey(fromJson: fromJsonDeliveryAddresses)
          this.fulfilmentOrigin = null})
      : super._();

  factory _$_FulfilmentMethod.fromJson(Map<String, dynamic> json) =>
      _$$_FulfilmentMethodFromJson(json);

  @override
  final int id;
  @override
  final FulfilmentMethodType methodType;
  @override
  final num? slotLength;
  @override
  final num? bufferLength;
  @override
  final String? orderCutoff;
  @override
  final int? maxOrders;
  @override
  @JsonKey()
  final int? maxDeliveryDistance;
  @override
  final num? priceModifier;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonOpeningHours)
  final OpeningHours? openingHours;
  @override
  @JsonKey(fromJson: fromJsonDeliveryAddresses)
  final DeliveryAddresses? fulfilmentOrigin;

  @override
  String toString() {
    return 'FulfilmentMethod(id: $id, methodType: $methodType, slotLength: $slotLength, bufferLength: $bufferLength, orderCutoff: $orderCutoff, maxOrders: $maxOrders, maxDeliveryDistance: $maxDeliveryDistance, priceModifier: $priceModifier, vendor: $vendor, deliveryPartner: $deliveryPartner, openingHours: $openingHours, fulfilmentOrigin: $fulfilmentOrigin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FulfilmentMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.methodType, methodType) ||
                other.methodType == methodType) &&
            (identical(other.slotLength, slotLength) ||
                other.slotLength == slotLength) &&
            (identical(other.bufferLength, bufferLength) ||
                other.bufferLength == bufferLength) &&
            (identical(other.orderCutoff, orderCutoff) ||
                other.orderCutoff == orderCutoff) &&
            (identical(other.maxOrders, maxOrders) ||
                other.maxOrders == maxOrders) &&
            (identical(other.maxDeliveryDistance, maxDeliveryDistance) ||
                other.maxDeliveryDistance == maxDeliveryDistance) &&
            (identical(other.priceModifier, priceModifier) ||
                other.priceModifier == priceModifier) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            (identical(other.fulfilmentOrigin, fulfilmentOrigin) ||
                other.fulfilmentOrigin == fulfilmentOrigin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      methodType,
      slotLength,
      bufferLength,
      orderCutoff,
      maxOrders,
      maxDeliveryDistance,
      priceModifier,
      vendor,
      deliveryPartner,
      openingHours,
      fulfilmentOrigin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FulfilmentMethodCopyWith<_$_FulfilmentMethod> get copyWith =>
      __$$_FulfilmentMethodCopyWithImpl<_$_FulfilmentMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FulfilmentMethodToJson(
      this,
    );
  }
}

abstract class _FulfilmentMethod extends FulfilmentMethod {
  factory _FulfilmentMethod(
      {required final int id,
      required final FulfilmentMethodType methodType,
      required final num? slotLength,
      required final num? bufferLength,
      required final String? orderCutoff,
      required final int? maxOrders,
      final int? maxDeliveryDistance,
      required final num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonOpeningHours)
          final OpeningHours? openingHours,
      @JsonKey(fromJson: fromJsonDeliveryAddresses)
          final DeliveryAddresses? fulfilmentOrigin}) = _$_FulfilmentMethod;
  _FulfilmentMethod._() : super._();

  factory _FulfilmentMethod.fromJson(Map<String, dynamic> json) =
      _$_FulfilmentMethod.fromJson;

  @override
  int get id;
  @override
  FulfilmentMethodType get methodType;
  @override
  num? get slotLength;
  @override
  num? get bufferLength;
  @override
  String? get orderCutoff;
  @override
  int? get maxOrders;
  @override
  int? get maxDeliveryDistance;
  @override
  num? get priceModifier;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonOpeningHours)
  OpeningHours? get openingHours;
  @override
  @JsonKey(fromJson: fromJsonDeliveryAddresses)
  DeliveryAddresses? get fulfilmentOrigin;
  @override
  @JsonKey(ignore: true)
  _$$_FulfilmentMethodCopyWith<_$_FulfilmentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

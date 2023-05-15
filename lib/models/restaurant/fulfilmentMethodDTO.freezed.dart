// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fulfilmentMethodDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FulfilmentMethodDTO _$FulfilmentMethodDTOFromJson(Map<String, dynamic> json) {
  return _FulfilmentMethodDTO.fromJson(json);
}

/// @nodoc
mixin _$FulfilmentMethodDTO {
  int get id => throw _privateConstructorUsedError;
  FulfilmentMethodType get methodType => throw _privateConstructorUsedError;
  num get slotLength => throw _privateConstructorUsedError;
  num? get bufferLength => throw _privateConstructorUsedError;
  String? get orderCutoff => throw _privateConstructorUsedError;
  int? get maxOrders => throw _privateConstructorUsedError;
  num? get maxDeliveryDistance => throw _privateConstructorUsedError;
  num? get priceModifier => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonAddressDTO)
  AddressDTO? get fulfilmentOrigin => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonOpeningHours)
  OpeningHours? get openingHours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FulfilmentMethodDTOCopyWith<FulfilmentMethodDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FulfilmentMethodDTOCopyWith<$Res> {
  factory $FulfilmentMethodDTOCopyWith(
          FulfilmentMethodDTO value, $Res Function(FulfilmentMethodDTO) then) =
      _$FulfilmentMethodDTOCopyWithImpl<$Res, FulfilmentMethodDTO>;
  @useResult
  $Res call(
      {int id,
      FulfilmentMethodType methodType,
      num slotLength,
      num? bufferLength,
      String? orderCutoff,
      int? maxOrders,
      num? maxDeliveryDistance,
      num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonAddressDTO)
          AddressDTO? fulfilmentOrigin,
      @JsonKey(fromJson: fromJsonOpeningHours)
          OpeningHours? openingHours});

  $VendorDTOCopyWith<$Res>? get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $AddressDTOCopyWith<$Res>? get fulfilmentOrigin;
  $OpeningHoursCopyWith<$Res>? get openingHours;
}

/// @nodoc
class _$FulfilmentMethodDTOCopyWithImpl<$Res, $Val extends FulfilmentMethodDTO>
    implements $FulfilmentMethodDTOCopyWith<$Res> {
  _$FulfilmentMethodDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? methodType = null,
    Object? slotLength = null,
    Object? bufferLength = freezed,
    Object? orderCutoff = freezed,
    Object? maxOrders = freezed,
    Object? maxDeliveryDistance = freezed,
    Object? priceModifier = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? fulfilmentOrigin = freezed,
    Object? openingHours = freezed,
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
      slotLength: null == slotLength
          ? _value.slotLength
          : slotLength // ignore: cast_nullable_to_non_nullable
              as num,
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
              as num?,
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
      fulfilmentOrigin: freezed == fulfilmentOrigin
          ? _value.fulfilmentOrigin
          : fulfilmentOrigin // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
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
  $AddressDTOCopyWith<$Res>? get fulfilmentOrigin {
    if (_value.fulfilmentOrigin == null) {
      return null;
    }

    return $AddressDTOCopyWith<$Res>(_value.fulfilmentOrigin!, (value) {
      return _then(_value.copyWith(fulfilmentOrigin: value) as $Val);
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
}

/// @nodoc
abstract class _$$_FulfilmentMethodDTOCopyWith<$Res>
    implements $FulfilmentMethodDTOCopyWith<$Res> {
  factory _$$_FulfilmentMethodDTOCopyWith(_$_FulfilmentMethodDTO value,
          $Res Function(_$_FulfilmentMethodDTO) then) =
      __$$_FulfilmentMethodDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      FulfilmentMethodType methodType,
      num slotLength,
      num? bufferLength,
      String? orderCutoff,
      int? maxOrders,
      num? maxDeliveryDistance,
      num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonAddressDTO)
          AddressDTO? fulfilmentOrigin,
      @JsonKey(fromJson: fromJsonOpeningHours)
          OpeningHours? openingHours});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $AddressDTOCopyWith<$Res>? get fulfilmentOrigin;
  @override
  $OpeningHoursCopyWith<$Res>? get openingHours;
}

/// @nodoc
class __$$_FulfilmentMethodDTOCopyWithImpl<$Res>
    extends _$FulfilmentMethodDTOCopyWithImpl<$Res, _$_FulfilmentMethodDTO>
    implements _$$_FulfilmentMethodDTOCopyWith<$Res> {
  __$$_FulfilmentMethodDTOCopyWithImpl(_$_FulfilmentMethodDTO _value,
      $Res Function(_$_FulfilmentMethodDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? methodType = null,
    Object? slotLength = null,
    Object? bufferLength = freezed,
    Object? orderCutoff = freezed,
    Object? maxOrders = freezed,
    Object? maxDeliveryDistance = freezed,
    Object? priceModifier = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? fulfilmentOrigin = freezed,
    Object? openingHours = freezed,
  }) {
    return _then(_$_FulfilmentMethodDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      methodType: null == methodType
          ? _value.methodType
          : methodType // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
      slotLength: null == slotLength
          ? _value.slotLength
          : slotLength // ignore: cast_nullable_to_non_nullable
              as num,
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
              as num?,
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
      fulfilmentOrigin: freezed == fulfilmentOrigin
          ? _value.fulfilmentOrigin
          : fulfilmentOrigin // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_FulfilmentMethodDTO extends _FulfilmentMethodDTO {
  _$_FulfilmentMethodDTO(
      {required this.id,
      required this.methodType,
      required this.slotLength,
      this.bufferLength,
      this.orderCutoff,
      this.maxOrders,
      this.maxDeliveryDistance,
      this.priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required this.vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required this.deliveryPartner,
      @JsonKey(fromJson: fromJsonAddressDTO)
          this.fulfilmentOrigin,
      @JsonKey(fromJson: fromJsonOpeningHours)
          this.openingHours})
      : super._();

  factory _$_FulfilmentMethodDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FulfilmentMethodDTOFromJson(json);

  @override
  final int id;
  @override
  final FulfilmentMethodType methodType;
  @override
  final num slotLength;
  @override
  final num? bufferLength;
  @override
  final String? orderCutoff;
  @override
  final int? maxOrders;
  @override
  final num? maxDeliveryDistance;
  @override
  final num? priceModifier;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonAddressDTO)
  final AddressDTO? fulfilmentOrigin;
  @override
  @JsonKey(fromJson: fromJsonOpeningHours)
  final OpeningHours? openingHours;

  @override
  String toString() {
    return 'FulfilmentMethodDTO(id: $id, methodType: $methodType, slotLength: $slotLength, bufferLength: $bufferLength, orderCutoff: $orderCutoff, maxOrders: $maxOrders, maxDeliveryDistance: $maxDeliveryDistance, priceModifier: $priceModifier, vendor: $vendor, deliveryPartner: $deliveryPartner, fulfilmentOrigin: $fulfilmentOrigin, openingHours: $openingHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FulfilmentMethodDTO &&
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
            (identical(other.fulfilmentOrigin, fulfilmentOrigin) ||
                other.fulfilmentOrigin == fulfilmentOrigin) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours));
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
      fulfilmentOrigin,
      openingHours);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FulfilmentMethodDTOCopyWith<_$_FulfilmentMethodDTO> get copyWith =>
      __$$_FulfilmentMethodDTOCopyWithImpl<_$_FulfilmentMethodDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FulfilmentMethodDTOToJson(
      this,
    );
  }
}

abstract class _FulfilmentMethodDTO extends FulfilmentMethodDTO {
  factory _FulfilmentMethodDTO(
      {required final int id,
      required final FulfilmentMethodType methodType,
      required final num slotLength,
      final num? bufferLength,
      final String? orderCutoff,
      final int? maxOrders,
      final num? maxDeliveryDistance,
      final num? priceModifier,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonAddressDTO)
          final AddressDTO? fulfilmentOrigin,
      @JsonKey(fromJson: fromJsonOpeningHours)
          final OpeningHours? openingHours}) = _$_FulfilmentMethodDTO;
  _FulfilmentMethodDTO._() : super._();

  factory _FulfilmentMethodDTO.fromJson(Map<String, dynamic> json) =
      _$_FulfilmentMethodDTO.fromJson;

  @override
  int get id;
  @override
  FulfilmentMethodType get methodType;
  @override
  num get slotLength;
  @override
  num? get bufferLength;
  @override
  String? get orderCutoff;
  @override
  int? get maxOrders;
  @override
  num? get maxDeliveryDistance;
  @override
  num? get priceModifier;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonAddressDTO)
  AddressDTO? get fulfilmentOrigin;
  @override
  @JsonKey(fromJson: fromJsonOpeningHours)
  OpeningHours? get openingHours;
  @override
  @JsonKey(ignore: true)
  _$$_FulfilmentMethodDTOCopyWith<_$_FulfilmentMethodDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

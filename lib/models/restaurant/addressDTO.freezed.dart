// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'addressDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) {
  return _AddressDTO.fromJson(json);
}

/// @nodoc
mixin _$AddressDTO {
  int get id => throw _privateConstructorUsedError;
  DeliveryAddressLabel get label => throw _privateConstructorUsedError;
  String get addressLineOne => throw _privateConstructorUsedError;
  String get addressLineTwo => throw _privateConstructorUsedError;
  String get addressTownCity => throw _privateConstructorUsedError;
  String get addressPostCode => throw _privateConstructorUsedError;
  String get addressCountryCode => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonUserDTO)
  UserDTO? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDTOCopyWith<AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDTOCopyWith<$Res> {
  factory $AddressDTOCopyWith(
          AddressDTO value, $Res Function(AddressDTO) then) =
      _$AddressDTOCopyWithImpl<$Res, AddressDTO>;
  @useResult
  $Res call(
      {int id,
      DeliveryAddressLabel label,
      String addressLineOne,
      String addressLineTwo,
      String addressTownCity,
      String addressPostCode,
      String addressCountryCode,
      double? latitude,
      double? longitude,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonUserDTO)
          UserDTO? user});

  $VendorDTOCopyWith<$Res>? get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class _$AddressDTOCopyWithImpl<$Res, $Val extends AddressDTO>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? addressLineOne = null,
    Object? addressLineTwo = null,
    Object? addressTownCity = null,
    Object? addressPostCode = null,
    Object? addressCountryCode = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as DeliveryAddressLabel,
      addressLineOne: null == addressLineOne
          ? _value.addressLineOne
          : addressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineTwo: null == addressLineTwo
          ? _value.addressLineTwo
          : addressLineTwo // ignore: cast_nullable_to_non_nullable
              as String,
      addressTownCity: null == addressTownCity
          ? _value.addressTownCity
          : addressTownCity // ignore: cast_nullable_to_non_nullable
              as String,
      addressPostCode: null == addressPostCode
          ? _value.addressPostCode
          : addressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      addressCountryCode: null == addressCountryCode
          ? _value.addressCountryCode
          : addressCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
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
  $UserDTOCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDTOCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddressDTOCopyWith<$Res>
    implements $AddressDTOCopyWith<$Res> {
  factory _$$_AddressDTOCopyWith(
          _$_AddressDTO value, $Res Function(_$_AddressDTO) then) =
      __$$_AddressDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DeliveryAddressLabel label,
      String addressLineOne,
      String addressLineTwo,
      String addressTownCity,
      String addressPostCode,
      String addressCountryCode,
      double? latitude,
      double? longitude,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonUserDTO)
          UserDTO? user});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_AddressDTOCopyWithImpl<$Res>
    extends _$AddressDTOCopyWithImpl<$Res, _$_AddressDTO>
    implements _$$_AddressDTOCopyWith<$Res> {
  __$$_AddressDTOCopyWithImpl(
      _$_AddressDTO _value, $Res Function(_$_AddressDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? addressLineOne = null,
    Object? addressLineTwo = null,
    Object? addressTownCity = null,
    Object? addressPostCode = null,
    Object? addressCountryCode = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_AddressDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as DeliveryAddressLabel,
      addressLineOne: null == addressLineOne
          ? _value.addressLineOne
          : addressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineTwo: null == addressLineTwo
          ? _value.addressLineTwo
          : addressLineTwo // ignore: cast_nullable_to_non_nullable
              as String,
      addressTownCity: null == addressTownCity
          ? _value.addressTownCity
          : addressTownCity // ignore: cast_nullable_to_non_nullable
              as String,
      addressPostCode: null == addressPostCode
          ? _value.addressPostCode
          : addressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      addressCountryCode: null == addressCountryCode
          ? _value.addressCountryCode
          : addressCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_AddressDTO extends _AddressDTO {
  _$_AddressDTO(
      {required this.id,
      required this.label,
      required this.addressLineOne,
      required this.addressLineTwo,
      required this.addressTownCity,
      required this.addressPostCode,
      required this.addressCountryCode,
      required this.latitude,
      required this.longitude,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required this.vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required this.deliveryPartner,
      @JsonKey(fromJson: fromJsonUserDTO)
          required this.user})
      : super._();

  factory _$_AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AddressDTOFromJson(json);

  @override
  final int id;
  @override
  final DeliveryAddressLabel label;
  @override
  final String addressLineOne;
  @override
  final String addressLineTwo;
  @override
  final String addressTownCity;
  @override
  final String addressPostCode;
  @override
  final String addressCountryCode;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonUserDTO)
  final UserDTO? user;

  @override
  String toString() {
    return 'AddressDTO(id: $id, label: $label, addressLineOne: $addressLineOne, addressLineTwo: $addressLineTwo, addressTownCity: $addressTownCity, addressPostCode: $addressPostCode, addressCountryCode: $addressCountryCode, latitude: $latitude, longitude: $longitude, vendor: $vendor, deliveryPartner: $deliveryPartner, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.addressLineOne, addressLineOne) ||
                other.addressLineOne == addressLineOne) &&
            (identical(other.addressLineTwo, addressLineTwo) ||
                other.addressLineTwo == addressLineTwo) &&
            (identical(other.addressTownCity, addressTownCity) ||
                other.addressTownCity == addressTownCity) &&
            (identical(other.addressPostCode, addressPostCode) ||
                other.addressPostCode == addressPostCode) &&
            (identical(other.addressCountryCode, addressCountryCode) ||
                other.addressCountryCode == addressCountryCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      addressLineOne,
      addressLineTwo,
      addressTownCity,
      addressPostCode,
      addressCountryCode,
      latitude,
      longitude,
      vendor,
      deliveryPartner,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDTOCopyWith<_$_AddressDTO> get copyWith =>
      __$$_AddressDTOCopyWithImpl<_$_AddressDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressDTOToJson(
      this,
    );
  }
}

abstract class _AddressDTO extends AddressDTO {
  factory _AddressDTO(
      {required final int id,
      required final DeliveryAddressLabel label,
      required final String addressLineOne,
      required final String addressLineTwo,
      required final String addressTownCity,
      required final String addressPostCode,
      required final String addressCountryCode,
      required final double? latitude,
      required final double? longitude,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonUserDTO)
          required final UserDTO? user}) = _$_AddressDTO;
  _AddressDTO._() : super._();

  factory _AddressDTO.fromJson(Map<String, dynamic> json) =
      _$_AddressDTO.fromJson;

  @override
  int get id;
  @override
  DeliveryAddressLabel get label;
  @override
  String get addressLineOne;
  @override
  String get addressLineTwo;
  @override
  String get addressTownCity;
  @override
  String get addressPostCode;
  @override
  String get addressCountryCode;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonUserDTO)
  UserDTO? get user;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDTOCopyWith<_$_AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

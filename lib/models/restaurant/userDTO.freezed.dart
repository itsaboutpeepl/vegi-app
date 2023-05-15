// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return _UserDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDTO {
  int get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get phoneNoCountry => throw _privateConstructorUsedError;
  int get phoneCountryCode => throw _privateConstructorUsedError;
  bool get marketingEmailContactAllowed => throw _privateConstructorUsedError;
  bool get marketingPhoneContactAllowed => throw _privateConstructorUsedError;
  bool get marketingPushContactAllowed => throw _privateConstructorUsedError;
  int get marketingNotificationUtility => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  VegiRole get role => throw _privateConstructorUsedError;
  String get vendorRole => throw _privateConstructorUsedError;
  String get deliveryPartnerRole => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDTOCopyWith<UserDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDTOCopyWith<$Res> {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) then) =
      _$UserDTOCopyWithImpl<$Res, UserDTO>;
  @useResult
  $Res call(
      {int id,
      String? email,
      String phoneNoCountry,
      int phoneCountryCode,
      bool marketingEmailContactAllowed,
      bool marketingPhoneContactAllowed,
      bool marketingPushContactAllowed,
      int marketingNotificationUtility,
      String name,
      bool isSuperAdmin,
      VegiRole role,
      String vendorRole,
      String deliveryPartnerRole,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner});

  $VendorDTOCopyWith<$Res>? get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class _$UserDTOCopyWithImpl<$Res, $Val extends UserDTO>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? phoneNoCountry = null,
    Object? phoneCountryCode = null,
    Object? marketingEmailContactAllowed = null,
    Object? marketingPhoneContactAllowed = null,
    Object? marketingPushContactAllowed = null,
    Object? marketingNotificationUtility = null,
    Object? name = null,
    Object? isSuperAdmin = null,
    Object? role = null,
    Object? vendorRole = null,
    Object? deliveryPartnerRole = null,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNoCountry: null == phoneNoCountry
          ? _value.phoneNoCountry
          : phoneNoCountry // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as int,
      marketingEmailContactAllowed: null == marketingEmailContactAllowed
          ? _value.marketingEmailContactAllowed
          : marketingEmailContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingPhoneContactAllowed: null == marketingPhoneContactAllowed
          ? _value.marketingPhoneContactAllowed
          : marketingPhoneContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingPushContactAllowed: null == marketingPushContactAllowed
          ? _value.marketingPushContactAllowed
          : marketingPushContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingNotificationUtility: null == marketingNotificationUtility
          ? _value.marketingNotificationUtility
          : marketingNotificationUtility // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as VegiRole,
      vendorRole: null == vendorRole
          ? _value.vendorRole
          : vendorRole // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPartnerRole: null == deliveryPartnerRole
          ? _value.deliveryPartnerRole
          : deliveryPartnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
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
}

/// @nodoc
abstract class _$$_UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$$_UserDTOCopyWith(
          _$_UserDTO value, $Res Function(_$_UserDTO) then) =
      __$$_UserDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? email,
      String phoneNoCountry,
      int phoneCountryCode,
      bool marketingEmailContactAllowed,
      bool marketingPhoneContactAllowed,
      bool marketingPushContactAllowed,
      int marketingNotificationUtility,
      String name,
      bool isSuperAdmin,
      VegiRole role,
      String vendorRole,
      String deliveryPartnerRole,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class __$$_UserDTOCopyWithImpl<$Res>
    extends _$UserDTOCopyWithImpl<$Res, _$_UserDTO>
    implements _$$_UserDTOCopyWith<$Res> {
  __$$_UserDTOCopyWithImpl(_$_UserDTO _value, $Res Function(_$_UserDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? phoneNoCountry = null,
    Object? phoneCountryCode = null,
    Object? marketingEmailContactAllowed = null,
    Object? marketingPhoneContactAllowed = null,
    Object? marketingPushContactAllowed = null,
    Object? marketingNotificationUtility = null,
    Object? name = null,
    Object? isSuperAdmin = null,
    Object? role = null,
    Object? vendorRole = null,
    Object? deliveryPartnerRole = null,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
  }) {
    return _then(_$_UserDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNoCountry: null == phoneNoCountry
          ? _value.phoneNoCountry
          : phoneNoCountry // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as int,
      marketingEmailContactAllowed: null == marketingEmailContactAllowed
          ? _value.marketingEmailContactAllowed
          : marketingEmailContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingPhoneContactAllowed: null == marketingPhoneContactAllowed
          ? _value.marketingPhoneContactAllowed
          : marketingPhoneContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingPushContactAllowed: null == marketingPushContactAllowed
          ? _value.marketingPushContactAllowed
          : marketingPushContactAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingNotificationUtility: null == marketingNotificationUtility
          ? _value.marketingNotificationUtility
          : marketingNotificationUtility // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as VegiRole,
      vendorRole: null == vendorRole
          ? _value.vendorRole
          : vendorRole // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPartnerRole: null == deliveryPartnerRole
          ? _value.deliveryPartnerRole
          : deliveryPartnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserDTO extends _UserDTO {
  _$_UserDTO(
      {required this.id,
      required this.email,
      required this.phoneNoCountry,
      required this.phoneCountryCode,
      required this.marketingEmailContactAllowed,
      required this.marketingPhoneContactAllowed,
      required this.marketingPushContactAllowed,
      required this.marketingNotificationUtility,
      required this.name,
      required this.isSuperAdmin,
      required this.role,
      required this.vendorRole,
      required this.deliveryPartnerRole,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required this.vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required this.deliveryPartner})
      : super._();

  factory _$_UserDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserDTOFromJson(json);

  @override
  final int id;
  @override
  final String? email;
  @override
  final String phoneNoCountry;
  @override
  final int phoneCountryCode;
  @override
  final bool marketingEmailContactAllowed;
  @override
  final bool marketingPhoneContactAllowed;
  @override
  final bool marketingPushContactAllowed;
  @override
  final int marketingNotificationUtility;
  @override
  final String name;
  @override
  final bool isSuperAdmin;
  @override
  final VegiRole role;
  @override
  final String vendorRole;
  @override
  final String deliveryPartnerRole;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;

  @override
  String toString() {
    return 'UserDTO(id: $id, email: $email, phoneNoCountry: $phoneNoCountry, phoneCountryCode: $phoneCountryCode, marketingEmailContactAllowed: $marketingEmailContactAllowed, marketingPhoneContactAllowed: $marketingPhoneContactAllowed, marketingPushContactAllowed: $marketingPushContactAllowed, marketingNotificationUtility: $marketingNotificationUtility, name: $name, isSuperAdmin: $isSuperAdmin, role: $role, vendorRole: $vendorRole, deliveryPartnerRole: $deliveryPartnerRole, vendor: $vendor, deliveryPartner: $deliveryPartner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNoCountry, phoneNoCountry) ||
                other.phoneNoCountry == phoneNoCountry) &&
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
            (identical(other.marketingEmailContactAllowed,
                    marketingEmailContactAllowed) ||
                other.marketingEmailContactAllowed ==
                    marketingEmailContactAllowed) &&
            (identical(other.marketingPhoneContactAllowed,
                    marketingPhoneContactAllowed) ||
                other.marketingPhoneContactAllowed ==
                    marketingPhoneContactAllowed) &&
            (identical(other.marketingPushContactAllowed,
                    marketingPushContactAllowed) ||
                other.marketingPushContactAllowed ==
                    marketingPushContactAllowed) &&
            (identical(other.marketingNotificationUtility,
                    marketingNotificationUtility) ||
                other.marketingNotificationUtility ==
                    marketingNotificationUtility) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.vendorRole, vendorRole) ||
                other.vendorRole == vendorRole) &&
            (identical(other.deliveryPartnerRole, deliveryPartnerRole) ||
                other.deliveryPartnerRole == deliveryPartnerRole) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      phoneNoCountry,
      phoneCountryCode,
      marketingEmailContactAllowed,
      marketingPhoneContactAllowed,
      marketingPushContactAllowed,
      marketingNotificationUtility,
      name,
      isSuperAdmin,
      role,
      vendorRole,
      deliveryPartnerRole,
      vendor,
      deliveryPartner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDTOCopyWith<_$_UserDTO> get copyWith =>
      __$$_UserDTOCopyWithImpl<_$_UserDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDTOToJson(
      this,
    );
  }
}

abstract class _UserDTO extends UserDTO {
  factory _UserDTO(
      {required final int id,
      required final String? email,
      required final String phoneNoCountry,
      required final int phoneCountryCode,
      required final bool marketingEmailContactAllowed,
      required final bool marketingPhoneContactAllowed,
      required final bool marketingPushContactAllowed,
      required final int marketingNotificationUtility,
      required final String name,
      required final bool isSuperAdmin,
      required final VegiRole role,
      required final String vendorRole,
      required final String deliveryPartnerRole,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required final DeliveryPartnerDTO? deliveryPartner}) = _$_UserDTO;
  _UserDTO._() : super._();

  factory _UserDTO.fromJson(Map<String, dynamic> json) = _$_UserDTO.fromJson;

  @override
  int get id;
  @override
  String? get email;
  @override
  String get phoneNoCountry;
  @override
  int get phoneCountryCode;
  @override
  bool get marketingEmailContactAllowed;
  @override
  bool get marketingPhoneContactAllowed;
  @override
  bool get marketingPushContactAllowed;
  @override
  int get marketingNotificationUtility;
  @override
  String get name;
  @override
  bool get isSuperAdmin;
  @override
  VegiRole get role;
  @override
  String get vendorRole;
  @override
  String get deliveryPartnerRole;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(ignore: true)
  _$$_UserDTOCopyWith<_$_UserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

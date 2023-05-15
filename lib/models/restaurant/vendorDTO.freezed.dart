// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendorDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VendorDTO _$VendorDTOFromJson(Map<String, dynamic> json) {
  return _VendorDTO.fromJson(json);
}

/// @nodoc
mixin _$VendorDTO {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  VendorType get type => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  num? get costLevel => throw _privateConstructorUsedError;
  num? get rating => throw _privateConstructorUsedError;
  bool get isVegan => throw _privateConstructorUsedError;
  num get minimumOrderAmount => throw _privateConstructorUsedError;
  num get platformFee => throw _privateConstructorUsedError;
  VendorStatus get status => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonAddressDTO)
  AddressDTO? get pickupAddress => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  FulfilmentMethodDTO? get deliveryFulfilmentMethod =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  FulfilmentMethodDTO? get collectionFulfilmentMethod =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonProductDTOList)
  List<ProductDTO> get products => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorCategoryList)
  List<VendorCategory> get vendorCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonProductCategoryList)
  List<ProductCategory> get productCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonPostalDistrictList)
  List<PostalDistrict> get fulfilmentPostalDistricts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorDTOCopyWith<VendorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDTOCopyWith<$Res> {
  factory $VendorDTOCopyWith(VendorDTO value, $Res Function(VendorDTO) then) =
      _$VendorDTOCopyWithImpl<$Res, VendorDTO>;
  @useResult
  $Res call(
      {int id,
      String name,
      VendorType type,
      String? phoneNumber,
      num? costLevel,
      num? rating,
      bool isVegan,
      num minimumOrderAmount,
      num platformFee,
      VendorStatus status,
      String walletAddress,
      String description,
      String imageUrl,
      @JsonKey(fromJson: fromJsonAddressDTO)
          AddressDTO? pickupAddress,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          FulfilmentMethodDTO? deliveryFulfilmentMethod,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          FulfilmentMethodDTO? collectionFulfilmentMethod,
      @JsonKey(fromJson: fromJsonProductDTOList)
          List<ProductDTO> products,
      @JsonKey(fromJson: fromJsonVendorCategoryList)
          List<VendorCategory> vendorCategories,
      @JsonKey(fromJson: fromJsonProductCategoryList)
          List<ProductCategory> productCategories,
      @JsonKey(fromJson: fromJsonPostalDistrictList)
          List<PostalDistrict> fulfilmentPostalDistricts});

  $AddressDTOCopyWith<$Res>? get pickupAddress;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $FulfilmentMethodDTOCopyWith<$Res>? get deliveryFulfilmentMethod;
  $FulfilmentMethodDTOCopyWith<$Res>? get collectionFulfilmentMethod;
}

/// @nodoc
class _$VendorDTOCopyWithImpl<$Res, $Val extends VendorDTO>
    implements $VendorDTOCopyWith<$Res> {
  _$VendorDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? phoneNumber = freezed,
    Object? costLevel = freezed,
    Object? rating = freezed,
    Object? isVegan = null,
    Object? minimumOrderAmount = null,
    Object? platformFee = null,
    Object? status = null,
    Object? walletAddress = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? pickupAddress = freezed,
    Object? deliveryPartner = freezed,
    Object? deliveryFulfilmentMethod = freezed,
    Object? collectionFulfilmentMethod = freezed,
    Object? products = null,
    Object? vendorCategories = null,
    Object? productCategories = null,
    Object? fulfilmentPostalDistricts = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VendorType,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      costLevel: freezed == costLevel
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as num?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumOrderAmount: null == minimumOrderAmount
          ? _value.minimumOrderAmount
          : minimumOrderAmount // ignore: cast_nullable_to_non_nullable
              as num,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VendorStatus,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      deliveryFulfilmentMethod: freezed == deliveryFulfilmentMethod
          ? _value.deliveryFulfilmentMethod
          : deliveryFulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodDTO?,
      collectionFulfilmentMethod: freezed == collectionFulfilmentMethod
          ? _value.collectionFulfilmentMethod
          : collectionFulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodDTO?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      vendorCategories: null == vendorCategories
          ? _value.vendorCategories
          : vendorCategories // ignore: cast_nullable_to_non_nullable
              as List<VendorCategory>,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      fulfilmentPostalDistricts: null == fulfilmentPostalDistricts
          ? _value.fulfilmentPostalDistricts
          : fulfilmentPostalDistricts // ignore: cast_nullable_to_non_nullable
              as List<PostalDistrict>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressDTOCopyWith<$Res>? get pickupAddress {
    if (_value.pickupAddress == null) {
      return null;
    }

    return $AddressDTOCopyWith<$Res>(_value.pickupAddress!, (value) {
      return _then(_value.copyWith(pickupAddress: value) as $Val);
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
  $FulfilmentMethodDTOCopyWith<$Res>? get deliveryFulfilmentMethod {
    if (_value.deliveryFulfilmentMethod == null) {
      return null;
    }

    return $FulfilmentMethodDTOCopyWith<$Res>(_value.deliveryFulfilmentMethod!,
        (value) {
      return _then(_value.copyWith(deliveryFulfilmentMethod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FulfilmentMethodDTOCopyWith<$Res>? get collectionFulfilmentMethod {
    if (_value.collectionFulfilmentMethod == null) {
      return null;
    }

    return $FulfilmentMethodDTOCopyWith<$Res>(
        _value.collectionFulfilmentMethod!, (value) {
      return _then(_value.copyWith(collectionFulfilmentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VendorDTOCopyWith<$Res> implements $VendorDTOCopyWith<$Res> {
  factory _$$_VendorDTOCopyWith(
          _$_VendorDTO value, $Res Function(_$_VendorDTO) then) =
      __$$_VendorDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      VendorType type,
      String? phoneNumber,
      num? costLevel,
      num? rating,
      bool isVegan,
      num minimumOrderAmount,
      num platformFee,
      VendorStatus status,
      String walletAddress,
      String description,
      String imageUrl,
      @JsonKey(fromJson: fromJsonAddressDTO)
          AddressDTO? pickupAddress,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          FulfilmentMethodDTO? deliveryFulfilmentMethod,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          FulfilmentMethodDTO? collectionFulfilmentMethod,
      @JsonKey(fromJson: fromJsonProductDTOList)
          List<ProductDTO> products,
      @JsonKey(fromJson: fromJsonVendorCategoryList)
          List<VendorCategory> vendorCategories,
      @JsonKey(fromJson: fromJsonProductCategoryList)
          List<ProductCategory> productCategories,
      @JsonKey(fromJson: fromJsonPostalDistrictList)
          List<PostalDistrict> fulfilmentPostalDistricts});

  @override
  $AddressDTOCopyWith<$Res>? get pickupAddress;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $FulfilmentMethodDTOCopyWith<$Res>? get deliveryFulfilmentMethod;
  @override
  $FulfilmentMethodDTOCopyWith<$Res>? get collectionFulfilmentMethod;
}

/// @nodoc
class __$$_VendorDTOCopyWithImpl<$Res>
    extends _$VendorDTOCopyWithImpl<$Res, _$_VendorDTO>
    implements _$$_VendorDTOCopyWith<$Res> {
  __$$_VendorDTOCopyWithImpl(
      _$_VendorDTO _value, $Res Function(_$_VendorDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? phoneNumber = freezed,
    Object? costLevel = freezed,
    Object? rating = freezed,
    Object? isVegan = null,
    Object? minimumOrderAmount = null,
    Object? platformFee = null,
    Object? status = null,
    Object? walletAddress = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? pickupAddress = freezed,
    Object? deliveryPartner = freezed,
    Object? deliveryFulfilmentMethod = freezed,
    Object? collectionFulfilmentMethod = freezed,
    Object? products = null,
    Object? vendorCategories = null,
    Object? productCategories = null,
    Object? fulfilmentPostalDistricts = null,
  }) {
    return _then(_$_VendorDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VendorType,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      costLevel: freezed == costLevel
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as num?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumOrderAmount: null == minimumOrderAmount
          ? _value.minimumOrderAmount
          : minimumOrderAmount // ignore: cast_nullable_to_non_nullable
              as num,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VendorStatus,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      deliveryFulfilmentMethod: freezed == deliveryFulfilmentMethod
          ? _value.deliveryFulfilmentMethod
          : deliveryFulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodDTO?,
      collectionFulfilmentMethod: freezed == collectionFulfilmentMethod
          ? _value.collectionFulfilmentMethod
          : collectionFulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodDTO?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      vendorCategories: null == vendorCategories
          ? _value.vendorCategories
          : vendorCategories // ignore: cast_nullable_to_non_nullable
              as List<VendorCategory>,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      fulfilmentPostalDistricts: null == fulfilmentPostalDistricts
          ? _value.fulfilmentPostalDistricts
          : fulfilmentPostalDistricts // ignore: cast_nullable_to_non_nullable
              as List<PostalDistrict>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VendorDTO extends _VendorDTO {
  _$_VendorDTO(
      {required this.id,
      required this.name,
      required this.type,
      required this.phoneNumber,
      required this.costLevel,
      required this.rating,
      required this.isVegan,
      this.minimumOrderAmount = 0,
      this.platformFee = 0,
      required this.status,
      required this.walletAddress,
      this.description = '',
      this.imageUrl = '',
      @JsonKey(fromJson: fromJsonAddressDTO)
          required this.pickupAddress,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          this.deliveryPartner,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          this.deliveryFulfilmentMethod,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          this.collectionFulfilmentMethod,
      @JsonKey(fromJson: fromJsonProductDTOList)
          this.products = const [],
      @JsonKey(fromJson: fromJsonVendorCategoryList)
          required this.vendorCategories,
      @JsonKey(fromJson: fromJsonProductCategoryList)
          required this.productCategories,
      @JsonKey(fromJson: fromJsonPostalDistrictList)
          this.fulfilmentPostalDistricts = const []})
      : super._();

  factory _$_VendorDTO.fromJson(Map<String, dynamic> json) =>
      _$$_VendorDTOFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final VendorType type;
  @override
  final String? phoneNumber;
  @override
  final num? costLevel;
  @override
  final num? rating;
  @override
  final bool isVegan;
  @override
  @JsonKey()
  final num minimumOrderAmount;
  @override
  @JsonKey()
  final num platformFee;
  @override
  final VendorStatus status;
  @override
  final String walletAddress;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey(fromJson: fromJsonAddressDTO)
  final AddressDTO? pickupAddress;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  final FulfilmentMethodDTO? deliveryFulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  final FulfilmentMethodDTO? collectionFulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonProductDTOList)
  final List<ProductDTO> products;
  @override
  @JsonKey(fromJson: fromJsonVendorCategoryList)
  final List<VendorCategory> vendorCategories;
  @override
  @JsonKey(fromJson: fromJsonProductCategoryList)
  final List<ProductCategory> productCategories;
  @override
  @JsonKey(fromJson: fromJsonPostalDistrictList)
  final List<PostalDistrict> fulfilmentPostalDistricts;

  @override
  String toString() {
    return 'VendorDTO(id: $id, name: $name, type: $type, phoneNumber: $phoneNumber, costLevel: $costLevel, rating: $rating, isVegan: $isVegan, minimumOrderAmount: $minimumOrderAmount, platformFee: $platformFee, status: $status, walletAddress: $walletAddress, description: $description, imageUrl: $imageUrl, pickupAddress: $pickupAddress, deliveryPartner: $deliveryPartner, deliveryFulfilmentMethod: $deliveryFulfilmentMethod, collectionFulfilmentMethod: $collectionFulfilmentMethod, products: $products, vendorCategories: $vendorCategories, productCategories: $productCategories, fulfilmentPostalDistricts: $fulfilmentPostalDistricts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VendorDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.costLevel, costLevel) ||
                other.costLevel == costLevel) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isVegan, isVegan) || other.isVegan == isVegan) &&
            (identical(other.minimumOrderAmount, minimumOrderAmount) ||
                other.minimumOrderAmount == minimumOrderAmount) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner) &&
            (identical(
                    other.deliveryFulfilmentMethod, deliveryFulfilmentMethod) ||
                other.deliveryFulfilmentMethod == deliveryFulfilmentMethod) &&
            (identical(other.collectionFulfilmentMethod,
                    collectionFulfilmentMethod) ||
                other.collectionFulfilmentMethod ==
                    collectionFulfilmentMethod) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.vendorCategories, vendorCategories) &&
            const DeepCollectionEquality()
                .equals(other.productCategories, productCategories) &&
            const DeepCollectionEquality().equals(
                other.fulfilmentPostalDistricts, fulfilmentPostalDistricts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        type,
        phoneNumber,
        costLevel,
        rating,
        isVegan,
        minimumOrderAmount,
        platformFee,
        status,
        walletAddress,
        description,
        imageUrl,
        pickupAddress,
        deliveryPartner,
        deliveryFulfilmentMethod,
        collectionFulfilmentMethod,
        const DeepCollectionEquality().hash(products),
        const DeepCollectionEquality().hash(vendorCategories),
        const DeepCollectionEquality().hash(productCategories),
        const DeepCollectionEquality().hash(fulfilmentPostalDistricts)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VendorDTOCopyWith<_$_VendorDTO> get copyWith =>
      __$$_VendorDTOCopyWithImpl<_$_VendorDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorDTOToJson(
      this,
    );
  }
}

abstract class _VendorDTO extends VendorDTO {
  factory _VendorDTO(
      {required final int id,
      required final String name,
      required final VendorType type,
      required final String? phoneNumber,
      required final num? costLevel,
      required final num? rating,
      required final bool isVegan,
      final num minimumOrderAmount,
      final num platformFee,
      required final VendorStatus status,
      required final String walletAddress,
      final String description,
      final String imageUrl,
      @JsonKey(fromJson: fromJsonAddressDTO)
          required final AddressDTO? pickupAddress,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          final FulfilmentMethodDTO? deliveryFulfilmentMethod,
      @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
          final FulfilmentMethodDTO? collectionFulfilmentMethod,
      @JsonKey(fromJson: fromJsonProductDTOList)
          final List<ProductDTO> products,
      @JsonKey(fromJson: fromJsonVendorCategoryList)
          required final List<VendorCategory> vendorCategories,
      @JsonKey(fromJson: fromJsonProductCategoryList)
          required final List<ProductCategory> productCategories,
      @JsonKey(fromJson: fromJsonPostalDistrictList)
          final List<PostalDistrict> fulfilmentPostalDistricts}) = _$_VendorDTO;
  _VendorDTO._() : super._();

  factory _VendorDTO.fromJson(Map<String, dynamic> json) =
      _$_VendorDTO.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  VendorType get type;
  @override
  String? get phoneNumber;
  @override
  num? get costLevel;
  @override
  num? get rating;
  @override
  bool get isVegan;
  @override
  num get minimumOrderAmount;
  @override
  num get platformFee;
  @override
  VendorStatus get status;
  @override
  String get walletAddress;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  @JsonKey(fromJson: fromJsonAddressDTO)
  AddressDTO? get pickupAddress;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  FulfilmentMethodDTO? get deliveryFulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
  FulfilmentMethodDTO? get collectionFulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonProductDTOList)
  List<ProductDTO> get products;
  @override
  @JsonKey(fromJson: fromJsonVendorCategoryList)
  List<VendorCategory> get vendorCategories;
  @override
  @JsonKey(fromJson: fromJsonProductCategoryList)
  List<ProductCategory> get productCategories;
  @override
  @JsonKey(fromJson: fromJsonPostalDistrictList)
  List<PostalDistrict> get fulfilmentPostalDistricts;
  @override
  @JsonKey(ignore: true)
  _$$_VendorDTOCopyWith<_$_VendorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

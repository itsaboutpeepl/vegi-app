// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) {
  return _ProductDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductDTO {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;

  /// this is the price in pence of the restaurant item without any product options applied
  int get basePrice => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  ProductDiscontinuedStatus get status => throw _privateConstructorUsedError;
  String? get ingredients => throw _privateConstructorUsedError;
  String get vendorInternalId => throw _privateConstructorUsedError;
  int get stockCount => throw _privateConstructorUsedError;
  num get stockUnitsPerProduct => throw _privateConstructorUsedError;
  num get sizeInnerUnitValue => throw _privateConstructorUsedError;
  String get sizeInnerUnitType => throw _privateConstructorUsedError;
  String get productBarCode => throw _privateConstructorUsedError;
  String get supplier => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get taxGroup => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonProductCategory)
  ProductCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonProductOptionList)
  List<ProductOption> get options => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonESCRating)
  ESCRating? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDTOCopyWith<ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDTOCopyWith<$Res> {
  factory $ProductDTOCopyWith(
          ProductDTO value, $Res Function(ProductDTO) then) =
      _$ProductDTOCopyWithImpl<$Res, ProductDTO>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String shortDescription,
      int basePrice,
      String imageURL,
      bool isAvailable,
      int priority,
      bool isFeatured,
      ProductDiscontinuedStatus status,
      String? ingredients,
      String vendorInternalId,
      int stockCount,
      num stockUnitsPerProduct,
      num sizeInnerUnitValue,
      String sizeInnerUnitType,
      String productBarCode,
      String supplier,
      String brandName,
      String taxGroup,
      @JsonKey(fromJson: fromJsonVendorDTO) VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonProductCategory) ProductCategory? category,
      @JsonKey(fromJson: fromJsonProductOptionList) List<ProductOption> options,
      @JsonKey(fromJson: fromJsonESCRating) ESCRating? rating});

  $VendorDTOCopyWith<$Res>? get vendor;
  $ProductCategoryCopyWith<$Res>? get category;
  $ESCRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class _$ProductDTOCopyWithImpl<$Res, $Val extends ProductDTO>
    implements $ProductDTOCopyWith<$Res> {
  _$ProductDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? basePrice = null,
    Object? imageURL = null,
    Object? isAvailable = null,
    Object? priority = null,
    Object? isFeatured = null,
    Object? status = null,
    Object? ingredients = freezed,
    Object? vendorInternalId = null,
    Object? stockCount = null,
    Object? stockUnitsPerProduct = null,
    Object? sizeInnerUnitValue = null,
    Object? sizeInnerUnitType = null,
    Object? productBarCode = null,
    Object? supplier = null,
    Object? brandName = null,
    Object? taxGroup = null,
    Object? vendor = freezed,
    Object? category = freezed,
    Object? options = null,
    Object? rating = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductDiscontinuedStatus,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInternalId: null == vendorInternalId
          ? _value.vendorInternalId
          : vendorInternalId // ignore: cast_nullable_to_non_nullable
              as String,
      stockCount: null == stockCount
          ? _value.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockUnitsPerProduct: null == stockUnitsPerProduct
          ? _value.stockUnitsPerProduct
          : stockUnitsPerProduct // ignore: cast_nullable_to_non_nullable
              as num,
      sizeInnerUnitValue: null == sizeInnerUnitValue
          ? _value.sizeInnerUnitValue
          : sizeInnerUnitValue // ignore: cast_nullable_to_non_nullable
              as num,
      sizeInnerUnitType: null == sizeInnerUnitType
          ? _value.sizeInnerUnitType
          : sizeInnerUnitType // ignore: cast_nullable_to_non_nullable
              as String,
      productBarCode: null == productBarCode
          ? _value.productBarCode
          : productBarCode // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      taxGroup: null == taxGroup
          ? _value.taxGroup
          : taxGroup // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ProductOption>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as ESCRating?,
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
  $ProductCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ESCRatingCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $ESCRatingCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductDTOCopyWith<$Res>
    implements $ProductDTOCopyWith<$Res> {
  factory _$$_ProductDTOCopyWith(
          _$_ProductDTO value, $Res Function(_$_ProductDTO) then) =
      __$$_ProductDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String shortDescription,
      int basePrice,
      String imageURL,
      bool isAvailable,
      int priority,
      bool isFeatured,
      ProductDiscontinuedStatus status,
      String? ingredients,
      String vendorInternalId,
      int stockCount,
      num stockUnitsPerProduct,
      num sizeInnerUnitValue,
      String sizeInnerUnitType,
      String productBarCode,
      String supplier,
      String brandName,
      String taxGroup,
      @JsonKey(fromJson: fromJsonVendorDTO) VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonProductCategory) ProductCategory? category,
      @JsonKey(fromJson: fromJsonProductOptionList) List<ProductOption> options,
      @JsonKey(fromJson: fromJsonESCRating) ESCRating? rating});

  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $ProductCategoryCopyWith<$Res>? get category;
  @override
  $ESCRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class __$$_ProductDTOCopyWithImpl<$Res>
    extends _$ProductDTOCopyWithImpl<$Res, _$_ProductDTO>
    implements _$$_ProductDTOCopyWith<$Res> {
  __$$_ProductDTOCopyWithImpl(
      _$_ProductDTO _value, $Res Function(_$_ProductDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? basePrice = null,
    Object? imageURL = null,
    Object? isAvailable = null,
    Object? priority = null,
    Object? isFeatured = null,
    Object? status = null,
    Object? ingredients = freezed,
    Object? vendorInternalId = null,
    Object? stockCount = null,
    Object? stockUnitsPerProduct = null,
    Object? sizeInnerUnitValue = null,
    Object? sizeInnerUnitType = null,
    Object? productBarCode = null,
    Object? supplier = null,
    Object? brandName = null,
    Object? taxGroup = null,
    Object? vendor = freezed,
    Object? category = freezed,
    Object? options = null,
    Object? rating = freezed,
  }) {
    return _then(_$_ProductDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductDiscontinuedStatus,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInternalId: null == vendorInternalId
          ? _value.vendorInternalId
          : vendorInternalId // ignore: cast_nullable_to_non_nullable
              as String,
      stockCount: null == stockCount
          ? _value.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockUnitsPerProduct: null == stockUnitsPerProduct
          ? _value.stockUnitsPerProduct
          : stockUnitsPerProduct // ignore: cast_nullable_to_non_nullable
              as num,
      sizeInnerUnitValue: null == sizeInnerUnitValue
          ? _value.sizeInnerUnitValue
          : sizeInnerUnitValue // ignore: cast_nullable_to_non_nullable
              as num,
      sizeInnerUnitType: null == sizeInnerUnitType
          ? _value.sizeInnerUnitType
          : sizeInnerUnitType // ignore: cast_nullable_to_non_nullable
              as String,
      productBarCode: null == productBarCode
          ? _value.productBarCode
          : productBarCode // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      taxGroup: null == taxGroup
          ? _value.taxGroup
          : taxGroup // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ProductOption>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as ESCRating?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ProductDTO extends _ProductDTO {
  _$_ProductDTO(
      {required this.id,
      required this.name,
      this.description = '',
      this.shortDescription = '',
      required this.basePrice,
      this.imageURL = '',
      required this.isAvailable,
      required this.priority,
      required this.isFeatured,
      required this.status,
      this.ingredients,
      this.vendorInternalId = '',
      this.stockCount = 0,
      this.stockUnitsPerProduct = 1,
      this.sizeInnerUnitValue = 1,
      this.sizeInnerUnitType = '',
      required this.productBarCode,
      this.supplier = '',
      this.brandName = '',
      this.taxGroup = '',
      @JsonKey(fromJson: fromJsonVendorDTO) required this.vendor,
      @JsonKey(fromJson: fromJsonProductCategory) required this.category,
      @JsonKey(fromJson: fromJsonProductOptionList) this.options = const [],
      @JsonKey(fromJson: fromJsonESCRating) this.rating = null})
      : super._();

  factory _$_ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDTOFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String shortDescription;

  /// this is the price in pence of the restaurant item without any product options applied
  @override
  final int basePrice;
  @override
  @JsonKey()
  final String imageURL;
  @override
  final bool isAvailable;
  @override
  final int priority;
  @override
  final bool isFeatured;
  @override
  final ProductDiscontinuedStatus status;
  @override
  final String? ingredients;
  @override
  @JsonKey()
  final String vendorInternalId;
  @override
  @JsonKey()
  final int stockCount;
  @override
  @JsonKey()
  final num stockUnitsPerProduct;
  @override
  @JsonKey()
  final num sizeInnerUnitValue;
  @override
  @JsonKey()
  final String sizeInnerUnitType;
  @override
  final String productBarCode;
  @override
  @JsonKey()
  final String supplier;
  @override
  @JsonKey()
  final String brandName;
  @override
  @JsonKey()
  final String taxGroup;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonProductCategory)
  final ProductCategory? category;
  @override
  @JsonKey(fromJson: fromJsonProductOptionList)
  final List<ProductOption> options;
  @override
  @JsonKey(fromJson: fromJsonESCRating)
  final ESCRating? rating;

  @override
  String toString() {
    return 'ProductDTO(id: $id, name: $name, description: $description, shortDescription: $shortDescription, basePrice: $basePrice, imageURL: $imageURL, isAvailable: $isAvailable, priority: $priority, isFeatured: $isFeatured, status: $status, ingredients: $ingredients, vendorInternalId: $vendorInternalId, stockCount: $stockCount, stockUnitsPerProduct: $stockUnitsPerProduct, sizeInnerUnitValue: $sizeInnerUnitValue, sizeInnerUnitType: $sizeInnerUnitType, productBarCode: $productBarCode, supplier: $supplier, brandName: $brandName, taxGroup: $taxGroup, vendor: $vendor, category: $category, options: $options, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.vendorInternalId, vendorInternalId) ||
                other.vendorInternalId == vendorInternalId) &&
            (identical(other.stockCount, stockCount) ||
                other.stockCount == stockCount) &&
            (identical(other.stockUnitsPerProduct, stockUnitsPerProduct) ||
                other.stockUnitsPerProduct == stockUnitsPerProduct) &&
            (identical(other.sizeInnerUnitValue, sizeInnerUnitValue) ||
                other.sizeInnerUnitValue == sizeInnerUnitValue) &&
            (identical(other.sizeInnerUnitType, sizeInnerUnitType) ||
                other.sizeInnerUnitType == sizeInnerUnitType) &&
            (identical(other.productBarCode, productBarCode) ||
                other.productBarCode == productBarCode) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.taxGroup, taxGroup) ||
                other.taxGroup == taxGroup) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        shortDescription,
        basePrice,
        imageURL,
        isAvailable,
        priority,
        isFeatured,
        status,
        ingredients,
        vendorInternalId,
        stockCount,
        stockUnitsPerProduct,
        sizeInnerUnitValue,
        sizeInnerUnitType,
        productBarCode,
        supplier,
        brandName,
        taxGroup,
        vendor,
        category,
        const DeepCollectionEquality().hash(options),
        rating
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      __$$_ProductDTOCopyWithImpl<_$_ProductDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDTOToJson(
      this,
    );
  }
}

abstract class _ProductDTO extends ProductDTO {
  factory _ProductDTO(
      {required final int id,
      required final String name,
      final String description,
      final String shortDescription,
      required final int basePrice,
      final String imageURL,
      required final bool isAvailable,
      required final int priority,
      required final bool isFeatured,
      required final ProductDiscontinuedStatus status,
      final String? ingredients,
      final String vendorInternalId,
      final int stockCount,
      final num stockUnitsPerProduct,
      final num sizeInnerUnitValue,
      final String sizeInnerUnitType,
      required final String productBarCode,
      final String supplier,
      final String brandName,
      final String taxGroup,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonProductCategory)
          required final ProductCategory? category,
      @JsonKey(fromJson: fromJsonProductOptionList)
          final List<ProductOption> options,
      @JsonKey(fromJson: fromJsonESCRating)
          final ESCRating? rating}) = _$_ProductDTO;
  _ProductDTO._() : super._();

  factory _ProductDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductDTO.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get shortDescription;
  @override

  /// this is the price in pence of the restaurant item without any product options applied
  int get basePrice;
  @override
  String get imageURL;
  @override
  bool get isAvailable;
  @override
  int get priority;
  @override
  bool get isFeatured;
  @override
  ProductDiscontinuedStatus get status;
  @override
  String? get ingredients;
  @override
  String get vendorInternalId;
  @override
  int get stockCount;
  @override
  num get stockUnitsPerProduct;
  @override
  num get sizeInnerUnitValue;
  @override
  String get sizeInnerUnitType;
  @override
  String get productBarCode;
  @override
  String get supplier;
  @override
  String get brandName;
  @override
  String get taxGroup;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonProductCategory)
  ProductCategory? get category;
  @override
  @JsonKey(fromJson: fromJsonProductOptionList)
  List<ProductOption> get options;
  @override
  @JsonKey(fromJson: fromJsonESCRating)
  ESCRating? get rating;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

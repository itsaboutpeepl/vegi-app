// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurantMenuItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantMenuItem _$RestaurantMenuItemFromJson(Map<String, dynamic> json) {
  return _RestaurantMenuItem.fromJson(json);
}

/// @nodoc
mixin _$RestaurantMenuItem {
  String get menuItemID => throw _privateConstructorUsedError;
  String get restaurantID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, int> get extras => throw _privateConstructorUsedError;
  List<ProductOptionsCategory> get listOfProductOptionCategories =>
      throw _privateConstructorUsedError;
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
  ESCRating? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantMenuItemCopyWith<RestaurantMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantMenuItemCopyWith<$Res> {
  factory $RestaurantMenuItemCopyWith(
          RestaurantMenuItem value, $Res Function(RestaurantMenuItem) then) =
      _$RestaurantMenuItemCopyWithImpl<$Res, RestaurantMenuItem>;
  @useResult
  $Res call(
      {String menuItemID,
      String restaurantID,
      String name,
      String imageURL,
      String categoryName,
      int categoryId,
      int price,
      String description,
      Map<String, int> extras,
      List<ProductOptionsCategory> listOfProductOptionCategories,
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
      ESCRating? rating});

  $ESCRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class _$RestaurantMenuItemCopyWithImpl<$Res, $Val extends RestaurantMenuItem>
    implements $RestaurantMenuItemCopyWith<$Res> {
  _$RestaurantMenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemID = null,
    Object? restaurantID = null,
    Object? name = null,
    Object? imageURL = null,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? price = null,
    Object? description = null,
    Object? extras = null,
    Object? listOfProductOptionCategories = null,
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
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      menuItemID: null == menuItemID
          ? _value.menuItemID
          : menuItemID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listOfProductOptionCategories: null == listOfProductOptionCategories
          ? _value.listOfProductOptionCategories
          : listOfProductOptionCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionsCategory>,
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
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as ESCRating?,
    ) as $Val);
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
abstract class _$$_RestaurantMenuItemCopyWith<$Res>
    implements $RestaurantMenuItemCopyWith<$Res> {
  factory _$$_RestaurantMenuItemCopyWith(_$_RestaurantMenuItem value,
          $Res Function(_$_RestaurantMenuItem) then) =
      __$$_RestaurantMenuItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String menuItemID,
      String restaurantID,
      String name,
      String imageURL,
      String categoryName,
      int categoryId,
      int price,
      String description,
      Map<String, int> extras,
      List<ProductOptionsCategory> listOfProductOptionCategories,
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
      ESCRating? rating});

  @override
  $ESCRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class __$$_RestaurantMenuItemCopyWithImpl<$Res>
    extends _$RestaurantMenuItemCopyWithImpl<$Res, _$_RestaurantMenuItem>
    implements _$$_RestaurantMenuItemCopyWith<$Res> {
  __$$_RestaurantMenuItemCopyWithImpl(
      _$_RestaurantMenuItem _value, $Res Function(_$_RestaurantMenuItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemID = null,
    Object? restaurantID = null,
    Object? name = null,
    Object? imageURL = null,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? price = null,
    Object? description = null,
    Object? extras = null,
    Object? listOfProductOptionCategories = null,
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
    Object? rating = freezed,
  }) {
    return _then(_$_RestaurantMenuItem(
      menuItemID: null == menuItemID
          ? _value.menuItemID
          : menuItemID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listOfProductOptionCategories: null == listOfProductOptionCategories
          ? _value.listOfProductOptionCategories
          : listOfProductOptionCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionsCategory>,
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
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as ESCRating?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RestaurantMenuItem extends _RestaurantMenuItem {
  _$_RestaurantMenuItem(
      {required this.menuItemID,
      required this.restaurantID,
      required this.name,
      required this.imageURL,
      required this.categoryName,
      required this.categoryId,
      required this.price,
      required this.description,
      required this.extras,
      required this.listOfProductOptionCategories,
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
      this.rating})
      : super._();

  factory _$_RestaurantMenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantMenuItemFromJson(json);

  @override
  final String menuItemID;
  @override
  final String restaurantID;
  @override
  final String name;
  @override
  final String imageURL;
  @override
  final String categoryName;
  @override
  final int categoryId;
  @override
  final int price;
  @override
  final String description;
  @override
  final Map<String, int> extras;
  @override
  final List<ProductOptionsCategory> listOfProductOptionCategories;
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
  final ESCRating? rating;

  @override
  String toString() {
    return 'RestaurantMenuItem(menuItemID: $menuItemID, restaurantID: $restaurantID, name: $name, imageURL: $imageURL, categoryName: $categoryName, categoryId: $categoryId, price: $price, description: $description, extras: $extras, listOfProductOptionCategories: $listOfProductOptionCategories, isAvailable: $isAvailable, priority: $priority, isFeatured: $isFeatured, status: $status, ingredients: $ingredients, vendorInternalId: $vendorInternalId, stockCount: $stockCount, stockUnitsPerProduct: $stockUnitsPerProduct, sizeInnerUnitValue: $sizeInnerUnitValue, sizeInnerUnitType: $sizeInnerUnitType, productBarCode: $productBarCode, supplier: $supplier, brandName: $brandName, taxGroup: $taxGroup, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantMenuItem &&
            (identical(other.menuItemID, menuItemID) ||
                other.menuItemID == menuItemID) &&
            (identical(other.restaurantID, restaurantID) ||
                other.restaurantID == restaurantID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.extras, extras) &&
            const DeepCollectionEquality().equals(
                other.listOfProductOptionCategories,
                listOfProductOptionCategories) &&
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
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        menuItemID,
        restaurantID,
        name,
        imageURL,
        categoryName,
        categoryId,
        price,
        description,
        const DeepCollectionEquality().hash(extras),
        const DeepCollectionEquality().hash(listOfProductOptionCategories),
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
        rating
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantMenuItemCopyWith<_$_RestaurantMenuItem> get copyWith =>
      __$$_RestaurantMenuItemCopyWithImpl<_$_RestaurantMenuItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantMenuItemToJson(
      this,
    );
  }
}

abstract class _RestaurantMenuItem extends RestaurantMenuItem {
  factory _RestaurantMenuItem(
      {required final String menuItemID,
      required final String restaurantID,
      required final String name,
      required final String imageURL,
      required final String categoryName,
      required final int categoryId,
      required final int price,
      required final String description,
      required final Map<String, int> extras,
      required final List<ProductOptionsCategory> listOfProductOptionCategories,
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
      final ESCRating? rating}) = _$_RestaurantMenuItem;
  _RestaurantMenuItem._() : super._();

  factory _RestaurantMenuItem.fromJson(Map<String, dynamic> json) =
      _$_RestaurantMenuItem.fromJson;

  @override
  String get menuItemID;
  @override
  String get restaurantID;
  @override
  String get name;
  @override
  String get imageURL;
  @override
  String get categoryName;
  @override
  int get categoryId;
  @override
  int get price;
  @override
  String get description;
  @override
  Map<String, int> get extras;
  @override
  List<ProductOptionsCategory> get listOfProductOptionCategories;
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
  ESCRating? get rating;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantMenuItemCopyWith<_$_RestaurantMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

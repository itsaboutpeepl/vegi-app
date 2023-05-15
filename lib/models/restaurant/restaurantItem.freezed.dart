// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurantItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantItem _$RestaurantItemFromJson(Map<String, dynamic> json) {
  return _RestaurantItem.fromJson(json);
}

/// @nodoc
mixin _$RestaurantItem {
  String get restaurantID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get deliveryRestrictionDetails =>
      throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get costLevel => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  DeliveryAddresses get address => throw _privateConstructorUsedError;
  List<RestaurantMenuItem> get listOfMenuItems =>
      throw _privateConstructorUsedError;
  List<ProductCategory> get productCategories =>
      throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get isVegan => throw _privateConstructorUsedError;
  int get minimumOrderAmount => throw _privateConstructorUsedError;
  int get platformFee => throw _privateConstructorUsedError;
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantItemCopyWith<RestaurantItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantItemCopyWith<$Res> {
  factory $RestaurantItemCopyWith(
          RestaurantItem value, $Res Function(RestaurantItem) then) =
      _$RestaurantItemCopyWithImpl<$Res, RestaurantItem>;
  @useResult
  $Res call(
      {String restaurantID,
      String name,
      String phoneNumber,
      String description,
      List<String> deliveryRestrictionDetails,
      String imageURL,
      String category,
      int costLevel,
      int rating,
      DeliveryAddresses address,
      List<RestaurantMenuItem> listOfMenuItems,
      List<ProductCategory> productCategories,
      String walletAddress,
      String status,
      bool isVegan,
      int minimumOrderAmount,
      int platformFee,
      DeliveryPartnerDTO? deliveryPartner});

  $DeliveryAddressesCopyWith<$Res> get address;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class _$RestaurantItemCopyWithImpl<$Res, $Val extends RestaurantItem>
    implements $RestaurantItemCopyWith<$Res> {
  _$RestaurantItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantID = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? description = null,
    Object? deliveryRestrictionDetails = null,
    Object? imageURL = null,
    Object? category = null,
    Object? costLevel = null,
    Object? rating = null,
    Object? address = null,
    Object? listOfMenuItems = null,
    Object? productCategories = null,
    Object? walletAddress = null,
    Object? status = null,
    Object? isVegan = null,
    Object? minimumOrderAmount = null,
    Object? platformFee = null,
    Object? deliveryPartner = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRestrictionDetails: null == deliveryRestrictionDetails
          ? _value.deliveryRestrictionDetails
          : deliveryRestrictionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      costLevel: null == costLevel
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      listOfMenuItems: null == listOfMenuItems
          ? _value.listOfMenuItems
          : listOfMenuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumOrderAmount: null == minimumOrderAmount
          ? _value.minimumOrderAmount
          : minimumOrderAmount // ignore: cast_nullable_to_non_nullable
              as int,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res> get address {
    return $DeliveryAddressesCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
abstract class _$$_RestaurantItemCopyWith<$Res>
    implements $RestaurantItemCopyWith<$Res> {
  factory _$$_RestaurantItemCopyWith(
          _$_RestaurantItem value, $Res Function(_$_RestaurantItem) then) =
      __$$_RestaurantItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantID,
      String name,
      String phoneNumber,
      String description,
      List<String> deliveryRestrictionDetails,
      String imageURL,
      String category,
      int costLevel,
      int rating,
      DeliveryAddresses address,
      List<RestaurantMenuItem> listOfMenuItems,
      List<ProductCategory> productCategories,
      String walletAddress,
      String status,
      bool isVegan,
      int minimumOrderAmount,
      int platformFee,
      DeliveryPartnerDTO? deliveryPartner});

  @override
  $DeliveryAddressesCopyWith<$Res> get address;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class __$$_RestaurantItemCopyWithImpl<$Res>
    extends _$RestaurantItemCopyWithImpl<$Res, _$_RestaurantItem>
    implements _$$_RestaurantItemCopyWith<$Res> {
  __$$_RestaurantItemCopyWithImpl(
      _$_RestaurantItem _value, $Res Function(_$_RestaurantItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantID = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? description = null,
    Object? deliveryRestrictionDetails = null,
    Object? imageURL = null,
    Object? category = null,
    Object? costLevel = null,
    Object? rating = null,
    Object? address = null,
    Object? listOfMenuItems = null,
    Object? productCategories = null,
    Object? walletAddress = null,
    Object? status = null,
    Object? isVegan = null,
    Object? minimumOrderAmount = null,
    Object? platformFee = null,
    Object? deliveryPartner = freezed,
  }) {
    return _then(_$_RestaurantItem(
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRestrictionDetails: null == deliveryRestrictionDetails
          ? _value.deliveryRestrictionDetails
          : deliveryRestrictionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      costLevel: null == costLevel
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      listOfMenuItems: null == listOfMenuItems
          ? _value.listOfMenuItems
          : listOfMenuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumOrderAmount: null == minimumOrderAmount
          ? _value.minimumOrderAmount
          : minimumOrderAmount // ignore: cast_nullable_to_non_nullable
              as int,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RestaurantItem extends _RestaurantItem {
  _$_RestaurantItem(
      {required this.restaurantID,
      required this.name,
      required this.phoneNumber,
      required this.description,
      required this.deliveryRestrictionDetails,
      required this.imageURL,
      required this.category,
      required this.costLevel,
      required this.rating,
      required this.address,
      required this.listOfMenuItems,
      required this.productCategories,
      required this.walletAddress,
      required this.status,
      required this.isVegan,
      required this.minimumOrderAmount,
      required this.platformFee,
      required this.deliveryPartner})
      : super._();

  factory _$_RestaurantItem.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantItemFromJson(json);

  @override
  final String restaurantID;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String description;
  @override
  final List<String> deliveryRestrictionDetails;
  @override
  final String imageURL;
  @override
  final String category;
  @override
  final int costLevel;
  @override
  final int rating;
  @override
  final DeliveryAddresses address;
  @override
  final List<RestaurantMenuItem> listOfMenuItems;
  @override
  final List<ProductCategory> productCategories;
  @override
  final String walletAddress;
  @override
  final String status;
  @override
  final bool isVegan;
  @override
  final int minimumOrderAmount;
  @override
  final int platformFee;
  @override
  final DeliveryPartnerDTO? deliveryPartner;

  @override
  String toString() {
    return 'RestaurantItem(restaurantID: $restaurantID, name: $name, phoneNumber: $phoneNumber, description: $description, deliveryRestrictionDetails: $deliveryRestrictionDetails, imageURL: $imageURL, category: $category, costLevel: $costLevel, rating: $rating, address: $address, listOfMenuItems: $listOfMenuItems, productCategories: $productCategories, walletAddress: $walletAddress, status: $status, isVegan: $isVegan, minimumOrderAmount: $minimumOrderAmount, platformFee: $platformFee, deliveryPartner: $deliveryPartner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantItem &&
            (identical(other.restaurantID, restaurantID) ||
                other.restaurantID == restaurantID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
                other.deliveryRestrictionDetails, deliveryRestrictionDetails) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.costLevel, costLevel) ||
                other.costLevel == costLevel) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other.listOfMenuItems, listOfMenuItems) &&
            const DeepCollectionEquality()
                .equals(other.productCategories, productCategories) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isVegan, isVegan) || other.isVegan == isVegan) &&
            (identical(other.minimumOrderAmount, minimumOrderAmount) ||
                other.minimumOrderAmount == minimumOrderAmount) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantID,
      name,
      phoneNumber,
      description,
      const DeepCollectionEquality().hash(deliveryRestrictionDetails),
      imageURL,
      category,
      costLevel,
      rating,
      address,
      const DeepCollectionEquality().hash(listOfMenuItems),
      const DeepCollectionEquality().hash(productCategories),
      walletAddress,
      status,
      isVegan,
      minimumOrderAmount,
      platformFee,
      deliveryPartner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantItemCopyWith<_$_RestaurantItem> get copyWith =>
      __$$_RestaurantItemCopyWithImpl<_$_RestaurantItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantItemToJson(
      this,
    );
  }
}

abstract class _RestaurantItem extends RestaurantItem {
  factory _RestaurantItem(
      {required final String restaurantID,
      required final String name,
      required final String phoneNumber,
      required final String description,
      required final List<String> deliveryRestrictionDetails,
      required final String imageURL,
      required final String category,
      required final int costLevel,
      required final int rating,
      required final DeliveryAddresses address,
      required final List<RestaurantMenuItem> listOfMenuItems,
      required final List<ProductCategory> productCategories,
      required final String walletAddress,
      required final String status,
      required final bool isVegan,
      required final int minimumOrderAmount,
      required final int platformFee,
      required final DeliveryPartnerDTO? deliveryPartner}) = _$_RestaurantItem;
  _RestaurantItem._() : super._();

  factory _RestaurantItem.fromJson(Map<String, dynamic> json) =
      _$_RestaurantItem.fromJson;

  @override
  String get restaurantID;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get description;
  @override
  List<String> get deliveryRestrictionDetails;
  @override
  String get imageURL;
  @override
  String get category;
  @override
  int get costLevel;
  @override
  int get rating;
  @override
  DeliveryAddresses get address;
  @override
  List<RestaurantMenuItem> get listOfMenuItems;
  @override
  List<ProductCategory> get productCategories;
  @override
  String get walletAddress;
  @override
  String get status;
  @override
  bool get isVegan;
  @override
  int get minimumOrderAmount;
  @override
  int get platformFee;
  @override
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantItemCopyWith<_$_RestaurantItem> get copyWith =>
      throw _privateConstructorUsedError;
}

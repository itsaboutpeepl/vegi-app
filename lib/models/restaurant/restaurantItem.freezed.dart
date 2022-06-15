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
  String get walletAddress => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantItemCopyWith<RestaurantItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantItemCopyWith<$Res> {
  factory $RestaurantItemCopyWith(
          RestaurantItem value, $Res Function(RestaurantItem) then) =
      _$RestaurantItemCopyWithImpl<$Res>;
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
      String walletAddress,
      String status});

  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class _$RestaurantItemCopyWithImpl<$Res>
    implements $RestaurantItemCopyWith<$Res> {
  _$RestaurantItemCopyWithImpl(this._value, this._then);

  final RestaurantItem _value;
  // ignore: unused_field
  final $Res Function(RestaurantItem) _then;

  @override
  $Res call({
    Object? restaurantID = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? deliveryRestrictionDetails = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? costLevel = freezed,
    Object? rating = freezed,
    Object? address = freezed,
    Object? listOfMenuItems = freezed,
    Object? walletAddress = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRestrictionDetails: deliveryRestrictionDetails == freezed
          ? _value.deliveryRestrictionDetails
          : deliveryRestrictionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      costLevel: costLevel == freezed
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      listOfMenuItems: listOfMenuItems == freezed
          ? _value.listOfMenuItems
          : listOfMenuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
      walletAddress: walletAddress == freezed
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $DeliveryAddressesCopyWith<$Res> get address {
    return $DeliveryAddressesCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
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
      String walletAddress,
      String status});

  @override
  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class __$$_RestaurantItemCopyWithImpl<$Res>
    extends _$RestaurantItemCopyWithImpl<$Res>
    implements _$$_RestaurantItemCopyWith<$Res> {
  __$$_RestaurantItemCopyWithImpl(
      _$_RestaurantItem _value, $Res Function(_$_RestaurantItem) _then)
      : super(_value, (v) => _then(v as _$_RestaurantItem));

  @override
  _$_RestaurantItem get _value => super._value as _$_RestaurantItem;

  @override
  $Res call({
    Object? restaurantID = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? deliveryRestrictionDetails = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? costLevel = freezed,
    Object? rating = freezed,
    Object? address = freezed,
    Object? listOfMenuItems = freezed,
    Object? walletAddress = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_RestaurantItem(
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRestrictionDetails: deliveryRestrictionDetails == freezed
          ? _value.deliveryRestrictionDetails
          : deliveryRestrictionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      costLevel: costLevel == freezed
          ? _value.costLevel
          : costLevel // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      listOfMenuItems: listOfMenuItems == freezed
          ? _value.listOfMenuItems
          : listOfMenuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
      walletAddress: walletAddress == freezed
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.walletAddress,
      required this.status})
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
  final String walletAddress;
  @override
  final String status;

  @override
  String toString() {
    return 'RestaurantItem(restaurantID: $restaurantID, name: $name, phoneNumber: $phoneNumber, description: $description, deliveryRestrictionDetails: $deliveryRestrictionDetails, imageURL: $imageURL, category: $category, costLevel: $costLevel, rating: $rating, address: $address, listOfMenuItems: $listOfMenuItems, walletAddress: $walletAddress, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantItem &&
            const DeepCollectionEquality()
                .equals(other.restaurantID, restaurantID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(
                other.deliveryRestrictionDetails, deliveryRestrictionDetails) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.costLevel, costLevel) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.listOfMenuItems, listOfMenuItems) &&
            const DeepCollectionEquality()
                .equals(other.walletAddress, walletAddress) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(restaurantID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(deliveryRestrictionDetails),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(costLevel),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(listOfMenuItems),
      const DeepCollectionEquality().hash(walletAddress),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantItemCopyWith<_$_RestaurantItem> get copyWith =>
      __$$_RestaurantItemCopyWithImpl<_$_RestaurantItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantItemToJson(this);
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
      required final String walletAddress,
      required final String status}) = _$_RestaurantItem;
  _RestaurantItem._() : super._();

  factory _RestaurantItem.fromJson(Map<String, dynamic> json) =
      _$_RestaurantItem.fromJson;

  @override
  String get restaurantID => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<String> get deliveryRestrictionDetails =>
      throw _privateConstructorUsedError;
  @override
  String get imageURL => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  int get costLevel => throw _privateConstructorUsedError;
  @override
  int get rating => throw _privateConstructorUsedError;
  @override
  DeliveryAddresses get address => throw _privateConstructorUsedError;
  @override
  List<RestaurantMenuItem> get listOfMenuItems =>
      throw _privateConstructorUsedError;
  @override
  String get walletAddress => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantItemCopyWith<_$_RestaurantItem> get copyWith =>
      throw _privateConstructorUsedError;
}

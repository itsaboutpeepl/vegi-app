// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurantCategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantCategory _$RestaurantCategoryFromJson(Map<String, dynamic> json) {
  return _RestaurantCategory.fromJson(json);
}

/// @nodoc
mixin _$RestaurantCategory {
  String get categoryName => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  List<RestaurantItem> get listOfRestaurants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCategoryCopyWith<RestaurantCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCategoryCopyWith<$Res> {
  factory $RestaurantCategoryCopyWith(
          RestaurantCategory value, $Res Function(RestaurantCategory) then) =
      _$RestaurantCategoryCopyWithImpl<$Res, RestaurantCategory>;
  @useResult
  $Res call(
      {String categoryName,
      String imageURL,
      List<RestaurantItem> listOfRestaurants});
}

/// @nodoc
class _$RestaurantCategoryCopyWithImpl<$Res, $Val extends RestaurantCategory>
    implements $RestaurantCategoryCopyWith<$Res> {
  _$RestaurantCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? imageURL = null,
    Object? listOfRestaurants = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      listOfRestaurants: null == listOfRestaurants
          ? _value.listOfRestaurants
          : listOfRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantCategoryCopyWith<$Res>
    implements $RestaurantCategoryCopyWith<$Res> {
  factory _$$_RestaurantCategoryCopyWith(_$_RestaurantCategory value,
          $Res Function(_$_RestaurantCategory) then) =
      __$$_RestaurantCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      String imageURL,
      List<RestaurantItem> listOfRestaurants});
}

/// @nodoc
class __$$_RestaurantCategoryCopyWithImpl<$Res>
    extends _$RestaurantCategoryCopyWithImpl<$Res, _$_RestaurantCategory>
    implements _$$_RestaurantCategoryCopyWith<$Res> {
  __$$_RestaurantCategoryCopyWithImpl(
      _$_RestaurantCategory _value, $Res Function(_$_RestaurantCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? imageURL = null,
    Object? listOfRestaurants = null,
  }) {
    return _then(_$_RestaurantCategory(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      listOfRestaurants: null == listOfRestaurants
          ? _value.listOfRestaurants
          : listOfRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RestaurantCategory extends _RestaurantCategory {
  _$_RestaurantCategory(
      {required this.categoryName,
      required this.imageURL,
      required this.listOfRestaurants})
      : super._();

  factory _$_RestaurantCategory.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantCategoryFromJson(json);

  @override
  final String categoryName;
  @override
  final String imageURL;
  @override
  final List<RestaurantItem> listOfRestaurants;

  @override
  String toString() {
    return 'RestaurantCategory(categoryName: $categoryName, imageURL: $imageURL, listOfRestaurants: $listOfRestaurants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantCategory &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            const DeepCollectionEquality()
                .equals(other.listOfRestaurants, listOfRestaurants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryName, imageURL,
      const DeepCollectionEquality().hash(listOfRestaurants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantCategoryCopyWith<_$_RestaurantCategory> get copyWith =>
      __$$_RestaurantCategoryCopyWithImpl<_$_RestaurantCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantCategoryToJson(
      this,
    );
  }
}

abstract class _RestaurantCategory extends RestaurantCategory {
  factory _RestaurantCategory(
          {required final String categoryName,
          required final String imageURL,
          required final List<RestaurantItem> listOfRestaurants}) =
      _$_RestaurantCategory;
  _RestaurantCategory._() : super._();

  factory _RestaurantCategory.fromJson(Map<String, dynamic> json) =
      _$_RestaurantCategory.fromJson;

  @override
  String get categoryName;
  @override
  String get imageURL;
  @override
  List<RestaurantItem> get listOfRestaurants;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantCategoryCopyWith<_$_RestaurantCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

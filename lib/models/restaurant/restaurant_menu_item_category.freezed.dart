// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_menu_item_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantMenuItemCategory _$RestaurantMenuItemCategoryFromJson(
    Map<String, dynamic> json) {
  return _RestaurantMenuItemCategory.fromJson(json);
}

/// @nodoc
mixin _$RestaurantMenuItemCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  List<RestaurantMenuItem> get menuItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantMenuItemCategoryCopyWith<RestaurantMenuItemCategory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantMenuItemCategoryCopyWith<$Res> {
  factory $RestaurantMenuItemCategoryCopyWith(RestaurantMenuItemCategory value,
          $Res Function(RestaurantMenuItemCategory) then) =
      _$RestaurantMenuItemCategoryCopyWithImpl<$Res,
          RestaurantMenuItemCategory>;
  @useResult
  $Res call(
      {int id,
      String name,
      String imageURL,
      int groupId,
      List<RestaurantMenuItem> menuItems});
}

/// @nodoc
class _$RestaurantMenuItemCategoryCopyWithImpl<$Res,
        $Val extends RestaurantMenuItemCategory>
    implements $RestaurantMenuItemCategoryCopyWith<$Res> {
  _$RestaurantMenuItemCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageURL = null,
    Object? groupId = null,
    Object? menuItems = null,
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
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      menuItems: null == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantMenuItemCategoryCopyWith<$Res>
    implements $RestaurantMenuItemCategoryCopyWith<$Res> {
  factory _$$_RestaurantMenuItemCategoryCopyWith(
          _$_RestaurantMenuItemCategory value,
          $Res Function(_$_RestaurantMenuItemCategory) then) =
      __$$_RestaurantMenuItemCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String imageURL,
      int groupId,
      List<RestaurantMenuItem> menuItems});
}

/// @nodoc
class __$$_RestaurantMenuItemCategoryCopyWithImpl<$Res>
    extends _$RestaurantMenuItemCategoryCopyWithImpl<$Res,
        _$_RestaurantMenuItemCategory>
    implements _$$_RestaurantMenuItemCategoryCopyWith<$Res> {
  __$$_RestaurantMenuItemCategoryCopyWithImpl(
      _$_RestaurantMenuItemCategory _value,
      $Res Function(_$_RestaurantMenuItemCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageURL = null,
    Object? groupId = null,
    Object? menuItems = null,
  }) {
    return _then(_$_RestaurantMenuItemCategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      menuItems: null == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RestaurantMenuItemCategory extends _RestaurantMenuItemCategory {
  _$_RestaurantMenuItemCategory(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.groupId,
      required this.menuItems})
      : super._();

  factory _$_RestaurantMenuItemCategory.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantMenuItemCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageURL;
  @override
  final int groupId;
  @override
  final List<RestaurantMenuItem> menuItems;

  @override
  String toString() {
    return 'RestaurantMenuItemCategory(id: $id, name: $name, imageURL: $imageURL, groupId: $groupId, menuItems: $menuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantMenuItemCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            const DeepCollectionEquality().equals(other.menuItems, menuItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageURL, groupId,
      const DeepCollectionEquality().hash(menuItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantMenuItemCategoryCopyWith<_$_RestaurantMenuItemCategory>
      get copyWith => __$$_RestaurantMenuItemCategoryCopyWithImpl<
          _$_RestaurantMenuItemCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantMenuItemCategoryToJson(
      this,
    );
  }
}

abstract class _RestaurantMenuItemCategory extends RestaurantMenuItemCategory {
  factory _RestaurantMenuItemCategory(
          {required final int id,
          required final String name,
          required final String imageURL,
          required final int groupId,
          required final List<RestaurantMenuItem> menuItems}) =
      _$_RestaurantMenuItemCategory;
  _RestaurantMenuItemCategory._() : super._();

  factory _RestaurantMenuItemCategory.fromJson(Map<String, dynamic> json) =
      _$_RestaurantMenuItemCategory.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageURL;
  @override
  int get groupId;
  @override
  List<RestaurantMenuItem> get menuItems;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantMenuItemCategoryCopyWith<_$_RestaurantMenuItemCategory>
      get copyWith => throw _privateConstructorUsedError;
}

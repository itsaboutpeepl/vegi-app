// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menuItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
class _$MenuItemTearOff {
  const _$MenuItemTearOff();

  _MenuItem call(
      {required String menuItemID,
      required String restaurantID,
      required String name,
      required String imageURL,
      required String category,
      required int price,
      required String description,
      required Map<String, int> extras,
      required List<ProductOptionsCategory> listOfProductOptions,
      required bool isFeatured}) {
    return _MenuItem(
      menuItemID: menuItemID,
      restaurantID: restaurantID,
      name: name,
      imageURL: imageURL,
      category: category,
      price: price,
      description: description,
      extras: extras,
      listOfProductOptions: listOfProductOptions,
      isFeatured: isFeatured,
    );
  }

  MenuItem fromJson(Map<String, Object?> json) {
    return MenuItem.fromJson(json);
  }
}

/// @nodoc
const $MenuItem = _$MenuItemTearOff();

/// @nodoc
mixin _$MenuItem {
  String get menuItemID => throw _privateConstructorUsedError;
  String get restaurantID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, int> get extras => throw _privateConstructorUsedError;
  List<ProductOptionsCategory> get listOfProductOptions =>
      throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res>;
  $Res call(
      {String menuItemID,
      String restaurantID,
      String name,
      String imageURL,
      String category,
      int price,
      String description,
      Map<String, int> extras,
      List<ProductOptionsCategory> listOfProductOptions,
      bool isFeatured});
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res> implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  final MenuItem _value;
  // ignore: unused_field
  final $Res Function(MenuItem) _then;

  @override
  $Res call({
    Object? menuItemID = freezed,
    Object? restaurantID = freezed,
    Object? name = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? extras = freezed,
    Object? listOfProductOptions = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_value.copyWith(
      menuItemID: menuItemID == freezed
          ? _value.menuItemID
          : menuItemID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extras: extras == freezed
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listOfProductOptions: listOfProductOptions == freezed
          ? _value.listOfProductOptions
          : listOfProductOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionsCategory>,
      isFeatured: isFeatured == freezed
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) then) =
      __$MenuItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String menuItemID,
      String restaurantID,
      String name,
      String imageURL,
      String category,
      int price,
      String description,
      Map<String, int> extras,
      List<ProductOptionsCategory> listOfProductOptions,
      bool isFeatured});
}

/// @nodoc
class __$MenuItemCopyWithImpl<$Res> extends _$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(_MenuItem _value, $Res Function(_MenuItem) _then)
      : super(_value, (v) => _then(v as _MenuItem));

  @override
  _MenuItem get _value => super._value as _MenuItem;

  @override
  $Res call({
    Object? menuItemID = freezed,
    Object? restaurantID = freezed,
    Object? name = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? extras = freezed,
    Object? listOfProductOptions = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_MenuItem(
      menuItemID: menuItemID == freezed
          ? _value.menuItemID
          : menuItemID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extras: extras == freezed
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listOfProductOptions: listOfProductOptions == freezed
          ? _value.listOfProductOptions
          : listOfProductOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionsCategory>,
      isFeatured: isFeatured == freezed
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_MenuItem extends _MenuItem {
  _$_MenuItem(
      {required this.menuItemID,
      required this.restaurantID,
      required this.name,
      required this.imageURL,
      required this.category,
      required this.price,
      required this.description,
      required this.extras,
      required this.listOfProductOptions,
      required this.isFeatured})
      : super._();

  factory _$_MenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemFromJson(json);

  @override
  final String menuItemID;
  @override
  final String restaurantID;
  @override
  final String name;
  @override
  final String imageURL;
  @override
  final String category;
  @override
  final int price;
  @override
  final String description;
  @override
  final Map<String, int> extras;
  @override
  final List<ProductOptionsCategory> listOfProductOptions;
  @override
  final bool isFeatured;

  @override
  String toString() {
    return 'MenuItem(menuItemID: $menuItemID, restaurantID: $restaurantID, name: $name, imageURL: $imageURL, category: $category, price: $price, description: $description, extras: $extras, listOfProductOptions: $listOfProductOptions, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuItem &&
            const DeepCollectionEquality()
                .equals(other.menuItemID, menuItemID) &&
            const DeepCollectionEquality()
                .equals(other.restaurantID, restaurantID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.extras, extras) &&
            const DeepCollectionEquality()
                .equals(other.listOfProductOptions, listOfProductOptions) &&
            const DeepCollectionEquality()
                .equals(other.isFeatured, isFeatured));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(menuItemID),
      const DeepCollectionEquality().hash(restaurantID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(extras),
      const DeepCollectionEquality().hash(listOfProductOptions),
      const DeepCollectionEquality().hash(isFeatured));

  @JsonKey(ignore: true)
  @override
  _$MenuItemCopyWith<_MenuItem> get copyWith =>
      __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuItemToJson(this);
  }
}

abstract class _MenuItem extends MenuItem {
  factory _MenuItem(
      {required String menuItemID,
      required String restaurantID,
      required String name,
      required String imageURL,
      required String category,
      required int price,
      required String description,
      required Map<String, int> extras,
      required List<ProductOptionsCategory> listOfProductOptions,
      required bool isFeatured}) = _$_MenuItem;
  _MenuItem._() : super._();

  factory _MenuItem.fromJson(Map<String, dynamic> json) = _$_MenuItem.fromJson;

  @override
  String get menuItemID;
  @override
  String get restaurantID;
  @override
  String get name;
  @override
  String get imageURL;
  @override
  String get category;
  @override
  int get price;
  @override
  String get description;
  @override
  Map<String, int> get extras;
  @override
  List<ProductOptionsCategory> get listOfProductOptions;
  @override
  bool get isFeatured;
  @override
  @JsonKey(ignore: true)
  _$MenuItemCopyWith<_MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

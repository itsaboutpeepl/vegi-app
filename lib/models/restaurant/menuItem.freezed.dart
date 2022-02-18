// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
      {required String menuID,
      required String name,
      required List<String> imageURLs,
      required String category,
      required int price,
      required String description,
      required Map<String, int> options,
      required bool isFeatured}) {
    return _MenuItem(
      menuID: menuID,
      name: name,
      imageURLs: imageURLs,
      category: category,
      price: price,
      description: description,
      options: options,
      isFeatured: isFeatured,
    );
  }

  MenuItem fromJson(Map<String, Object> json) {
    return MenuItem.fromJson(json);
  }
}

/// @nodoc
const $MenuItem = _$MenuItemTearOff();

/// @nodoc
mixin _$MenuItem {
  String get menuID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get imageURLs => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, int> get options => throw _privateConstructorUsedError;
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
      {String menuID,
      String name,
      List<String> imageURLs,
      String category,
      int price,
      String description,
      Map<String, int> options,
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
    Object? menuID = freezed,
    Object? name = freezed,
    Object? imageURLs = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? options = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_value.copyWith(
      menuID: menuID == freezed
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURLs: imageURLs == freezed
          ? _value.imageURLs
          : imageURLs // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
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
      {String menuID,
      String name,
      List<String> imageURLs,
      String category,
      int price,
      String description,
      Map<String, int> options,
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
    Object? menuID = freezed,
    Object? name = freezed,
    Object? imageURLs = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? options = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_MenuItem(
      menuID: menuID == freezed
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURLs: imageURLs == freezed
          ? _value.imageURLs
          : imageURLs // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
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
      {required this.menuID,
      required this.name,
      required this.imageURLs,
      required this.category,
      required this.price,
      required this.description,
      required this.options,
      required this.isFeatured})
      : super._();

  factory _$_MenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemFromJson(json);

  @override
  final String menuID;
  @override
  final String name;
  @override
  final List<String> imageURLs;
  @override
  final String category;
  @override
  final int price;
  @override
  final String description;
  @override
  final Map<String, int> options;
  @override
  final bool isFeatured;

  @override
  String toString() {
    return 'MenuItem(menuID: $menuID, name: $name, imageURLs: $imageURLs, category: $category, price: $price, description: $description, options: $options, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuItem &&
            (identical(other.menuID, menuID) ||
                const DeepCollectionEquality().equals(other.menuID, menuID)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageURLs, imageURLs) ||
                const DeepCollectionEquality()
                    .equals(other.imageURLs, imageURLs)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality()
                    .equals(other.options, options)) &&
            (identical(other.isFeatured, isFeatured) ||
                const DeepCollectionEquality()
                    .equals(other.isFeatured, isFeatured)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(menuID) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageURLs) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(isFeatured);

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
      {required String menuID,
      required String name,
      required List<String> imageURLs,
      required String category,
      required int price,
      required String description,
      required Map<String, int> options,
      required bool isFeatured}) = _$_MenuItem;
  _MenuItem._() : super._();

  factory _MenuItem.fromJson(Map<String, dynamic> json) = _$_MenuItem.fromJson;

  @override
  String get menuID => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get imageURLs => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  Map<String, int> get options => throw _privateConstructorUsedError;
  @override
  bool get isFeatured => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuItemCopyWith<_MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

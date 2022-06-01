// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuItemState _$MenuItemStateFromJson(Map<String, dynamic> json) {
  return _MenuItemState.fromJson(json);
}

/// @nodoc
class _$MenuItemStateTearOff {
  const _$MenuItemStateTearOff();

  _MenuItemState call(
      {required RestaurantMenuItem menuItem,
      required int totalPrice,
      required int itemReward,
      required Map<int, ProductOptions> selectedProductOptionsForCategory,
      required int quantity}) {
    return _MenuItemState(
      menuItem: menuItem,
      totalPrice: totalPrice,
      itemReward: itemReward,
      selectedProductOptionsForCategory: selectedProductOptionsForCategory,
      quantity: quantity,
    );
  }

  MenuItemState fromJson(Map<String, Object?> json) {
    return MenuItemState.fromJson(json);
  }
}

/// @nodoc
const $MenuItemState = _$MenuItemStateTearOff();

/// @nodoc
mixin _$MenuItemState {
  RestaurantMenuItem get menuItem => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  int get itemReward => throw _privateConstructorUsedError;
  Map<int, ProductOptions> get selectedProductOptionsForCategory =>
      throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemStateCopyWith<MenuItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemStateCopyWith<$Res> {
  factory $MenuItemStateCopyWith(
          MenuItemState value, $Res Function(MenuItemState) then) =
      _$MenuItemStateCopyWithImpl<$Res>;
  $Res call(
      {RestaurantMenuItem menuItem,
      int totalPrice,
      int itemReward,
      Map<int, ProductOptions> selectedProductOptionsForCategory,
      int quantity});

  $RestaurantMenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class _$MenuItemStateCopyWithImpl<$Res>
    implements $MenuItemStateCopyWith<$Res> {
  _$MenuItemStateCopyWithImpl(this._value, this._then);

  final MenuItemState _value;
  // ignore: unused_field
  final $Res Function(MenuItemState) _then;

  @override
  $Res call({
    Object? menuItem = freezed,
    Object? totalPrice = freezed,
    Object? itemReward = freezed,
    Object? selectedProductOptionsForCategory = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as RestaurantMenuItem,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemReward: itemReward == freezed
          ? _value.itemReward
          : itemReward // ignore: cast_nullable_to_non_nullable
              as int,
      selectedProductOptionsForCategory: selectedProductOptionsForCategory ==
              freezed
          ? _value.selectedProductOptionsForCategory
          : selectedProductOptionsForCategory // ignore: cast_nullable_to_non_nullable
              as Map<int, ProductOptions>,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $RestaurantMenuItemCopyWith<$Res> get menuItem {
    return $RestaurantMenuItemCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value));
    });
  }
}

/// @nodoc
abstract class _$MenuItemStateCopyWith<$Res>
    implements $MenuItemStateCopyWith<$Res> {
  factory _$MenuItemStateCopyWith(
          _MenuItemState value, $Res Function(_MenuItemState) then) =
      __$MenuItemStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestaurantMenuItem menuItem,
      int totalPrice,
      int itemReward,
      Map<int, ProductOptions> selectedProductOptionsForCategory,
      int quantity});

  @override
  $RestaurantMenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class __$MenuItemStateCopyWithImpl<$Res>
    extends _$MenuItemStateCopyWithImpl<$Res>
    implements _$MenuItemStateCopyWith<$Res> {
  __$MenuItemStateCopyWithImpl(
      _MenuItemState _value, $Res Function(_MenuItemState) _then)
      : super(_value, (v) => _then(v as _MenuItemState));

  @override
  _MenuItemState get _value => super._value as _MenuItemState;

  @override
  $Res call({
    Object? menuItem = freezed,
    Object? totalPrice = freezed,
    Object? itemReward = freezed,
    Object? selectedProductOptionsForCategory = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_MenuItemState(
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as RestaurantMenuItem,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemReward: itemReward == freezed
          ? _value.itemReward
          : itemReward // ignore: cast_nullable_to_non_nullable
              as int,
      selectedProductOptionsForCategory: selectedProductOptionsForCategory ==
              freezed
          ? _value.selectedProductOptionsForCategory
          : selectedProductOptionsForCategory // ignore: cast_nullable_to_non_nullable
              as Map<int, ProductOptions>,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_MenuItemState extends _MenuItemState {
  _$_MenuItemState(
      {required this.menuItem,
      required this.totalPrice,
      required this.itemReward,
      required this.selectedProductOptionsForCategory,
      required this.quantity})
      : super._();

  factory _$_MenuItemState.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemStateFromJson(json);

  @override
  final RestaurantMenuItem menuItem;
  @override
  final int totalPrice;
  @override
  final int itemReward;
  @override
  final Map<int, ProductOptions> selectedProductOptionsForCategory;
  @override
  final int quantity;

  @override
  String toString() {
    return 'MenuItemState(menuItem: $menuItem, totalPrice: $totalPrice, itemReward: $itemReward, selectedProductOptionsForCategory: $selectedProductOptionsForCategory, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuItemState &&
            const DeepCollectionEquality().equals(other.menuItem, menuItem) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality()
                .equals(other.itemReward, itemReward) &&
            const DeepCollectionEquality().equals(
                other.selectedProductOptionsForCategory,
                selectedProductOptionsForCategory) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(menuItem),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(itemReward),
      const DeepCollectionEquality().hash(selectedProductOptionsForCategory),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$MenuItemStateCopyWith<_MenuItemState> get copyWith =>
      __$MenuItemStateCopyWithImpl<_MenuItemState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuItemStateToJson(this);
  }
}

abstract class _MenuItemState extends MenuItemState {
  factory _MenuItemState(
      {required RestaurantMenuItem menuItem,
      required int totalPrice,
      required int itemReward,
      required Map<int, ProductOptions> selectedProductOptionsForCategory,
      required int quantity}) = _$_MenuItemState;
  _MenuItemState._() : super._();

  factory _MenuItemState.fromJson(Map<String, dynamic> json) =
      _$_MenuItemState.fromJson;

  @override
  RestaurantMenuItem get menuItem;
  @override
  int get totalPrice;
  @override
  int get itemReward;
  @override
  Map<int, ProductOptions> get selectedProductOptionsForCategory;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$MenuItemStateCopyWith<_MenuItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

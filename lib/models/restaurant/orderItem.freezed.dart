// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orderItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
class _$OrderItemTearOff {
  const _$OrderItemTearOff();

  _OrderItem call(
      {required MenuItem menuItem,
      required int totalItemPrice,
      required int itemQuantity,
      required Map<String, int> selectedOptions}) {
    return _OrderItem(
      menuItem: menuItem,
      totalItemPrice: totalItemPrice,
      itemQuantity: itemQuantity,
      selectedOptions: selectedOptions,
    );
  }

  OrderItem fromJson(Map<String, Object> json) {
    return OrderItem.fromJson(json);
  }
}

/// @nodoc
const $OrderItem = _$OrderItemTearOff();

/// @nodoc
mixin _$OrderItem {
  MenuItem get menuItem => throw _privateConstructorUsedError;
  int get totalItemPrice => throw _privateConstructorUsedError;
  int get itemQuantity => throw _privateConstructorUsedError;
  Map<String, int> get selectedOptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res>;
  $Res call(
      {MenuItem menuItem,
      int totalItemPrice,
      int itemQuantity,
      Map<String, int> selectedOptions});

  $MenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  final OrderItem _value;
  // ignore: unused_field
  final $Res Function(OrderItem) _then;

  @override
  $Res call({
    Object? menuItem = freezed,
    Object? totalItemPrice = freezed,
    Object? itemQuantity = freezed,
    Object? selectedOptions = freezed,
  }) {
    return _then(_value.copyWith(
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItem,
      totalItemPrice: totalItemPrice == freezed
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: itemQuantity == freezed
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptions: selectedOptions == freezed
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }

  @override
  $MenuItemCopyWith<$Res> get menuItem {
    return $MenuItemCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value));
    });
  }
}

/// @nodoc
abstract class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(
          _OrderItem value, $Res Function(_OrderItem) then) =
      __$OrderItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {MenuItem menuItem,
      int totalItemPrice,
      int itemQuantity,
      Map<String, int> selectedOptions});

  @override
  $MenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class __$OrderItemCopyWithImpl<$Res> extends _$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(_OrderItem _value, $Res Function(_OrderItem) _then)
      : super(_value, (v) => _then(v as _OrderItem));

  @override
  _OrderItem get _value => super._value as _OrderItem;

  @override
  $Res call({
    Object? menuItem = freezed,
    Object? totalItemPrice = freezed,
    Object? itemQuantity = freezed,
    Object? selectedOptions = freezed,
  }) {
    return _then(_OrderItem(
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItem,
      totalItemPrice: totalItemPrice == freezed
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: itemQuantity == freezed
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptions: selectedOptions == freezed
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OrderItem extends _OrderItem {
  _$_OrderItem(
      {required this.menuItem,
      required this.totalItemPrice,
      required this.itemQuantity,
      required this.selectedOptions})
      : super._();

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemFromJson(json);

  @override
  final MenuItem menuItem;
  @override
  final int totalItemPrice;
  @override
  final int itemQuantity;
  @override
  final Map<String, int> selectedOptions;

  @override
  String toString() {
    return 'OrderItem(menuItem: $menuItem, totalItemPrice: $totalItemPrice, itemQuantity: $itemQuantity, selectedOptions: $selectedOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderItem &&
            (identical(other.menuItem, menuItem) ||
                const DeepCollectionEquality()
                    .equals(other.menuItem, menuItem)) &&
            (identical(other.totalItemPrice, totalItemPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalItemPrice, totalItemPrice)) &&
            (identical(other.itemQuantity, itemQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.itemQuantity, itemQuantity)) &&
            (identical(other.selectedOptions, selectedOptions) ||
                const DeepCollectionEquality()
                    .equals(other.selectedOptions, selectedOptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(menuItem) ^
      const DeepCollectionEquality().hash(totalItemPrice) ^
      const DeepCollectionEquality().hash(itemQuantity) ^
      const DeepCollectionEquality().hash(selectedOptions);

  @JsonKey(ignore: true)
  @override
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemToJson(this);
  }
}

abstract class _OrderItem extends OrderItem {
  factory _OrderItem(
      {required MenuItem menuItem,
      required int totalItemPrice,
      required int itemQuantity,
      required Map<String, int> selectedOptions}) = _$_OrderItem;
  _OrderItem._() : super._();

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

  @override
  MenuItem get menuItem => throw _privateConstructorUsedError;
  @override
  int get totalItemPrice => throw _privateConstructorUsedError;
  @override
  int get itemQuantity => throw _privateConstructorUsedError;
  @override
  Map<String, int> get selectedOptions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productOptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOptions _$ProductOptionsFromJson(Map<String, dynamic> json) {
  return _ProductOptions.fromJson(json);
}

/// @nodoc
mixin _$ProductOptions {
  int get optionID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  bool get isAvaliable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOptionsCopyWith<ProductOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionsCopyWith<$Res> {
  factory $ProductOptionsCopyWith(
          ProductOptions value, $Res Function(ProductOptions) then) =
      _$ProductOptionsCopyWithImpl<$Res>;
  $Res call(
      {int optionID,
      String name,
      String description,
      int price,
      bool isAvaliable});
}

/// @nodoc
class _$ProductOptionsCopyWithImpl<$Res>
    implements $ProductOptionsCopyWith<$Res> {
  _$ProductOptionsCopyWithImpl(this._value, this._then);

  final ProductOptions _value;
  // ignore: unused_field
  final $Res Function(ProductOptions) _then;

  @override
  $Res call({
    Object? optionID = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isAvaliable = freezed,
  }) {
    return _then(_value.copyWith(
      optionID: optionID == freezed
          ? _value.optionID
          : optionID // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isAvaliable: isAvaliable == freezed
          ? _value.isAvaliable
          : isAvaliable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductOptionsCopyWith<$Res>
    implements $ProductOptionsCopyWith<$Res> {
  factory _$$_ProductOptionsCopyWith(
          _$_ProductOptions value, $Res Function(_$_ProductOptions) then) =
      __$$_ProductOptionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int optionID,
      String name,
      String description,
      int price,
      bool isAvaliable});
}

/// @nodoc
class __$$_ProductOptionsCopyWithImpl<$Res>
    extends _$ProductOptionsCopyWithImpl<$Res>
    implements _$$_ProductOptionsCopyWith<$Res> {
  __$$_ProductOptionsCopyWithImpl(
      _$_ProductOptions _value, $Res Function(_$_ProductOptions) _then)
      : super(_value, (v) => _then(v as _$_ProductOptions));

  @override
  _$_ProductOptions get _value => super._value as _$_ProductOptions;

  @override
  $Res call({
    Object? optionID = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isAvaliable = freezed,
  }) {
    return _then(_$_ProductOptions(
      optionID: optionID == freezed
          ? _value.optionID
          : optionID // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isAvaliable: isAvaliable == freezed
          ? _value.isAvaliable
          : isAvaliable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ProductOptions extends _ProductOptions {
  _$_ProductOptions(
      {required this.optionID,
      required this.name,
      required this.description,
      required this.price,
      required this.isAvaliable})
      : super._();

  factory _$_ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOptionsFromJson(json);

  @override
  final int optionID;
  @override
  final String name;
  @override
  final String description;
  @override
  final int price;
  @override
  final bool isAvaliable;

  @override
  String toString() {
    return 'ProductOptions(optionID: $optionID, name: $name, description: $description, price: $price, isAvaliable: $isAvaliable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductOptions &&
            const DeepCollectionEquality().equals(other.optionID, optionID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.isAvaliable, isAvaliable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(optionID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(isAvaliable));

  @JsonKey(ignore: true)
  @override
  _$$_ProductOptionsCopyWith<_$_ProductOptions> get copyWith =>
      __$$_ProductOptionsCopyWithImpl<_$_ProductOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOptionsToJson(this);
  }
}

abstract class _ProductOptions extends ProductOptions {
  factory _ProductOptions(
      {required final int optionID,
      required final String name,
      required final String description,
      required final int price,
      required final bool isAvaliable}) = _$_ProductOptions;
  _ProductOptions._() : super._();

  factory _ProductOptions.fromJson(Map<String, dynamic> json) =
      _$_ProductOptions.fromJson;

  @override
  int get optionID => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  bool get isAvaliable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductOptionsCopyWith<_$_ProductOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

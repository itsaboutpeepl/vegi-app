// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productOptionValue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOptionValue _$ProductOptionValueFromJson(Map<String, dynamic> json) {
  return _ProductOptions.fromJson(json);
}

/// @nodoc
mixin _$ProductOptionValue {
  @JsonKey(defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get priceModifier => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isAvaliable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOptionValueCopyWith<ProductOptionValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionValueCopyWith<$Res> {
  factory $ProductOptionValueCopyWith(
          ProductOptionValue value, $Res Function(ProductOptionValue) then) =
      _$ProductOptionValueCopyWithImpl<$Res, ProductOptionValue>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int id,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(defaultValue: 0) int priceModifier,
      @JsonKey(defaultValue: false) bool isAvaliable});
}

/// @nodoc
class _$ProductOptionValueCopyWithImpl<$Res, $Val extends ProductOptionValue>
    implements $ProductOptionValueCopyWith<$Res> {
  _$ProductOptionValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? priceModifier = null,
    Object? isAvaliable = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceModifier: null == priceModifier
          ? _value.priceModifier
          : priceModifier // ignore: cast_nullable_to_non_nullable
              as int,
      isAvaliable: null == isAvaliable
          ? _value.isAvaliable
          : isAvaliable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductOptionsCopyWith<$Res>
    implements $ProductOptionValueCopyWith<$Res> {
  factory _$$_ProductOptionsCopyWith(
          _$_ProductOptions value, $Res Function(_$_ProductOptions) then) =
      __$$_ProductOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int id,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(defaultValue: 0) int priceModifier,
      @JsonKey(defaultValue: false) bool isAvaliable});
}

/// @nodoc
class __$$_ProductOptionsCopyWithImpl<$Res>
    extends _$ProductOptionValueCopyWithImpl<$Res, _$_ProductOptions>
    implements _$$_ProductOptionsCopyWith<$Res> {
  __$$_ProductOptionsCopyWithImpl(
      _$_ProductOptions _value, $Res Function(_$_ProductOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? priceModifier = null,
    Object? isAvaliable = null,
  }) {
    return _then(_$_ProductOptions(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceModifier: null == priceModifier
          ? _value.priceModifier
          : priceModifier // ignore: cast_nullable_to_non_nullable
              as int,
      isAvaliable: null == isAvaliable
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
      {@JsonKey(defaultValue: 0) required this.id,
      @JsonKey(defaultValue: '') required this.name,
      @JsonKey(defaultValue: '') required this.description,
      @JsonKey(defaultValue: 0) required this.priceModifier,
      @JsonKey(defaultValue: false) required this.isAvaliable})
      : super._();

  factory _$_ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOptionsFromJson(json);

  @override
  @JsonKey(defaultValue: 0)
  final int id;
  @override
  @JsonKey(defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String description;
  @override
  @JsonKey(defaultValue: 0)
  final int priceModifier;
  @override
  @JsonKey(defaultValue: false)
  final bool isAvaliable;

  @override
  String toString() {
    return 'ProductOptionValue(id: $id, name: $name, description: $description, priceModifier: $priceModifier, isAvaliable: $isAvaliable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductOptions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priceModifier, priceModifier) ||
                other.priceModifier == priceModifier) &&
            (identical(other.isAvaliable, isAvaliable) ||
                other.isAvaliable == isAvaliable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, priceModifier, isAvaliable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductOptionsCopyWith<_$_ProductOptions> get copyWith =>
      __$$_ProductOptionsCopyWithImpl<_$_ProductOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOptionsToJson(
      this,
    );
  }
}

abstract class _ProductOptions extends ProductOptionValue {
  factory _ProductOptions(
          {@JsonKey(defaultValue: 0) required final int id,
          @JsonKey(defaultValue: '') required final String name,
          @JsonKey(defaultValue: '') required final String description,
          @JsonKey(defaultValue: 0) required final int priceModifier,
          @JsonKey(defaultValue: false) required final bool isAvaliable}) =
      _$_ProductOptions;
  _ProductOptions._() : super._();

  factory _ProductOptions.fromJson(Map<String, dynamic> json) =
      _$_ProductOptions.fromJson;

  @override
  @JsonKey(defaultValue: 0)
  int get id;
  @override
  @JsonKey(defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get description;
  @override
  @JsonKey(defaultValue: 0)
  int get priceModifier;
  @override
  @JsonKey(defaultValue: false)
  bool get isAvaliable;
  @override
  @JsonKey(ignore: true)
  _$$_ProductOptionsCopyWith<_$_ProductOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

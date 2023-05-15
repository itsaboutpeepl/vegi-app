// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productOption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) {
  return _ProductOption.fromJson(json);
}

/// @nodoc
mixin _$ProductOption {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonProductOptionValueList)
  List<ProductOptionValue> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOptionCopyWith<ProductOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionCopyWith<$Res> {
  factory $ProductOptionCopyWith(
          ProductOption value, $Res Function(ProductOption) then) =
      _$ProductOptionCopyWithImpl<$Res, ProductOption>;
  @useResult
  $Res call(
      {int id,
      String name,
      bool isRequired,
      @JsonKey(fromJson: fromJsonProductOptionValueList)
          List<ProductOptionValue> values});
}

/// @nodoc
class _$ProductOptionCopyWithImpl<$Res, $Val extends ProductOption>
    implements $ProductOptionCopyWith<$Res> {
  _$ProductOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isRequired = null,
    Object? values = null,
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
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductOptionCopyWith<$Res>
    implements $ProductOptionCopyWith<$Res> {
  factory _$$_ProductOptionCopyWith(
          _$_ProductOption value, $Res Function(_$_ProductOption) then) =
      __$$_ProductOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      bool isRequired,
      @JsonKey(fromJson: fromJsonProductOptionValueList)
          List<ProductOptionValue> values});
}

/// @nodoc
class __$$_ProductOptionCopyWithImpl<$Res>
    extends _$ProductOptionCopyWithImpl<$Res, _$_ProductOption>
    implements _$$_ProductOptionCopyWith<$Res> {
  __$$_ProductOptionCopyWithImpl(
      _$_ProductOption _value, $Res Function(_$_ProductOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isRequired = null,
    Object? values = null,
  }) {
    return _then(_$_ProductOption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ProductOptionValue>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ProductOption extends _ProductOption {
  _$_ProductOption(
      {required this.id,
      required this.name,
      required this.isRequired,
      @JsonKey(fromJson: fromJsonProductOptionValueList) required this.values})
      : super._();

  factory _$_ProductOption.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOptionFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final bool isRequired;
  @override
  @JsonKey(fromJson: fromJsonProductOptionValueList)
  final List<ProductOptionValue> values;

  @override
  String toString() {
    return 'ProductOption(id: $id, name: $name, isRequired: $isRequired, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isRequired,
      const DeepCollectionEquality().hash(values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductOptionCopyWith<_$_ProductOption> get copyWith =>
      __$$_ProductOptionCopyWithImpl<_$_ProductOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOptionToJson(
      this,
    );
  }
}

abstract class _ProductOption extends ProductOption {
  factory _ProductOption(
      {required final int id,
      required final String name,
      required final bool isRequired,
      @JsonKey(fromJson: fromJsonProductOptionValueList)
          required final List<ProductOptionValue> values}) = _$_ProductOption;
  _ProductOption._() : super._();

  factory _ProductOption.fromJson(Map<String, dynamic> json) =
      _$_ProductOption.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get isRequired;
  @override
  @JsonKey(fromJson: fromJsonProductOptionValueList)
  List<ProductOptionValue> get values;
  @override
  @JsonKey(ignore: true)
  _$$_ProductOptionCopyWith<_$_ProductOption> get copyWith =>
      throw _privateConstructorUsedError;
}

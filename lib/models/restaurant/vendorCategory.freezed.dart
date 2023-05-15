// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendorCategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VendorCategory _$VendorCategoryFromJson(Map<String, dynamic> json) {
  return _VendorCategory.fromJson(json);
}

/// @nodoc
mixin _$VendorCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCategoryCopyWith<VendorCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCategoryCopyWith<$Res> {
  factory $VendorCategoryCopyWith(
          VendorCategory value, $Res Function(VendorCategory) then) =
      _$VendorCategoryCopyWithImpl<$Res, VendorCategory>;
  @useResult
  $Res call({int id, String name, String? imageUrl});
}

/// @nodoc
class _$VendorCategoryCopyWithImpl<$Res, $Val extends VendorCategory>
    implements $VendorCategoryCopyWith<$Res> {
  _$VendorCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VendorCategoryCopyWith<$Res>
    implements $VendorCategoryCopyWith<$Res> {
  factory _$$_VendorCategoryCopyWith(
          _$_VendorCategory value, $Res Function(_$_VendorCategory) then) =
      __$$_VendorCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? imageUrl});
}

/// @nodoc
class __$$_VendorCategoryCopyWithImpl<$Res>
    extends _$VendorCategoryCopyWithImpl<$Res, _$_VendorCategory>
    implements _$$_VendorCategoryCopyWith<$Res> {
  __$$_VendorCategoryCopyWithImpl(
      _$_VendorCategory _value, $Res Function(_$_VendorCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_VendorCategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VendorCategory extends _VendorCategory {
  _$_VendorCategory({required this.id, required this.name, this.imageUrl})
      : super._();

  factory _$_VendorCategory.fromJson(Map<String, dynamic> json) =>
      _$$_VendorCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'VendorCategory(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VendorCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VendorCategoryCopyWith<_$_VendorCategory> get copyWith =>
      __$$_VendorCategoryCopyWithImpl<_$_VendorCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorCategoryToJson(
      this,
    );
  }
}

abstract class _VendorCategory extends VendorCategory {
  factory _VendorCategory(
      {required final int id,
      required final String name,
      final String? imageUrl}) = _$_VendorCategory;
  _VendorCategory._() : super._();

  factory _VendorCategory.fromJson(Map<String, dynamic> json) =
      _$_VendorCategory.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_VendorCategoryCopyWith<_$_VendorCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

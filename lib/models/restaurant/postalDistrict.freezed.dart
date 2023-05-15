// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postalDistrict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostalDistrict _$PostalDistrictFromJson(Map<String, dynamic> json) {
  return _PostalDistrict.fromJson(json);
}

/// @nodoc
mixin _$PostalDistrict {
  int get id => throw _privateConstructorUsedError;
  String get outcode => throw _privateConstructorUsedError;
  List<VendorDTO> get vendors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostalDistrictCopyWith<PostalDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostalDistrictCopyWith<$Res> {
  factory $PostalDistrictCopyWith(
          PostalDistrict value, $Res Function(PostalDistrict) then) =
      _$PostalDistrictCopyWithImpl<$Res, PostalDistrict>;
  @useResult
  $Res call({int id, String outcode, List<VendorDTO> vendors});
}

/// @nodoc
class _$PostalDistrictCopyWithImpl<$Res, $Val extends PostalDistrict>
    implements $PostalDistrictCopyWith<$Res> {
  _$PostalDistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outcode = null,
    Object? vendors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      outcode: null == outcode
          ? _value.outcode
          : outcode // ignore: cast_nullable_to_non_nullable
              as String,
      vendors: null == vendors
          ? _value.vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<VendorDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostalDistrictCopyWith<$Res>
    implements $PostalDistrictCopyWith<$Res> {
  factory _$$_PostalDistrictCopyWith(
          _$_PostalDistrict value, $Res Function(_$_PostalDistrict) then) =
      __$$_PostalDistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String outcode, List<VendorDTO> vendors});
}

/// @nodoc
class __$$_PostalDistrictCopyWithImpl<$Res>
    extends _$PostalDistrictCopyWithImpl<$Res, _$_PostalDistrict>
    implements _$$_PostalDistrictCopyWith<$Res> {
  __$$_PostalDistrictCopyWithImpl(
      _$_PostalDistrict _value, $Res Function(_$_PostalDistrict) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outcode = null,
    Object? vendors = null,
  }) {
    return _then(_$_PostalDistrict(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      outcode: null == outcode
          ? _value.outcode
          : outcode // ignore: cast_nullable_to_non_nullable
              as String,
      vendors: null == vendors
          ? _value.vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<VendorDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_PostalDistrict extends _PostalDistrict {
  _$_PostalDistrict(
      {required this.id, required this.outcode, this.vendors = const []})
      : super._();

  factory _$_PostalDistrict.fromJson(Map<String, dynamic> json) =>
      _$$_PostalDistrictFromJson(json);

  @override
  final int id;
  @override
  final String outcode;
  @override
  @JsonKey()
  final List<VendorDTO> vendors;

  @override
  String toString() {
    return 'PostalDistrict(id: $id, outcode: $outcode, vendors: $vendors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostalDistrict &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.outcode, outcode) || other.outcode == outcode) &&
            const DeepCollectionEquality().equals(other.vendors, vendors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, outcode, const DeepCollectionEquality().hash(vendors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostalDistrictCopyWith<_$_PostalDistrict> get copyWith =>
      __$$_PostalDistrictCopyWithImpl<_$_PostalDistrict>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostalDistrictToJson(
      this,
    );
  }
}

abstract class _PostalDistrict extends PostalDistrict {
  factory _PostalDistrict(
      {required final int id,
      required final String outcode,
      final List<VendorDTO> vendors}) = _$_PostalDistrict;
  _PostalDistrict._() : super._();

  factory _PostalDistrict.fromJson(Map<String, dynamic> json) =
      _$_PostalDistrict.fromJson;

  @override
  int get id;
  @override
  String get outcode;
  @override
  List<VendorDTO> get vendors;
  @override
  @JsonKey(ignore: true)
  _$$_PostalDistrictCopyWith<_$_PostalDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

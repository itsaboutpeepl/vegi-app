// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postCodeDetail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostCodeDetail _$PostCodeDetailFromJson(Map<String, dynamic> json) {
  return _PostCodeDetail.fromJson(json);
}

/// @nodoc
mixin _$PostCodeDetail {
  String get postcode => throw _privateConstructorUsedError;
  int get quality => throw _privateConstructorUsedError;
  String get outcode => throw _privateConstructorUsedError;
  String get incode => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCodeDetailCopyWith<PostCodeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCodeDetailCopyWith<$Res> {
  factory $PostCodeDetailCopyWith(
          PostCodeDetail value, $Res Function(PostCodeDetail) then) =
      _$PostCodeDetailCopyWithImpl<$Res, PostCodeDetail>;
  @useResult
  $Res call(
      {String postcode,
      int quality,
      String outcode,
      String incode,
      double distance,
      double latitude,
      double longitude});
}

/// @nodoc
class _$PostCodeDetailCopyWithImpl<$Res, $Val extends PostCodeDetail>
    implements $PostCodeDetailCopyWith<$Res> {
  _$PostCodeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postcode = null,
    Object? quality = null,
    Object? outcode = null,
    Object? incode = null,
    Object? distance = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
      outcode: null == outcode
          ? _value.outcode
          : outcode // ignore: cast_nullable_to_non_nullable
              as String,
      incode: null == incode
          ? _value.incode
          : incode // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCodeDetailCopyWith<$Res>
    implements $PostCodeDetailCopyWith<$Res> {
  factory _$$_PostCodeDetailCopyWith(
          _$_PostCodeDetail value, $Res Function(_$_PostCodeDetail) then) =
      __$$_PostCodeDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postcode,
      int quality,
      String outcode,
      String incode,
      double distance,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$_PostCodeDetailCopyWithImpl<$Res>
    extends _$PostCodeDetailCopyWithImpl<$Res, _$_PostCodeDetail>
    implements _$$_PostCodeDetailCopyWith<$Res> {
  __$$_PostCodeDetailCopyWithImpl(
      _$_PostCodeDetail _value, $Res Function(_$_PostCodeDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postcode = null,
    Object? quality = null,
    Object? outcode = null,
    Object? incode = null,
    Object? distance = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_PostCodeDetail(
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
      outcode: null == outcode
          ? _value.outcode
          : outcode // ignore: cast_nullable_to_non_nullable
              as String,
      incode: null == incode
          ? _value.incode
          : incode // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_PostCodeDetail extends _PostCodeDetail {
  _$_PostCodeDetail(
      {required this.postcode,
      required this.quality,
      required this.outcode,
      required this.incode,
      required this.distance,
      required this.latitude,
      required this.longitude})
      : super._();

  factory _$_PostCodeDetail.fromJson(Map<String, dynamic> json) =>
      _$$_PostCodeDetailFromJson(json);

  @override
  final String postcode;
  @override
  final int quality;
  @override
  final String outcode;
  @override
  final String incode;
  @override
  final double distance;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'PostCodeDetail(postcode: $postcode, quality: $quality, outcode: $outcode, incode: $incode, distance: $distance, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCodeDetail &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.outcode, outcode) || other.outcode == outcode) &&
            (identical(other.incode, incode) || other.incode == incode) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postcode, quality, outcode,
      incode, distance, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCodeDetailCopyWith<_$_PostCodeDetail> get copyWith =>
      __$$_PostCodeDetailCopyWithImpl<_$_PostCodeDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostCodeDetailToJson(
      this,
    );
  }
}

abstract class _PostCodeDetail extends PostCodeDetail {
  factory _PostCodeDetail(
      {required final String postcode,
      required final int quality,
      required final String outcode,
      required final String incode,
      required final double distance,
      required final double latitude,
      required final double longitude}) = _$_PostCodeDetail;
  _PostCodeDetail._() : super._();

  factory _PostCodeDetail.fromJson(Map<String, dynamic> json) =
      _$_PostCodeDetail.fromJson;

  @override
  String get postcode;
  @override
  int get quality;
  @override
  String get outcode;
  @override
  String get incode;
  @override
  double get distance;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_PostCodeDetailCopyWith<_$_PostCodeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

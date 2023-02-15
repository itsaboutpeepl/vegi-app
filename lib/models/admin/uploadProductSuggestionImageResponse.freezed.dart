// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'uploadProductSuggestionImageResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadProductSuggestionImageResponse
    _$UploadProductSuggestionImageResponseFromJson(Map<String, dynamic> json) {
  return _UploadProductSuggestionImageResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadProductSuggestionImageResponse {
  String get url => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadProductSuggestionImageResponseCopyWith<
          UploadProductSuggestionImageResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProductSuggestionImageResponseCopyWith<$Res> {
  factory $UploadProductSuggestionImageResponseCopyWith(
          UploadProductSuggestionImageResponse value,
          $Res Function(UploadProductSuggestionImageResponse) then) =
      _$UploadProductSuggestionImageResponseCopyWithImpl<$Res,
          UploadProductSuggestionImageResponse>;
  @useResult
  $Res call({String url, String uid});
}

/// @nodoc
class _$UploadProductSuggestionImageResponseCopyWithImpl<$Res,
        $Val extends UploadProductSuggestionImageResponse>
    implements $UploadProductSuggestionImageResponseCopyWith<$Res> {
  _$UploadProductSuggestionImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadProductSuggestionImageResponseCopyWith<$Res>
    implements $UploadProductSuggestionImageResponseCopyWith<$Res> {
  factory _$$_UploadProductSuggestionImageResponseCopyWith(
          _$_UploadProductSuggestionImageResponse value,
          $Res Function(_$_UploadProductSuggestionImageResponse) then) =
      __$$_UploadProductSuggestionImageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String uid});
}

/// @nodoc
class __$$_UploadProductSuggestionImageResponseCopyWithImpl<$Res>
    extends _$UploadProductSuggestionImageResponseCopyWithImpl<$Res,
        _$_UploadProductSuggestionImageResponse>
    implements _$$_UploadProductSuggestionImageResponseCopyWith<$Res> {
  __$$_UploadProductSuggestionImageResponseCopyWithImpl(
      _$_UploadProductSuggestionImageResponse _value,
      $Res Function(_$_UploadProductSuggestionImageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? uid = null,
  }) {
    return _then(_$_UploadProductSuggestionImageResponse(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UploadProductSuggestionImageResponse
    extends _UploadProductSuggestionImageResponse {
  _$_UploadProductSuggestionImageResponse(
      {required this.url, required this.uid})
      : super._();

  factory _$_UploadProductSuggestionImageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_UploadProductSuggestionImageResponseFromJson(json);

  @override
  final String url;
  @override
  final String uid;

  @override
  String toString() {
    return 'UploadProductSuggestionImageResponse(url: $url, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadProductSuggestionImageResponse &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadProductSuggestionImageResponseCopyWith<
          _$_UploadProductSuggestionImageResponse>
      get copyWith => __$$_UploadProductSuggestionImageResponseCopyWithImpl<
          _$_UploadProductSuggestionImageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadProductSuggestionImageResponseToJson(
      this,
    );
  }
}

abstract class _UploadProductSuggestionImageResponse
    extends UploadProductSuggestionImageResponse {
  factory _UploadProductSuggestionImageResponse(
      {required final String url,
      required final String uid}) = _$_UploadProductSuggestionImageResponse;
  _UploadProductSuggestionImageResponse._() : super._();

  factory _UploadProductSuggestionImageResponse.fromJson(
          Map<String, dynamic> json) =
      _$_UploadProductSuggestionImageResponse.fromJson;

  @override
  String get url;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_UploadProductSuggestionImageResponseCopyWith<
          _$_UploadProductSuggestionImageResponse>
      get copyWith => throw _privateConstructorUsedError;
}

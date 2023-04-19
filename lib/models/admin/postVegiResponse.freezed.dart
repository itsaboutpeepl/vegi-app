// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postVegiResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostVegiResponse _$PostVegiResponseFromJson(Map<String, dynamic> json) {
  return _PostVegiResponse.fromJson(json);
}

/// @nodoc
mixin _$PostVegiResponse {
  String get url => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostVegiResponseCopyWith<PostVegiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostVegiResponseCopyWith<$Res> {
  factory $PostVegiResponseCopyWith(
          PostVegiResponse value, $Res Function(PostVegiResponse) then) =
      _$PostVegiResponseCopyWithImpl<$Res, PostVegiResponse>;
  @useResult
  $Res call({String url, String uid});
}

/// @nodoc
class _$PostVegiResponseCopyWithImpl<$Res, $Val extends PostVegiResponse>
    implements $PostVegiResponseCopyWith<$Res> {
  _$PostVegiResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_PostVegiResponseCopyWith<$Res>
    implements $PostVegiResponseCopyWith<$Res> {
  factory _$$_PostVegiResponseCopyWith(
          _$_PostVegiResponse value, $Res Function(_$_PostVegiResponse) then) =
      __$$_PostVegiResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String uid});
}

/// @nodoc
class __$$_PostVegiResponseCopyWithImpl<$Res>
    extends _$PostVegiResponseCopyWithImpl<$Res, _$_PostVegiResponse>
    implements _$$_PostVegiResponseCopyWith<$Res> {
  __$$_PostVegiResponseCopyWithImpl(
      _$_PostVegiResponse _value, $Res Function(_$_PostVegiResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? uid = null,
  }) {
    return _then(_$_PostVegiResponse(
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
class _$_PostVegiResponse extends _PostVegiResponse {
  _$_PostVegiResponse({required this.url, required this.uid}) : super._();

  factory _$_PostVegiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostVegiResponseFromJson(json);

  @override
  final String url;
  @override
  final String uid;

  @override
  String toString() {
    return 'PostVegiResponse(url: $url, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostVegiResponse &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostVegiResponseCopyWith<_$_PostVegiResponse> get copyWith =>
      __$$_PostVegiResponseCopyWithImpl<_$_PostVegiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostVegiResponseToJson(
      this,
    );
  }
}

abstract class _PostVegiResponse extends PostVegiResponse {
  factory _PostVegiResponse(
      {required final String url,
      required final String uid}) = _$_PostVegiResponse;
  _PostVegiResponse._() : super._();

  factory _PostVegiResponse.fromJson(Map<String, dynamic> json) =
      _$_PostVegiResponse.fromJson;

  @override
  String get url;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_PostVegiResponseCopyWith<_$_PostVegiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

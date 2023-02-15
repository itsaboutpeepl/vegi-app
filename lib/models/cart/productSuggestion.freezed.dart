// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productSuggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductSuggestion _$ProductSuggestionFromJson(Map<String, dynamic> json) {
  return _ProductSuggestion.fromJson(json);
}

/// @nodoc
mixin _$ProductSuggestion {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get store => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String get additionalInformation => throw _privateConstructorUsedError;
  Map<ProductSuggestionImageType, UploadProductSuggestionImageResponse>
      get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductSuggestionCopyWith<ProductSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSuggestionCopyWith<$Res> {
  factory $ProductSuggestionCopyWith(
          ProductSuggestion value, $Res Function(ProductSuggestion) then) =
      _$ProductSuggestionCopyWithImpl<$Res, ProductSuggestion>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String store,
      String qrCode,
      String additionalInformation,
      Map<ProductSuggestionImageType, UploadProductSuggestionImageResponse>
          images});
}

/// @nodoc
class _$ProductSuggestionCopyWithImpl<$Res, $Val extends ProductSuggestion>
    implements $ProductSuggestionCopyWith<$Res> {
  _$ProductSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? store = null,
    Object? qrCode = null,
    Object? additionalInformation = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInformation: null == additionalInformation
          ? _value.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<ProductSuggestionImageType,
                  UploadProductSuggestionImageResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductSuggestionCopyWith<$Res>
    implements $ProductSuggestionCopyWith<$Res> {
  factory _$$_ProductSuggestionCopyWith(_$_ProductSuggestion value,
          $Res Function(_$_ProductSuggestion) then) =
      __$$_ProductSuggestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String store,
      String qrCode,
      String additionalInformation,
      Map<ProductSuggestionImageType, UploadProductSuggestionImageResponse>
          images});
}

/// @nodoc
class __$$_ProductSuggestionCopyWithImpl<$Res>
    extends _$ProductSuggestionCopyWithImpl<$Res, _$_ProductSuggestion>
    implements _$$_ProductSuggestionCopyWith<$Res> {
  __$$_ProductSuggestionCopyWithImpl(
      _$_ProductSuggestion _value, $Res Function(_$_ProductSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? store = null,
    Object? qrCode = null,
    Object? additionalInformation = null,
    Object? images = null,
  }) {
    return _then(_$_ProductSuggestion(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInformation: null == additionalInformation
          ? _value.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<ProductSuggestionImageType,
                  UploadProductSuggestionImageResponse>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ProductSuggestion extends _ProductSuggestion {
  _$_ProductSuggestion(
      {required this.uid,
      required this.name,
      required this.store,
      required this.qrCode,
      required this.additionalInformation,
      required this.images})
      : super._();

  factory _$_ProductSuggestion.fromJson(Map<String, dynamic> json) =>
      _$$_ProductSuggestionFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String store;
  @override
  final String qrCode;
  @override
  final String additionalInformation;
  @override
  final Map<ProductSuggestionImageType, UploadProductSuggestionImageResponse>
      images;

  @override
  String toString() {
    return 'ProductSuggestion(uid: $uid, name: $name, store: $store, qrCode: $qrCode, additionalInformation: $additionalInformation, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSuggestion &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.additionalInformation, additionalInformation) ||
                other.additionalInformation == additionalInformation) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, store, qrCode,
      additionalInformation, const DeepCollectionEquality().hash(images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductSuggestionCopyWith<_$_ProductSuggestion> get copyWith =>
      __$$_ProductSuggestionCopyWithImpl<_$_ProductSuggestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductSuggestionToJson(
      this,
    );
  }
}

abstract class _ProductSuggestion extends ProductSuggestion {
  factory _ProductSuggestion(
      {required final String uid,
      required final String name,
      required final String store,
      required final String qrCode,
      required final String additionalInformation,
      required final Map<ProductSuggestionImageType,
              UploadProductSuggestionImageResponse>
          images}) = _$_ProductSuggestion;
  _ProductSuggestion._() : super._();

  factory _ProductSuggestion.fromJson(Map<String, dynamic> json) =
      _$_ProductSuggestion.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get store;
  @override
  String get qrCode;
  @override
  String get additionalInformation;
  @override
  Map<ProductSuggestionImageType, UploadProductSuggestionImageResponse>
      get images;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSuggestionCopyWith<_$_ProductSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

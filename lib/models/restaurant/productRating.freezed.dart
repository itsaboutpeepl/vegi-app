// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'productRating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductRating _$ProductRatingFromJson(Map<String, dynamic> json) {
  return _ProductRating.fromJson(json);
}

/// @nodoc
mixin _$ProductRating {
  int get id => throw _privateConstructorUsedError;
  double get createdAt => throw _privateConstructorUsedError;
  String get productPublicId => throw _privateConstructorUsedError;
  num get rating => throw _privateConstructorUsedError;
  Object get evidence => throw _privateConstructorUsedError;
  DateTime get calculatedOn => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  List<ESCExplanation> get explanations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductRatingCopyWith<ProductRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRatingCopyWith<$Res> {
  factory $ProductRatingCopyWith(
          ProductRating value, $Res Function(ProductRating) then) =
      _$ProductRatingCopyWithImpl<$Res, ProductRating>;
  @useResult
  $Res call(
      {int id,
      double createdAt,
      String productPublicId,
      num rating,
      Object evidence,
      DateTime calculatedOn,
      Product product,
      List<ESCExplanation> explanations});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductRatingCopyWithImpl<$Res, $Val extends ProductRating>
    implements $ProductRatingCopyWith<$Res> {
  _$ProductRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? productPublicId = null,
    Object? rating = null,
    Object? evidence = null,
    Object? calculatedOn = null,
    Object? product = null,
    Object? explanations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double,
      productPublicId: null == productPublicId
          ? _value.productPublicId
          : productPublicId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      evidence: null == evidence ? _value.evidence : evidence,
      calculatedOn: null == calculatedOn
          ? _value.calculatedOn
          : calculatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      explanations: null == explanations
          ? _value.explanations
          : explanations // ignore: cast_nullable_to_non_nullable
              as List<ESCExplanation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductRatingCopyWith<$Res>
    implements $ProductRatingCopyWith<$Res> {
  factory _$$_ProductRatingCopyWith(
          _$_ProductRating value, $Res Function(_$_ProductRating) then) =
      __$$_ProductRatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double createdAt,
      String productPublicId,
      num rating,
      Object evidence,
      DateTime calculatedOn,
      Product product,
      List<ESCExplanation> explanations});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_ProductRatingCopyWithImpl<$Res>
    extends _$ProductRatingCopyWithImpl<$Res, _$_ProductRating>
    implements _$$_ProductRatingCopyWith<$Res> {
  __$$_ProductRatingCopyWithImpl(
      _$_ProductRating _value, $Res Function(_$_ProductRating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? productPublicId = null,
    Object? rating = null,
    Object? evidence = null,
    Object? calculatedOn = null,
    Object? product = null,
    Object? explanations = null,
  }) {
    return _then(_$_ProductRating(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double,
      productPublicId: null == productPublicId
          ? _value.productPublicId
          : productPublicId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      evidence: null == evidence ? _value.evidence : evidence,
      calculatedOn: null == calculatedOn
          ? _value.calculatedOn
          : calculatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      explanations: null == explanations
          ? _value.explanations
          : explanations // ignore: cast_nullable_to_non_nullable
              as List<ESCExplanation>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ProductRating extends _ProductRating {
  _$_ProductRating(
      {required this.id,
      required this.createdAt,
      required this.productPublicId,
      required this.rating,
      this.evidence = const {},
      required this.calculatedOn,
      required this.product,
      this.explanations = const []})
      : super._();

  factory _$_ProductRating.fromJson(Map<String, dynamic> json) =>
      _$$_ProductRatingFromJson(json);

  @override
  final int id;
  @override
  final double createdAt;
  @override
  final String productPublicId;
  @override
  final num rating;
  @override
  @JsonKey()
  final Object evidence;
  @override
  final DateTime calculatedOn;
  @override
  final Product product;
  @override
  @JsonKey()
  final List<ESCExplanation> explanations;

  @override
  String toString() {
    return 'ProductRating(id: $id, createdAt: $createdAt, productPublicId: $productPublicId, rating: $rating, evidence: $evidence, calculatedOn: $calculatedOn, product: $product, explanations: $explanations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductRating &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.productPublicId, productPublicId) ||
                other.productPublicId == productPublicId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other.evidence, evidence) &&
            (identical(other.calculatedOn, calculatedOn) ||
                other.calculatedOn == calculatedOn) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other.explanations, explanations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      productPublicId,
      rating,
      const DeepCollectionEquality().hash(evidence),
      calculatedOn,
      product,
      const DeepCollectionEquality().hash(explanations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductRatingCopyWith<_$_ProductRating> get copyWith =>
      __$$_ProductRatingCopyWithImpl<_$_ProductRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductRatingToJson(
      this,
    );
  }
}

abstract class _ProductRating extends ProductRating {
  factory _ProductRating(
      {required final int id,
      required final double createdAt,
      required final String productPublicId,
      required final num rating,
      final Object evidence,
      required final DateTime calculatedOn,
      required final Product product,
      final List<ESCExplanation> explanations}) = _$_ProductRating;
  _ProductRating._() : super._();

  factory _ProductRating.fromJson(Map<String, dynamic> json) =
      _$_ProductRating.fromJson;

  @override
  int get id;
  @override
  double get createdAt;
  @override
  String get productPublicId;
  @override
  num get rating;
  @override
  Object get evidence;
  @override
  DateTime get calculatedOn;
  @override
  Product get product;
  @override
  List<ESCExplanation> get explanations;
  @override
  @JsonKey(ignore: true)
  _$$_ProductRatingCopyWith<_$_ProductRating> get copyWith =>
      throw _privateConstructorUsedError;
}

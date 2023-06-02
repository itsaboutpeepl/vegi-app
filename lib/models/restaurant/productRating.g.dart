// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productRating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductRating _$$_ProductRatingFromJson(Map<String, dynamic> json) =>
    _$_ProductRating(
      id: json['id'] as int,
      createdAt: (json['createdAt'] as num).toDouble(),
      productPublicId: json['productPublicId'] as String,
      rating: json['rating'] as num,
      evidence: json['evidence'] as Object? ?? const {},
      calculatedOn: DateTime.parse(json['calculatedOn'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      explanations: (json['explanations'] as List<dynamic>?)
              ?.map((e) => ESCExplanation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProductRatingToJson(_$_ProductRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'productPublicId': instance.productPublicId,
      'rating': instance.rating,
      'evidence': instance.evidence,
      'calculatedOn': instance.calculatedOn.toIso8601String(),
      'product': instance.product.toJson(),
      'explanations': instance.explanations.map((e) => e.toJson()).toList(),
    };
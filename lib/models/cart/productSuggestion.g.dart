// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productSuggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductSuggestion _$$_ProductSuggestionFromJson(Map<String, dynamic> json) =>
    _$_ProductSuggestion(
      uid: json['uid'] as String,
      name: json['name'] as String,
      store: json['store'] as String,
      qrCode: json['qrCode'] as String,
      additionalInformation: json['additionalInformation'] as String,
      images: (json['images'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$ProductSuggestionImageTypeEnumMap, k),
            UploadProductSuggestionImageResponse.fromJson(
                e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ProductSuggestionToJson(
        _$_ProductSuggestion instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'store': instance.store,
      'qrCode': instance.qrCode,
      'additionalInformation': instance.additionalInformation,
      'images': instance.images.map((k, e) =>
          MapEntry(_$ProductSuggestionImageTypeEnumMap[k]!, e.toJson())),
    };

const _$ProductSuggestionImageTypeEnumMap = {
  ProductSuggestionImageType.barCode: 'barCode',
  ProductSuggestionImageType.frontOfPackage: 'frontOfPackage',
  ProductSuggestionImageType.ingredientInfo: 'ingredientInfo',
  ProductSuggestionImageType.nutritionalInfo: 'nutritionalInfo',
  ProductSuggestionImageType.teachUsMore: 'teachUsMore',
};

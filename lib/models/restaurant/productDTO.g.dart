// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDTO _$$_ProductDTOFromJson(Map<String, dynamic> json) =>
    _$_ProductDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      shortDescription: json['shortDescription'] as String? ?? '',
      basePrice: json['basePrice'] as int,
      imageURL: json['imageURL'] as String? ?? '',
      isAvailable: json['isAvailable'] as bool,
      priority: json['priority'] as int,
      isFeatured: json['isFeatured'] as bool,
      status: $enumDecode(_$ProductDiscontinuedStatusEnumMap, json['status']),
      ingredients: json['ingredients'] as String?,
      vendorInternalId: json['vendorInternalId'] as String? ?? '',
      stockCount: json['stockCount'] as int? ?? 0,
      stockUnitsPerProduct: json['stockUnitsPerProduct'] as num? ?? 1,
      sizeInnerUnitValue: json['sizeInnerUnitValue'] as num? ?? 1,
      sizeInnerUnitType: json['sizeInnerUnitType'] as String? ?? '',
      productBarCode: json['productBarCode'] as String,
      supplier: json['supplier'] as String? ?? '',
      brandName: json['brandName'] as String? ?? '',
      taxGroup: json['taxGroup'] as String? ?? '',
      vendor: fromJsonVendorDTO(json['vendor']),
      category: fromJsonProductCategory(json['category']),
      options: json['options'] == null
          ? const []
          : fromJsonProductOptionList(json['options']),
      rating: json['rating'] == null
          ? null
          : ESCRating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductDTOToJson(_$_ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'basePrice': instance.basePrice,
      'imageURL': instance.imageURL,
      'isAvailable': instance.isAvailable,
      'priority': instance.priority,
      'isFeatured': instance.isFeatured,
      'status': _$ProductDiscontinuedStatusEnumMap[instance.status]!,
      'ingredients': instance.ingredients,
      'vendorInternalId': instance.vendorInternalId,
      'stockCount': instance.stockCount,
      'stockUnitsPerProduct': instance.stockUnitsPerProduct,
      'sizeInnerUnitValue': instance.sizeInnerUnitValue,
      'sizeInnerUnitType': instance.sizeInnerUnitType,
      'productBarCode': instance.productBarCode,
      'supplier': instance.supplier,
      'brandName': instance.brandName,
      'taxGroup': instance.taxGroup,
      'vendor': instance.vendor?.toJson(),
      'category': instance.category?.toJson(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'rating': instance.rating?.toJson(),
    };

const _$ProductDiscontinuedStatusEnumMap = {
  ProductDiscontinuedStatus.active: 'active',
  ProductDiscontinuedStatus.inactive: 'inactive',
};

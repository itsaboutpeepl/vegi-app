// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postalDistrict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostalDistrict _$$_PostalDistrictFromJson(Map<String, dynamic> json) =>
    _$_PostalDistrict(
      id: json['id'] as int,
      outcode: json['outcode'] as String,
      vendors: (json['vendors'] as List<dynamic>?)
              ?.map((e) => VendorDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PostalDistrictToJson(_$_PostalDistrict instance) =>
    <String, dynamic>{
      'id': instance.id,
      'outcode': instance.outcode,
      'vendors': instance.vendors.map((e) => e.toJson()).toList(),
    };

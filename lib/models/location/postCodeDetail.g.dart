// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postCodeDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostCodeDetail _$$_PostCodeDetailFromJson(Map<String, dynamic> json) =>
    _$_PostCodeDetail(
      postcode: json['postcode'] as String,
      quality: json['quality'] as int,
      outcode: json['outcode'] as String,
      incode: json['incode'] as String,
      distance: (json['distance'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PostCodeDetailToJson(_$_PostCodeDetail instance) =>
    <String, dynamic>{
      'postcode': instance.postcode,
      'quality': instance.quality,
      'outcode': instance.outcode,
      'incode': instance.incode,
      'distance': instance.distance,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

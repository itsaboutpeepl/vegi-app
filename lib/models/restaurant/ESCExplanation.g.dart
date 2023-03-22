// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ESCExplanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ESCExplanation _$$_ESCExplanationFromJson(Map<String, dynamic> json) =>
    _$_ESCExplanation(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      measure: json['measure'] as num,
      escrating: ESCRating.fromJson(json['escrating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ESCExplanationToJson(_$_ESCExplanation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'measure': instance.measure,
      'escrating': instance.escrating.toJson(),
    };

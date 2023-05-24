// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errorDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorDetails<T> _$$_ErrorDetailsFromJson<T extends Enum>(
        Map<String, dynamic> json) =>
    _$_ErrorDetails<T>(
      title: json['title'] as String,
      message: json['message'] as String,
      code: codeFromJson(json['code']),
    );

Map<String, dynamic> _$$_ErrorDetailsToJson<T extends Enum>(
        _$_ErrorDetails<T> instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'code': codeToJson(instance.code),
    };

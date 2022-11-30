// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveyQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyQuestion _$$_SurveyQuestionFromJson(Map<String, dynamic> json) =>
    _$_SurveyQuestion(
      question: json['question'] as String,
      responseType:
          $enumDecode(_$SurveyResponseTypeEnumMap, json['responseType']),
    );

Map<String, dynamic> _$$_SurveyQuestionToJson(_$_SurveyQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'responseType': _$SurveyResponseTypeEnumMap[instance.responseType]!,
    };

const _$SurveyResponseTypeEnumMap = {
  SurveyResponseType.boolean: 'boolean',
  SurveyResponseType.string: 'string',
  SurveyResponseType.multiline: 'multiline',
  SurveyResponseType.number: 'number',
};

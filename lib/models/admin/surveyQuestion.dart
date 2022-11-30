import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';

part 'surveyQuestion.freezed.dart';
part 'surveyQuestion.g.dart';

@Freezed()
class SurveyQuestion with _$SurveyQuestion {
  @JsonSerializable()
  factory SurveyQuestion({
    required String question,
    @JsonEnum() required SurveyResponseType responseType,
  }) = _SurveyQuestion;

  const SurveyQuestion._();

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionFromJson(json);
}

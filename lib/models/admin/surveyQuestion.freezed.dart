// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'surveyQuestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyQuestion _$SurveyQuestionFromJson(Map<String, dynamic> json) {
  return _SurveyQuestion.fromJson(json);
}

/// @nodoc
mixin _$SurveyQuestion {
  String get question => throw _privateConstructorUsedError;
  @JsonEnum()
  SurveyResponseType get responseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyQuestionCopyWith<SurveyQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyQuestionCopyWith<$Res> {
  factory $SurveyQuestionCopyWith(
          SurveyQuestion value, $Res Function(SurveyQuestion) then) =
      _$SurveyQuestionCopyWithImpl<$Res, SurveyQuestion>;
  @useResult
  $Res call({String question, @JsonEnum() SurveyResponseType responseType});
}

/// @nodoc
class _$SurveyQuestionCopyWithImpl<$Res, $Val extends SurveyQuestion>
    implements $SurveyQuestionCopyWith<$Res> {
  _$SurveyQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? responseType = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseType: null == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as SurveyResponseType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyQuestionCopyWith<$Res>
    implements $SurveyQuestionCopyWith<$Res> {
  factory _$$_SurveyQuestionCopyWith(
          _$_SurveyQuestion value, $Res Function(_$_SurveyQuestion) then) =
      __$$_SurveyQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, @JsonEnum() SurveyResponseType responseType});
}

/// @nodoc
class __$$_SurveyQuestionCopyWithImpl<$Res>
    extends _$SurveyQuestionCopyWithImpl<$Res, _$_SurveyQuestion>
    implements _$$_SurveyQuestionCopyWith<$Res> {
  __$$_SurveyQuestionCopyWithImpl(
      _$_SurveyQuestion _value, $Res Function(_$_SurveyQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? responseType = null,
  }) {
    return _then(_$_SurveyQuestion(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseType: null == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as SurveyResponseType,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SurveyQuestion extends _SurveyQuestion {
  _$_SurveyQuestion(
      {required this.question, @JsonEnum() required this.responseType})
      : super._();

  factory _$_SurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyQuestionFromJson(json);

  @override
  final String question;
  @override
  @JsonEnum()
  final SurveyResponseType responseType;

  @override
  String toString() {
    return 'SurveyQuestion(question: $question, responseType: $responseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyQuestion &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, responseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyQuestionCopyWith<_$_SurveyQuestion> get copyWith =>
      __$$_SurveyQuestionCopyWithImpl<_$_SurveyQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyQuestionToJson(
      this,
    );
  }
}

abstract class _SurveyQuestion extends SurveyQuestion {
  factory _SurveyQuestion(
          {required final String question,
          @JsonEnum() required final SurveyResponseType responseType}) =
      _$_SurveyQuestion;
  _SurveyQuestion._() : super._();

  factory _SurveyQuestion.fromJson(Map<String, dynamic> json) =
      _$_SurveyQuestion.fromJson;

  @override
  String get question;
  @override
  @JsonEnum()
  SurveyResponseType get responseType;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyQuestionCopyWith<_$_SurveyQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

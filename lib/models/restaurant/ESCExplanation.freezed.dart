// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ESCExplanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ESCExplanation _$ESCExplanationFromJson(Map<String, dynamic> json) {
  return _ESCExplanation.fromJson(json);
}

/// @nodoc
mixin _$ESCExplanation {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  num get measure => throw _privateConstructorUsedError;
  ESCRating get escrating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ESCExplanationCopyWith<ESCExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ESCExplanationCopyWith<$Res> {
  factory $ESCExplanationCopyWith(
          ESCExplanation value, $Res Function(ESCExplanation) then) =
      _$ESCExplanationCopyWithImpl<$Res, ESCExplanation>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      num measure,
      ESCRating escrating});

  $ESCRatingCopyWith<$Res> get escrating;
}

/// @nodoc
class _$ESCExplanationCopyWithImpl<$Res, $Val extends ESCExplanation>
    implements $ESCExplanationCopyWith<$Res> {
  _$ESCExplanationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? measure = null,
    Object? escrating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as num,
      escrating: null == escrating
          ? _value.escrating
          : escrating // ignore: cast_nullable_to_non_nullable
              as ESCRating,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ESCRatingCopyWith<$Res> get escrating {
    return $ESCRatingCopyWith<$Res>(_value.escrating, (value) {
      return _then(_value.copyWith(escrating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ESCExplanationCopyWith<$Res>
    implements $ESCExplanationCopyWith<$Res> {
  factory _$$_ESCExplanationCopyWith(
          _$_ESCExplanation value, $Res Function(_$_ESCExplanation) then) =
      __$$_ESCExplanationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      num measure,
      ESCRating escrating});

  @override
  $ESCRatingCopyWith<$Res> get escrating;
}

/// @nodoc
class __$$_ESCExplanationCopyWithImpl<$Res>
    extends _$ESCExplanationCopyWithImpl<$Res, _$_ESCExplanation>
    implements _$$_ESCExplanationCopyWith<$Res> {
  __$$_ESCExplanationCopyWithImpl(
      _$_ESCExplanation _value, $Res Function(_$_ESCExplanation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? measure = null,
    Object? escrating = null,
  }) {
    return _then(_$_ESCExplanation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as num,
      escrating: null == escrating
          ? _value.escrating
          : escrating // ignore: cast_nullable_to_non_nullable
              as ESCRating,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ESCExplanation extends _ESCExplanation {
  _$_ESCExplanation(
      {required this.id,
      required this.title,
      required this.description,
      required this.measure,
      required this.escrating})
      : super._();

  factory _$_ESCExplanation.fromJson(Map<String, dynamic> json) =>
      _$$_ESCExplanationFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final num measure;
  @override
  final ESCRating escrating;

  @override
  String toString() {
    return 'ESCExplanation(id: $id, title: $title, description: $description, measure: $measure, escrating: $escrating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ESCExplanation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.measure, measure) || other.measure == measure) &&
            (identical(other.escrating, escrating) ||
                other.escrating == escrating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, measure, escrating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ESCExplanationCopyWith<_$_ESCExplanation> get copyWith =>
      __$$_ESCExplanationCopyWithImpl<_$_ESCExplanation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ESCExplanationToJson(
      this,
    );
  }
}

abstract class _ESCExplanation extends ESCExplanation {
  factory _ESCExplanation(
      {required final int id,
      required final String title,
      required final String description,
      required final num measure,
      required final ESCRating escrating}) = _$_ESCExplanation;
  _ESCExplanation._() : super._();

  factory _ESCExplanation.fromJson(Map<String, dynamic> json) =
      _$_ESCExplanation.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  num get measure;
  @override
  ESCRating get escrating;
  @override
  @JsonKey(ignore: true)
  _$$_ESCExplanationCopyWith<_$_ESCExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

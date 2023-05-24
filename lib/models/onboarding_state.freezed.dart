// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
mixin _$OnboardingState {
  @JsonKey(ignore: true)
  bool get signupIsInFlux => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  SignUpErrorDetails? get signupError => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  AuthCredential? get conflictingCredentials =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get conflictingEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) bool signupIsInFlux,
      @JsonKey(ignore: true) SignUpErrorDetails? signupError,
      @JsonKey(ignore: true) AuthCredential? conflictingCredentials,
      @JsonKey(ignore: true) String? conflictingEmail});

  $SignUpErrorDetailsCopyWith<$Res>? get signupError;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupIsInFlux = null,
    Object? signupError = freezed,
    Object? conflictingCredentials = freezed,
    Object? conflictingEmail = freezed,
  }) {
    return _then(_value.copyWith(
      signupIsInFlux: null == signupIsInFlux
          ? _value.signupIsInFlux
          : signupIsInFlux // ignore: cast_nullable_to_non_nullable
              as bool,
      signupError: freezed == signupError
          ? _value.signupError
          : signupError // ignore: cast_nullable_to_non_nullable
              as SignUpErrorDetails?,
      conflictingCredentials: freezed == conflictingCredentials
          ? _value.conflictingCredentials
          : conflictingCredentials // ignore: cast_nullable_to_non_nullable
              as AuthCredential?,
      conflictingEmail: freezed == conflictingEmail
          ? _value.conflictingEmail
          : conflictingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpErrorDetailsCopyWith<$Res>? get signupError {
    if (_value.signupError == null) {
      return null;
    }

    return $SignUpErrorDetailsCopyWith<$Res>(_value.signupError!, (value) {
      return _then(_value.copyWith(signupError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$_OnboardingStateCopyWith(
          _$_OnboardingState value, $Res Function(_$_OnboardingState) then) =
      __$$_OnboardingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) bool signupIsInFlux,
      @JsonKey(ignore: true) SignUpErrorDetails? signupError,
      @JsonKey(ignore: true) AuthCredential? conflictingCredentials,
      @JsonKey(ignore: true) String? conflictingEmail});

  @override
  $SignUpErrorDetailsCopyWith<$Res>? get signupError;
}

/// @nodoc
class __$$_OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$_OnboardingState>
    implements _$$_OnboardingStateCopyWith<$Res> {
  __$$_OnboardingStateCopyWithImpl(
      _$_OnboardingState _value, $Res Function(_$_OnboardingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupIsInFlux = null,
    Object? signupError = freezed,
    Object? conflictingCredentials = freezed,
    Object? conflictingEmail = freezed,
  }) {
    return _then(_$_OnboardingState(
      signupIsInFlux: null == signupIsInFlux
          ? _value.signupIsInFlux
          : signupIsInFlux // ignore: cast_nullable_to_non_nullable
              as bool,
      signupError: freezed == signupError
          ? _value.signupError
          : signupError // ignore: cast_nullable_to_non_nullable
              as SignUpErrorDetails?,
      conflictingCredentials: freezed == conflictingCredentials
          ? _value.conflictingCredentials
          : conflictingCredentials // ignore: cast_nullable_to_non_nullable
              as AuthCredential?,
      conflictingEmail: freezed == conflictingEmail
          ? _value.conflictingEmail
          : conflictingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OnboardingState extends _OnboardingState {
  _$_OnboardingState(
      {@JsonKey(ignore: true) this.signupIsInFlux = false,
      @JsonKey(ignore: true) this.signupError = null,
      @JsonKey(ignore: true) this.conflictingCredentials,
      @JsonKey(ignore: true) this.conflictingEmail})
      : super._();

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final bool signupIsInFlux;
  @override
  @JsonKey(ignore: true)
  final SignUpErrorDetails? signupError;
  @override
  @JsonKey(ignore: true)
  final AuthCredential? conflictingCredentials;
  @override
  @JsonKey(ignore: true)
  final String? conflictingEmail;

  @override
  String toString() {
    return 'OnboardingState(signupIsInFlux: $signupIsInFlux, signupError: $signupError, conflictingCredentials: $conflictingCredentials, conflictingEmail: $conflictingEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingState &&
            (identical(other.signupIsInFlux, signupIsInFlux) ||
                other.signupIsInFlux == signupIsInFlux) &&
            (identical(other.signupError, signupError) ||
                other.signupError == signupError) &&
            (identical(other.conflictingCredentials, conflictingCredentials) ||
                other.conflictingCredentials == conflictingCredentials) &&
            (identical(other.conflictingEmail, conflictingEmail) ||
                other.conflictingEmail == conflictingEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, signupIsInFlux, signupError,
      conflictingCredentials, conflictingEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      __$$_OnboardingStateCopyWithImpl<_$_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingStateToJson(
      this,
    );
  }
}

abstract class _OnboardingState extends OnboardingState {
  factory _OnboardingState(
          {@JsonKey(ignore: true) final bool signupIsInFlux,
          @JsonKey(ignore: true) final SignUpErrorDetails? signupError,
          @JsonKey(ignore: true) final AuthCredential? conflictingCredentials,
          @JsonKey(ignore: true) final String? conflictingEmail}) =
      _$_OnboardingState;
  _OnboardingState._() : super._();

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  @JsonKey(ignore: true)
  bool get signupIsInFlux;
  @override
  @JsonKey(ignore: true)
  SignUpErrorDetails? get signupError;
  @override
  @JsonKey(ignore: true)
  AuthCredential? get conflictingCredentials;
  @override
  @JsonKey(ignore: true)
  String? get conflictingEmail;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingState _$$_OnboardingStateFromJson(Map<String, dynamic> json) =>
    _$_OnboardingState(
      signupIsInFlux: json['signupIsInFlux'] as bool,
      signupError: json['signupError'] == null
          ? null
          : ErrorDetails.fromJson(json['signupError'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'signupIsInFlux': instance.signupIsInFlux,
      'signupError': instance.signupError?.toJson(),
    };

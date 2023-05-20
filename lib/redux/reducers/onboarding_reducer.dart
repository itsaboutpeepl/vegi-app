import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/onboarding_state.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';

final onboardingReducer = combineReducers<OnboardingState>([
  TypedReducer<OnboardingState, SignupLoading>(_setLoginLoading).call,
  TypedReducer<OnboardingState, SignupFailed>(_setLoginError).call,
  TypedReducer<OnboardingState, SetConflictingFirebaseCredentials>(
    _setConflictingFirebaseCredentials,
  ).call,
]);

OnboardingState _setLoginLoading(
  OnboardingState state,
  SignupLoading action,
) {
  return state.copyWith(
    signupIsInFlux: action.isLoading,
  );
}

OnboardingState _setLoginError(
  OnboardingState state,
  SignupFailed action,
) {
  return state.copyWith(
    signupError: action.error,
  );
}

OnboardingState _setConflictingFirebaseCredentials(
  OnboardingState state,
  SetConflictingFirebaseCredentials action,
) {
  return state.copyWith(
    conflictingEmail: action.conflictingEmail,
    conflictingCredentials: action.conflictingCredentials,
  );
}

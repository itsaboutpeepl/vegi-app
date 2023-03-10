import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

final userReducers = combineReducers<UserState>([
  TypedReducer<UserState, SetWalletConnectURI>(_setWalletConnectURI),
  TypedReducer<UserState, GetWalletDataSuccess>(_getWalletDataSuccess),
  TypedReducer<UserState, ScrollToTop>(_scrollToTop),
  TypedReducer<UserState, ToggleUpgrade>(_toggleUpgrade),
  TypedReducer<UserState, CreateLocalAccountSuccess>(_createNewWalletSuccess),
  TypedReducer<UserState, LoginRequestSuccess>(_loginSuccess),
  TypedReducer<UserState, LoginVerifySuccess>(_loginVerifySuccess),
  TypedReducer<UserState, LogoutRequestSuccess>(_logoutSuccess),
  TypedReducer<UserState, SetPincodeSuccess>(_setPincode),
  TypedReducer<UserState, SetDisplayName>(_setDisplayName),
  TypedReducer<UserState, SetEmail>(_setEmail),
  TypedReducer<UserState, EmailWLRegistrationSuccess>(
    _setUserEmailForRegistrationToWaitingList,
  ),
  TypedReducer<UserState, SetSurveyQuestionsSuccess>(
    _setSurveyQuestions,
  ),
  TypedReducer<UserState, SetUserAvatar>(_setUserAvatar),
  TypedReducer<UserState, ReLogin>(_reLoginUser),
  TypedReducer<UserState, BackupSuccess>(_backupSuccess),
  TypedReducer<UserState, SetCredentials>(_setCredentials),
  TypedReducer<UserState, SetVerificationId>(_setVerificationId),
  TypedReducer<UserState, JustInstalled>(_justInstalled),
  TypedReducer<UserState, DeviceIdSuccess>(_deviceIdSuccess),
  TypedReducer<UserState, SetSecurityType>(_setSecurityType),
  TypedReducer<UserState, WarnSendDialogShowed>(_warnSendDialogShowed),
  TypedReducer<UserState, UpdateCurrency>(_updateCurrency),
  TypedReducer<UserState, UpdateLocale>(_updateLocale),
  TypedReducer<UserState, UpdateListOfDeliveryAddresses>(_addDeliveryAddress),
  TypedReducer<UserState, SetShowSeedPhraseBanner>(_setShowSeedPhraseBanner),
  TypedReducer<UserState, SetHasSavedSeedPhrase>(_setHasSavedSeedPhrase),
  TypedReducer<UserState, EnableLocationServices>(_setLocationServicesEnabled),
  TypedReducer<UserState, SetUserVerifiedStatusSuccess>(
    _setUserVerifiedStatusSuccessResponse,
  ),
  TypedReducer<UserState, SetUserIsVendorStatusSuccess>(
    _setUserIsVendorSuccessResponse,
  ),
  TypedReducer<UserState, SetDeviceIsSimulatorRTO>(
    _setDeviceIsSimulator,
  ),
]);

UserState _setWalletConnectURI(
  UserState state,
  SetWalletConnectURI action,
) {
  return state.copyWith(wcURI: action.wcURI);
}

UserState _scrollToTop(
  UserState state,
  ScrollToTop action,
) {
  return state.copyWith(scrollToTop: action.value);
}

UserState _toggleUpgrade(
  UserState state,
  ToggleUpgrade action,
) {
  return state.copyWith(
    hasUpgrade: action.value,
  );
}

UserState _updateLocale(
  UserState state,
  UpdateLocale action,
) {
  return state.copyWith(locale: action.locale);
}

UserState _updateCurrency(
  UserState state,
  UpdateCurrency action,
) {
  return state.copyWith(currency: action.currency);
}

UserState _setDeviceIsSimulator(
  UserState state,
  SetDeviceIsSimulatorRTO action,
) {
  return state.copyWith(
    isUsingSimulator: action.isSimulator,
    isUsingIosSimulator: action.isIosSimulator,
  );
}

UserState _warnSendDialogShowed(
  UserState state,
  WarnSendDialogShowed action,
) {
  return state.copyWith(
    warnSendDialogShowed: action.value,
  );
}

UserState _setSecurityType(
  UserState state,
  SetSecurityType action,
) {
  return state.copyWith(
    authType: action.biometricAuth,
  );
}

UserState _getWalletDataSuccess(
  UserState state,
  GetWalletDataSuccess action,
) {
  return state.copyWith(
    backup: action.backup,
    networks: action.networks,
    walletAddress: action.walletAddress,
    walletModules: action.walletModules,
    contractVersion: action.contractVersion,
  );
}

UserState _backupSuccess(
  UserState state,
  BackupSuccess action,
) {
  return state.copyWith(backup: true);
}

UserState _reLoginUser(
  UserState state,
  ReLogin action,
) {
  return state.copyWith(isLoggedOut: false);
}

UserState _createNewWalletSuccess(
  UserState state,
  CreateLocalAccountSuccess action,
) {
  return UserState(
    mnemonic: action.mnemonic,
    privateKey: action.privateKey,
    accountAddress: action.accountAddress,
  );
}

UserState _loginSuccess(
  UserState state,
  LoginRequestSuccess action,
) {
  return state.copyWith(
    countryCode: action.countryCode.dialCode!,
    isoCode: action.countryCode.code!,
    phoneNumber: action.phoneNumber,
  );
}

UserState _setVerificationId(
  UserState state,
  SetVerificationId action,
) {
  return state.copyWith(
    verificationId: action.verificationId,
  );
}

UserState _loginVerifySuccess(
  UserState state,
  LoginVerifySuccess action,
) {
  return state.copyWith(
    isLoggedOut: false,
    jwtToken: action.jwtToken,
  );
}

UserState _logoutSuccess(
  UserState state,
  LogoutRequestSuccess action,
) {
  return state.copyWith(
    isLoggedOut: true,
    walletAddress: '',
    accountAddress: '',
    displayName: '',
    hasSavedSeedPhrase: false,
    mnemonic: [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ],
  );
}

UserState _setDisplayName(
  UserState state,
  SetDisplayName action,
) {
  return state.copyWith(displayName: action.displayName);
}

UserState _setEmail(
  UserState state,
  SetEmail action,
) {
  return state.copyWith(email: action.email);
}

UserState _setUserAvatar(
  UserState state,
  SetUserAvatar action,
) {
  return state.copyWith(avatarUrl: action.avatarUrl);
}

UserState _setPincode(
  UserState state,
  SetPincodeSuccess action,
) {
  return state.copyWith(pincode: action.pincode);
}

UserState _setCredentials(
  UserState state,
  SetCredentials action,
) {
  return state.copyWith(credentials: action.credentials);
}

UserState _justInstalled(
  UserState state,
  JustInstalled action,
) {
  return state.copyWith(installedAt: action.installedAt);
}

UserState _deviceIdSuccess(
  UserState state,
  DeviceIdSuccess action,
) {
  return state.copyWith(identifier: action.identifier);
}

UserState _addDeliveryAddress(
  UserState state,
  UpdateListOfDeliveryAddresses action,
) {
  return state.copyWith(listOfDeliveryAddresses: action.listOfAddresses);
}

UserState _setShowSeedPhraseBanner(
  UserState state,
  SetShowSeedPhraseBanner action,
) {
  return state.copyWith(showSeedPhraseBanner: action.showSeedPhraseBanner);
}

UserState _setHasSavedSeedPhrase(
  UserState state,
  SetHasSavedSeedPhrase action,
) {
  return state.copyWith(hasSavedSeedPhrase: action.hasSavedSeedPhrase);
}

UserState _setLocationServicesEnabled(
  UserState state,
  EnableLocationServices action,
) {
  return state.copyWith(useLiveLocation: action.enabled);
}

UserState _setUserLocation(
  UserState state,
  UpdateUserLocation action,
) {
  return state.copyWith(userLocation: action.newLocation);
}

UserState _setUserEmailForRegistrationToWaitingList(
  UserState state,
  EmailWLRegistrationSuccess action,
) {
  return state.copyWith(email: action.email);
}

UserState _setSurveyQuestions(
  UserState state,
  SetSurveyQuestionsSuccess action,
) {
  return state.copyWith(
    surveyQuestions: action.questions,
  );
}

UserState _setUserVerifiedStatusSuccessResponse(
  UserState state,
  SetUserVerifiedStatusSuccess action,
) {
  return state.copyWith(
    userIsVerified: action.userIsVerified,
  );
}

UserState _setUserIsVendorSuccessResponse(
  UserState state,
  SetUserIsVendorStatusSuccess action,
) {
  return state.copyWith(
    isVendor: action.isVendor,
  );
}

// UserState _setSurveyResponse(
//   UserState state,
//   SurveyResponseSuccess action,
// ) {
//   return state.copyWith(email: action.email, questionNumberResponded: action.questionNumber,);
// }

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_number/phone_number.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/network/web3auth.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/admin/postVegiResponse.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/services/apis/locationService.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/json_helpers.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SetWalletConnectURI {
  SetWalletConnectURI(this.wcURI);
  final String wcURI;

  @override
  String toString() => 'SetWalletConnectURI : wcURI: $wcURI';
}

class ScrollToTop {
  ScrollToTop({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'ScrollToTop : value: $value';
}

class ToggleUpgrade {
  ToggleUpgrade({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'ToggleUpgrade : value: $value';
}

class EnableLocationServices {
  EnableLocationServices({
    required this.enabled,
  });
  final bool enabled;

  @override
  String toString() => 'EnableLocationServices : enabled: $enabled';
}

class UpdateUserLocation {
  UpdateUserLocation({
    required this.newLocation,
  });
  final Position newLocation;

  @override
  String toString() => 'UpdateUserLocation : newLocation: $newLocation';
}

class UpdateCurrency {
  UpdateCurrency({required this.currency});
  final String currency;

  @override
  String toString() => 'UpdateCurrency : currency: $currency';
}

class UpdateLocale {
  UpdateLocale({required this.locale});
  final Locale locale;

  @override
  String toString() => 'UpdateLocale : locale: $locale';
}

class SetDeviceIsSimulatorRTO {
  SetDeviceIsSimulatorRTO({
    required this.isSimulator,
    required this.isIosSimulator,
  });

  final bool isSimulator;
  final bool isIosSimulator;

  @override
  String toString() {
    return 'SetDeviceIsSimulatorRTO : Simulator=$isSimulator; ios=$isIosSimulator';
  }
}

class SetStripeCustomerDetails {
  SetStripeCustomerDetails({
    required this.customerId,
  });

  final String customerId;

  @override
  String toString() {
    return 'SetStripeCustomerDetails : customerId=$customerId';
  }
}

class WarnSendDialogShowed {
  WarnSendDialogShowed({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'WarnSendDialogShowed : value: $value';
}

class SetSecurityType {
  SetSecurityType({required this.biometricAuth});
  BiometricAuth biometricAuth;

  @override
  String toString() => 'SetSecurityType : biometricAuth: $biometricAuth';
}

class CreateLocalAccountSuccess {
  CreateLocalAccountSuccess(
    this.mnemonic,
    this.privateKey,
    this.fuseWalletCredentials,
    // this.accountAddress,
  );
  final List<String> mnemonic;
  final String privateKey;
  final EthPrivateKey fuseWalletCredentials;
  // final String accountAddress;

  @override
  String toString() => 'CreateLocalAccountSuccess';
}

class CreateSurveyCompletedSuccess {
  CreateSurveyCompletedSuccess(
    this.completed,
  );

  final bool completed;

  @override
  String toString() => 'CreateSurveyCompletedSuccess:'
      ' completed: $completed';
}

class AddSurveyEmailSuccess {
  AddSurveyEmailSuccess(
    this.email,
  );

  final String email;

  @override
  String toString() => 'AddSurveyEmailSuccess:'
      ' email: $email';
}

class ReLogin {
  ReLogin();

  @override
  String toString() => 'ReLogin';
}

class ReauthenticateUserFailure {
  ReauthenticateUserFailure({
    required this.error,
  });

  final UserAuthenticationStatus error;

  @override
  String toString() {
    return 'ReauthenticateUserFailure : $error';
  }
}

class AuthenticateFuseWalletSDKFailure {
  AuthenticateFuseWalletSDKFailure({
    required this.error,
  });

  final FuseWalletCreationStatus error;

  @override
  String toString() {
    return 'AuthenticateFuseWalletSDKFailure : error:"$error"';
  }
}

class FetchFuseSmartWalletFailure {
  FetchFuseSmartWalletFailure({
    required this.error,
  });

  final FuseWalletCreationStatus error;

  @override
  String toString() {
    return 'FetchFuseSmartWalletFailure : $error';
  }
}

class EmailWLRegistrationSuccess {
  EmailWLRegistrationSuccess({
    required this.email,
  });
  final String email;

  @override
  String toString() => 'EmailWLRegistrationSuccess : email: $email';
}

// class SurveyResponseSuccess {
//   SurveyResponseSuccess({
//     required this.email,
//     required this.questionNumber,
//     required this.question,
//     required this.answer,
//   });
//   final String email;
//   final int questionNumber;
//   final String question;
//   final String answer;

//   @override
//   String toString() =>
//       'SurveyResponseSuccess : email: $email, questionNumber: $questionNumber, question: $question, answer: $answer';
// }

class SetSurveyQuestionsSuccess {
  SetSurveyQuestionsSuccess({
    required this.questions,
  });
  final List<SurveyQuestion> questions;

  @override
  String toString() => 'SetSurveyQuestionsSuccess : email[${questions.length}]';
}

class LoginRequestSuccess {
  LoginRequestSuccess({
    required this.countryCode,
    required this.phoneNumber,
    this.displayName,
    this.email,
  });
  final CountryCode countryCode;
  final String phoneNumber;
  final String? displayName;
  final String? email;

  @override
  String toString() => 'LoginRequestSuccess : countryCode: $countryCode, '
      'phoneNumber: $phoneNumber, displayName: $displayName, email: $email';
}

class LogoutRequestSuccess {
  LogoutRequestSuccess();

  @override
  String toString() => 'LogoutRequestSuccess';
}

class LoginVerifySuccess {
  LoginVerifySuccess(this.jwtToken);
  final String jwtToken;

  @override
  String toString() => 'LoginVerifySuccess : jwtToken: $jwtToken,';
}

class SetPincodeSuccess {
  SetPincodeSuccess(this.pincode);
  String pincode;

  @override
  String toString() => 'SetPincodeSuccess : pincode: $pincode';
}

class SetDisplayName {
  SetDisplayName(this.displayName);
  String displayName;

  @override
  String toString() => 'SetDisplayName : displayName: $displayName';
}

class SetEmail {
  SetEmail(this.email);
  String email;

  @override
  String toString() => 'SetEmail : email: $email';
}

class SetUserAvatar {
  SetUserAvatar(this.avatarUrl);
  String avatarUrl;

  @override
  String toString() => 'SetUserAvatar : avatarUrl: $avatarUrl';
}

class SetUserVerifiedStatusSuccess {
  SetUserVerifiedStatusSuccess(this.userIsVerified);
  bool userIsVerified;

  @override
  String toString() =>
      'SetUserVerifiedStatusSuccess : userIsVerified: $userIsVerified';
}

class SetUserVegiAccountIdSuccess {
  SetUserVegiAccountIdSuccess(this.accountId);
  num accountId;

  @override
  String toString() => 'SetUserVegiAccountIdSuccess : accountId: $accountId';
}

class SetUserIsVendorStatusSuccess {
  SetUserIsVendorStatusSuccess(this.isVendor);
  bool isVendor;

  @override
  String toString() => 'SetUserIsVendorStatusSuccess : isVendor: $isVendor';
}

class BackupRequest {
  BackupRequest();

  @override
  String toString() => 'BackupRequest';
}

class BackupSuccess {
  BackupSuccess();

  @override
  String toString() => 'BackupSuccess';
}

class StoreBackupStatus {
  StoreBackupStatus({
    required this.isSmartWalletBackedUp,
  });

  final bool isSmartWalletBackedUp;

  @override
  String toString() => 'StoreBackupStatus: $isSmartWalletBackedUp';
}

class SetFirebaseCredentials {
  SetFirebaseCredentials(this.firebaseCredentials);
  PhoneAuthCredential? firebaseCredentials;

  @override
  String toString() =>
      'SetFirebaseCredentials : credentials: $firebaseCredentials';
}

class SetFirebaseSessionToken {
  SetFirebaseSessionToken({required this.firebaseSessionToken});
  String? firebaseSessionToken;

  @override
  String toString() =>
      'SetFirebaseSessionToken : firebaseSessionToken: $firebaseSessionToken';
}

class SetFuseWalletCredentials {
  SetFuseWalletCredentials(this.fuseWalletCredentials);
  EthPrivateKey? fuseWalletCredentials;

  @override
  String toString() =>
      'SetFuseWalletCredentials : fuseWalletCredentials: $fuseWalletCredentials';
}

class SetVerificationId {
  SetVerificationId(this.verificationId);
  String verificationId;

  @override
  String toString() => 'SetVerificationId : verificationId: $verificationId';
}

class SetVerificationPassed {
  SetVerificationPassed({required this.verificationPassed});
  bool verificationPassed;

  @override
  String toString() =>
      'SetVerificationPassed : verificationPassed: $verificationPassed';
}

class SetPhoneNumber {
  SetPhoneNumber({required this.phoneNumber});

  String phoneNumber;

  @override
  String toString() => 'SetPhoneNumber : phoneNumber: $phoneNumber';
}

class JustInstalled {
  JustInstalled(this.installedAt);
  final DateTime installedAt;

  @override
  String toString() => 'JustInstalled : installedAt: $installedAt';
}

class DeviceIdSuccess {
  DeviceIdSuccess(this.identifier);
  final String identifier;

  @override
  String toString() => 'DeviceIdSuccess : identifier: $identifier';
}

class UpdateListOfDeliveryAddresses {
  UpdateListOfDeliveryAddresses(this.listOfAddresses);
  final List<DeliveryAddresses> listOfAddresses;

  @override
  String toString() =>
      'UpdateListOfDeliveryAddresses : listOfAddresses: $listOfAddresses';
}

class SetShowSeedPhraseBanner {
  SetShowSeedPhraseBanner({required this.showSeedPhraseBanner});
  final bool showSeedPhraseBanner;

  @override
  String toString() =>
      'SetShowSeedPhraseBanner : showSeedPhraseBanner: $showSeedPhraseBanner,';
}

class SetHasSavedSeedPhrase {
  SetHasSavedSeedPhrase({required this.hasSavedSeedPhrase});
  final bool hasSavedSeedPhrase;

  @override
  String toString() =>
      'SetHasSavedSeedPhrase : hasSavedSeedPhrase: $hasSavedSeedPhrase';
}

ThunkAction<AppState> registerEmailWaitingListHandler(
  String email,
  void Function()? onSuccess,
  void Function(String error)? onError,
) {
  return (Store<AppState> store) async {
    try {
      await peeplEatsService.registerEmailToWaitingList(
        email,
        () {
          Analytics.track(
            eventName: AnalyticsEvents.emailWLRegistration,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(
            EmailWLRegistrationSuccess(
              email: email,
            ),
          );
          onSuccess?.call();
        },
        (eStr) {
          Analytics.track(
            eventName: AnalyticsEvents.emailWLRegistration,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': eStr,
            },
          );
          onError?.call(eStr);
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - Email WaitingList Registration Request',
        error: e,
        stackTrace: s,
      );
      onError?.call(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.emailWLRegistration,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in Email Registration: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in Email Registration',
      );
    }
  };
}

ThunkAction<AppState> fetchDeviceType() {
  return (Store<AppState> store) async {
    try {
      final isSimulator = await deviceIsSimulator();
      final isIosSimulator = await deviceIsIosSimulator();
      store.dispatch(
        SetDeviceIsSimulatorRTO(
          isSimulator: isSimulator,
          isIosSimulator: isIosSimulator,
        ),
      );
    } catch (e, s) {
      log.error('ERROR - fetchDeviceType e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchDeviceType e',
      );
    }
  };
}

// ThunkAction<AppState> checkIfSmartWalletIsBackedUpToVegi({
//   required void Function(String, VegiBackendResponseErrCode) errorHandler,
// }) {
//   return (Store<AppState> store) async {
//     try {
//       final isBackedUp = await peeplEatsService.isUserSKBackedUp(
//           smartWalletAddress: store.state.userState.walletAddress);
//       store.dispatch(StoreBackupStatus(isSmartWalletBackedUp: isBackedUp));
//     } catch (e, s) {
//       log.error('ERROR - checkIfSmartWalletIsBackedUpToVegi $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - checkIfSmartWalletIsBackedUpToVegi $e',
//       );
//       errorHandler(
//         'ERROR - checkIfSmartWalletIsBackedUpToVegi $e',
//         VegiBackendResponseErrCode.connectionIssue,
//       );
//     }
//   };
// }

ThunkAction<AppState> fetchSurveyQuestions() {
  return (Store<AppState> store) async {
    try {
      final questions = await peeplEatsService.getSurveyQuestions();
      store.dispatch(SetSurveyQuestionsSuccess(questions: questions));
    } catch (e, s) {
      log.error(
        'ERROR - fetchSurveyQuestions Request',
        error: e,
        stackTrace: s,
      );
      await Analytics.track(
        eventName: AnalyticsEvents.submitSurveyResponse,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in fetchSurveyQuestions: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in fetchSurveyQuestions',
      );
    }
  };
}

ThunkAction<AppState> submitSurveyResponse(
  String question,
  String response,
  void Function() onSuccess,
  void Function(String error) onError,
) {
  return (Store<AppState> store) async {
    try {
      await peeplEatsService.submitSurveyResponse(
        store.state.userState.email,
        question,
        response,
        () {
          Analytics.track(
            eventName: AnalyticsEvents.submitSurveyResponse,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          // store.dispatch(
          //   SurveyResponseSuccess(
          //     email: store.state.userState.email,
          //     questionNumber: store.state.userState.,
          //     answer: response,
          //   ),
          // );
          onSuccess?.call();
        },
        (eStr) {
          Analytics.track(
            eventName: AnalyticsEvents.submitSurveyResponse,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': eStr,
            },
          );
          onError?.call(eStr);
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - submitSurveyResponse Request',
        error: e,
        stackTrace: s,
      );
      onError?.call(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.submitSurveyResponse,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in submitSurveyResponse: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in submitSurveyResponse',
      );
    }
  };
}

ThunkAction<AppState> isBetaWhitelistedAddress() {
  return (Store<AppState> store) async {
    try {
      if (store.state.userState.walletAddress.isEmpty) {
        const warning =
            "User wallet not initialised! Can't check the whitelist";
        log.warn(warning);
        await Sentry.captureMessage(
          warning,
        );
        return;
      }
      await peeplEatsService.getUserForWalletAddress(
        store.state.userState.walletAddress,
        (vegiAccount) {
          Analytics.track(
            eventName: AnalyticsEvents.getUserForWalletAddress,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store
            ..dispatch(SetUserVerifiedStatusSuccess(vegiAccount.verified))
            ..dispatch(SetUserVegiAccountIdSuccess(vegiAccount.id));
        },
        (eStr) {
          Analytics.track(
            eventName: AnalyticsEvents.getUserForWalletAddress,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': eStr,
            },
          );
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - isBetaWhitelistedAddress Request',
        error: e,
        stackTrace: s,
      );
      // onError?.call(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.submitSurveyResponse,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in isBetaWhitelistedAddress: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in isBetaWhitelistedAddress',
      );
    }
  };
}

ThunkAction<AppState> isUserWalletAddressAVendorAddress({
  void Function()? success,
  void Function(String)? error,
}) {
  return (Store<AppState> store) async {
    try {
      await peeplEatsService.getAccountIsVendor(
        store.state.userState.walletAddress,
        (isVendor, vendorId) {
          Analytics.track(
            eventName: AnalyticsEvents.getUserForWalletAddress,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(SetUserIsVendorStatusSuccess(isVendor));
          if (isVendor && vendorId != null) {
            store
              ..dispatch(
                fetchRestaurantById(
                  restaurantID: vendorId.toString(),
                  success: success,
                  error: error,
                ),
              )
              ..dispatch(
                setRestaurantDetails(
                  restaurantItem:
                      store.state.homePageState.featuredRestaurants.firstWhere(
                    (element) => element.restaurantID == vendorId.toString(),
                  ),
                  clearCart: true,
                ),
              );
          }
        },
        (eStr) {
          Analytics.track(
            eventName: AnalyticsEvents.getUserForWalletAddress,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': eStr,
            },
          );
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - isUserWalletAddressAVendorAddress Request',
        error: e,
        stackTrace: s,
      );
      // onError?.call(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.submitSurveyResponse,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception(
            'Error in isUserWalletAddressAVendorAddress: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in isUserWalletAddressAVendorAddress',
      );
    }
  };
}

ThunkAction<AppState> loginHandler(
  CountryCode countryCode,
  PhoneNumber phoneNumber,
  void Function() onSuccess,
  void Function(String error) onError,
) {
  bool _useWeb3Auth = false;
  return (Store<AppState> store) async {
    try {
      store.dispatch(setDeviceId(phoneNumber.e164));
      await Analytics.setUserId(phoneNumber.e164);
      await onBoardStrategy.login(
        store,
        phoneNumber.e164,
        () {
          Analytics.track(
            eventName: AnalyticsEvents.loginWithPhone,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(
            LoginRequestSuccess(
              countryCode: countryCode,
              phoneNumber: phoneNumber.e164,
            ),
          );
          store.dispatch(
            authenticateFuseWalletSDK(),
          ); //!BUG why is this not called after login?
          // if (_useWeb3Auth) {
          //   loginWeb3Auth(/*'vegi://vegiApp.co.uk/user-name-screen'*/);
          // } else {
          //   rootRouter.push(UserNameScreen());
          // }
          onSuccess?.call();
        },
        (e, status) {
          Analytics.track(
            eventName: AnalyticsEvents.loginWithPhone,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': e.toString(),
            },
          );
          store.dispatch(
            ReauthenticateUserFailure(
              error: UserAuthenticationStatus.firebasePhoneAuthFailed,
            ),
          );
          onError?.call(e.toString());
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - Login Request',
        error: e,
        stackTrace: s,
      );
      onError?.call(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.loginWithPhone,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in login with phone number: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in Login Request',
      );
    }
  };
}

ThunkAction<AppState> verifyHandler(
  String verificationCode,
  void Function()? onSuccess,
  void Function(String error)? onError,
) {
  return (Store<AppState> store) async {
    try {
      await onBoardStrategy.verify(
        store,
        verificationCode,
        () {
          Analytics.track(
            eventName: AnalyticsEvents.verify,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          onSuccess?.call();
        },
        (errorMsg, status) {
          store.dispatch(
            ReauthenticateUserFailure(
              error: UserAuthenticationStatus.firebaseVerificationFailed,
            ),
          );
          onError?.call(errorMsg);
        },
      );
    } catch (error, s) {
      onError?.call(error.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.verify,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': error.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in verify phone number: ${error.toString()}'),
        stackTrace: s,
        hint: 'Error while phone number verification',
      );
    }
  };
}

ThunkAction<AppState> restoreWalletCall(
  // only allow to call this from a custom route link that allows myself and verity to add our mnemonics to createa our smart wallets and remove all other recoveries locations
  List<String> mnemonicWords,
  VoidCallback successCallback,
  VoidCallback failureCallback,
) {
  return (Store<AppState> store) async {
    try {
      await Analytics.track(
        eventName: AnalyticsEvents.restoreWallet,
      );
      final mnemonic = mnemonicWords.join(' ');
      log
        ..info('restore wallet')
        ..info('compute pk');
      final String privateKey = Mnemonic.privateKeyFromMnemonic(mnemonic);
      //! await peeplEatsService.backupUserSK(privateKey);
      final EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
      final EthereumAddress accountAddress = credentials.address;
      log.info('accountAddress: $accountAddress');
      store
        ..dispatch(
          CreateLocalAccountSuccess(
            mnemonicWords,
            privateKey,
            credentials,
            // accountAddress.toString(),
          ),
        )
        ..dispatch(authenticateFuseWalletSDK());
      successCallback();
    } catch (e, s) {
      log.error(
        'ERROR - restoreWalletCall',
        error: e,
        stackTrace: s,
      );
      failureCallback();
      await Sentry.captureException(
        Exception('Error in restore mnemonic: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in restore wallet',
      );
    }
  };
}

ThunkAction<AppState> setDeviceId(String phoneNumber) {
  return (Store<AppState> store) async {
    final String identifier = await FlutterUdid.udid;
    // mixpanel.alias(identifier, phoneNumber);
    log.info('device identifier: $identifier');
    store.dispatch(DeviceIdSuccess(identifier));
  };
}

/// Function to create the single External Owner Account that can have at most
/// ONE smart wallet linked with it.
ThunkAction<AppState> createLocalAccountCall(
  VoidCallback successCallback,
) {
  return (Store<AppState> store) async {
    try {
      // Generate a random Ethereum private key
      if (store.state.userState.fuseWalletCredentials != null) {
        return successCallback();
      }
      final String mnemonic = Mnemonic.generate();
      final String privateKey = Mnemonic.privateKeyFromMnemonic(mnemonic);
      //! await peeplEatsService.backupUserSK(privateKey);
      final EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
      final EthereumAddress accountAddress = credentials.address;
      log.info('accountAddress: $accountAddress');
      store.dispatch(
        CreateLocalAccountSuccess(
          mnemonic.split(' '),
          privateKey,
          credentials,
          // accountAddress.toString(),
        ),
      );
      await Analytics.track(
        eventName: AnalyticsEvents.createWallet,
      );
      successCallback();
    } catch (e, s) {
      log.error(
        'ERROR - createLocalAccountCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in generate mnemonic: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR while generate mnemonic',
      );
    }
  };
}

ThunkAction<AppState> authenticateFuseWalletSDK({
  void Function()? onSuccess,
  void Function(String message)? onFailure,
}) {
  onFailure ??= log.error;
  onSuccess ??= () => log.info('authenticateFuseWalletSDK succeeded');
  return (Store<AppState> store) async {
    try {
      if (store.state.userState.privateKey.isEmpty) {
        store.dispatch(
          AuthenticateFuseWalletSDKFailure(
            error: FuseWalletCreationStatus.missingUserDetailsToAuthFuseWallet,
          ),
        );
        return onFailure!(
            'User details missing from reauthentication in authenticateFuseWalletSDK');
      }
      final EthPrivateKey credentials =
          EthPrivateKey.fromHex(store.state.userState.privateKey);
      final DC<Exception, String> authRes = await fuseWalletSDK.authenticate(
        credentials,
      );
      if (authRes.hasError) {
        store.dispatch(
          AuthenticateFuseWalletSDKFailure(
            error: FuseWalletCreationStatus.failedAuthentication,
          ),
        );
        onFailure!('Error occurred in authenticate: ${authRes.error}');
      } else if (authRes.hasData) {
        final jwt = authRes.data!;
        store.dispatch(LoginVerifySuccess(jwt));
        fuseWalletSDK.jwtToken = jwt;
        onSuccess!();
      } else {
        store.dispatch(
          AuthenticateFuseWalletSDKFailure(
            error: FuseWalletCreationStatus.failedAuthentication,
          ),
        );
        throw Exception(
            'Bad AuthRes from Fuse Authentication did not contain either data or an error: $authRes');
      }
    } catch (e, s) {
      store.dispatch(
        AuthenticateFuseWalletSDKFailure(
          error: FuseWalletCreationStatus.failedAuthentication,
        ),
      );
      onFailure!('Error in authenticateFuseWalletSDK: $e');
      log.error(
        'ERROR - authenticateFuseWalletSDK',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in authenticateFuseWalletSDK: $e'),
        stackTrace: s,
        hint: 'ERROR - authenticateFuseWalletSDK',
      );
    }
  };
}

bool smartWalletInitialised(FuseWalletSDK fuseWalletSDK) {
  try {
    return fuseWalletSDK.smartWallet != null;
  } on Exception catch (err) {
    print('Error: $err');
    return false;
  } catch (err) {
    print('Error: $err');
    return false;
  }
  ;
}

ThunkAction<AppState> fetchFuseSmartWallet({
  void Function()? onSuccess,
  void Function(Exception error)? onFailure,
  void Function(Exception error)? onError,
  bool allowRetry = true,
}) {
  return (Store<AppState> store) async {
    try {
      if (smartWalletInitialised(fuseWalletSDK)) {
        store.dispatch(
          saveSmartWallet(
            smartWallet: fuseWalletSDK.smartWallet,
          ),
        );
        return onSuccess?.call();
      }
      // Try to fetch a wallet for the EOA, if it doesn't exist create one
      final walletData = await fuseWalletSDK.fetchWallet();

      walletData.pick(
        onData: (SmartWallet smartWallet) async {
          log.info(
              'Successfully refetched smart wallet address ${smartWallet.smartWalletAddress}');
          store.dispatch(
            saveSmartWallet(
              smartWallet: fuseWalletSDK.smartWallet,
            ),
          );
          onSuccess?.call();
        },
        onError: (Exception exception) async {
          store.dispatch(
            FetchFuseSmartWalletFailure(
              error: FuseWalletCreationStatus.failedFetch,
            ),
          );
          if (allowRetry &&
              exception.toString().contains('LateInit') &&
              store.state.userState.jwtToken != '') {
            fuseWalletSDK.jwtToken = store.state.userState.jwtToken;
            store
              ..dispatch(
                authenticateFuseWalletSDK(
                  onFailure: (message) => onFailure?.call(exception),
                ),
              )
              ..dispatch(
                fetchFuseSmartWallet(
                  onSuccess: onSuccess,
                  onFailure: onFailure,
                  onError: onError,
                  allowRetry: false,
                ),
              );
            return;
          }
          final exceptionOrStream = await fuseWalletSDK.createWallet();
          if (exceptionOrStream.hasError) {
            log.error(exceptionOrStream.error.toString());
            store.dispatch(
              FetchFuseSmartWalletFailure(
                error: FuseWalletCreationStatus.failedCreate,
              ),
            );
          } else if (exceptionOrStream.hasData) {
            exceptionOrStream.data!.listen(
              (SmartWalletEvent event) {
                if (event.name == 'smartWalletCreationStarted') {
                  log.info('smartWalletCreationStarted ${event.data}');
                } else if (event.name == 'transactionHash') {
                  log.info('transactionHash ${event.data}');
                } else if (event.name == 'smartWalletCreationSucceeded') {
                  log.info('smartWalletCreationSucceeded ${event.data}');
                  onSuccess?.call();
                } else if (event.name == 'smartWalletCreationFailed') {
                  log.error('smartWalletCreationFailed ${event.data}');
                  store.dispatch(
                    FetchFuseSmartWalletFailure(
                      error: FuseWalletCreationStatus.failedCreate,
                    ),
                  );
                  onFailure?.call(exception);
                } else {
                  log.info(
                      'No event handler for fuseWalletSDK.fetchWallet event: '
                      '"${event.name}"');
                }
              },
              cancelOnError: true,
              onError: (error) {
                log.error('Error occurred: $error');
                onError?.call(error as Exception);
              },
            );
          }
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - fetchFuseSmartWallet',
        error: e,
        stackTrace: s,
      );
      store.dispatch(
        FetchFuseSmartWalletFailure(
          error: FuseWalletCreationStatus.failedFetch,
        ),
      );
      onFailure?.call(
        Exception('Error in setup wallet call: $e'),
      );
      await Sentry.captureException(
        Exception('Error in setup wallet call: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - fetchFuseSmartWallet',
      );
    }
  };
}

ThunkAction<AppState> saveSmartWallet({
  required SmartWallet smartWallet,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        GetWalletDataSuccess(
          walletAddress: smartWallet.smartWalletAddress,
          networks: smartWallet.networks,
          walletModules: smartWallet.walletModules,
        ),
      );
    } catch (e, s) {
      log.error(
        'ERROR - setupWalletCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in setup wallet call: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - setupWalletCall',
      );
    }
  };
}

ThunkAction<AppState> reAuthenticateOnBoarding({
  void Function()? onSuccess,
  void Function(Exception error)? onFailure,
  void Function()? reOnboardRequired,
}) {
  return (Store<AppState> store) async {
    try {
      await onBoardStrategy.reauthenticateUser(
        store: store,
        onSuccess: onSuccess,
        reOnboardRequired: reOnboardRequired,
        onFailure: (exception, status) {
          Analytics.track(
            eventName: AnalyticsEvents.verify,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(ReauthenticateUserFailure(error: status));
          onFailure?.call(exception);
        },
      );
    } on Exception catch (error, s) {
      store.dispatch(
        ReauthenticateUserFailure(
          error: UserAuthenticationStatus.firebasePhoneAuthFailed,
        ),
      );
      onFailure?.call(error);
      await Analytics.track(
        eventName: AnalyticsEvents.verify,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': error.toString(),
        },
      );
      await Sentry.captureException(
        Exception(
            'Error in reauthenticate user [${onBoardStrategy.strategy.name}]: $error'),
        stackTrace: s,
        hint: 'Error while phone number verification',
      );
    }
  };
}

ThunkAction<AppState> reLoginCall({
  void Function()? onSuccess,
  void Function(Exception error)? onFailure,
  void Function(Exception error)? onError,
  void Function()? reOnboardRequired,
}) {
  return (Store<AppState> store) async {
    store
      ..dispatch(ReLogin())
      ..dispatch(
        reAuthenticateOnBoarding(
          onSuccess: () {},
          reOnboardRequired: reOnboardRequired,
          onFailure: onFailure,
        ),
      )
      ..dispatch(authenticateFuseWalletSDK())
      ..dispatch(
        fetchFuseSmartWallet(
          onSuccess: onSuccess,
          onError: onError,
          onFailure: onFailure,
        ),
      );
  };
}

ThunkAction<AppState> identifyCall({String? wallet}) {
  return (Store<AppState> store) async {
    final UserState userState = store.state.userState;
    final String displayName = userState.displayName;

    final String phoneNumber = userState.phoneNumber;
    final String walletAddress = wallet ?? userState.walletAddress;
    final String accountAddress = userState.accountAddress;
    final String identifier = userState.identifier;

    final Map<String, dynamic> properties = {
      'identifier': identifier,
      'phoneNumber': phoneNumber,
      'walletAddress': walletAddress,
      'accountAddress': accountAddress,
      'language': userState.locale.toString(),
      'displayName': displayName,
    };
    await Analytics.setUserInformation(properties);
    await Analytics.setUserId(phoneNumber);
    DateTime? installedAt = userState.installedAt;
    if (installedAt == null) {
      log.info('Identify - $phoneNumber');
      installedAt = DateTime.now().toUtc();
      store.dispatch(JustInstalled(installedAt));
    }
  };
}

void updateFirebaseCurrentUser(
  void Function({
    required User firebaseUser,
  })
      userUpdateCallback,
) async {
  if (FirebaseAuth.instance.currentUser != null) {
    userUpdateCallback(
      firebaseUser: FirebaseAuth.instance.currentUser!,
    );
  } else {
    log.warn(
      'WARNING - updateFirebaseCurrentUser called when no user signed in...',
      stackTrace: StackTrace.current,
    );
    await Sentry.captureMessage(
      'WARNING - updateFirebaseCurrentUser called when no user signed in...'
      'with stackTrace: ${StackTrace.current}',
    );
  }
}

ThunkAction<AppState> updateDisplayNameCall(String displayName) {
  return (Store<AppState> store) async {
    try {
      updateFirebaseCurrentUser(({required User firebaseUser}) async {
        await firebaseUser.updateDisplayName(displayName);
        store.dispatch(SetDisplayName(displayName));
      });
    } catch (e, s) {
      log.error(
        'ERROR - updateDisplayNameCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in update user profile name: ${e.toString()}'),
        stackTrace: s,
        hint: 'Error in update user profile name',
      );
    }
  };
}

ThunkAction<AppState> updateUserAvatarCall(
  ImageSource source, {
  required ProgressCallback progressCallback,
  required void Function() onSuccess,
}) {
  return (Store<AppState> store) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      try {
        updateFirebaseCurrentUser(({required User firebaseUser}) async {
          await peeplEatsService.uploadImageForUserAvatar(
            image: File(file.path),
            onSuccess: (PostVegiResponse response) async {
              await firebaseUser.updatePhotoURL(response.url);
              store.dispatch(SetUserAvatar(response.url));
              onSuccess?.call();
            },
            onError: (error, errCode) async {
              log.error(
                'ERROR - peeplEatsService.uploadImageForUserAvatar',
                error: error,
                stackTrace: StackTrace.current,
              );
              await Sentry.captureException(
                Exception('ERROR - peeplEatsService.uploadImageForUserAvatar'),
                stackTrace: StackTrace.current,
              );
            },
            onReceiveProgress: progressCallback,
          );
        });
      } catch (e, s) {
        log.error(
          'ERROR - updateUserAvatarCall',
          error: e,
          stackTrace: s,
        );
        await Sentry.captureException(
          Exception('Error in update user profile image: ${e.toString()}'),
          stackTrace: s,
          hint: 'Error in update user profile image',
        );
      }
    }
  };
}

ThunkAction<AppState> addDeliveryAddress({
  required DeliveryAddresses newAddress,
}) {
  return (Store<AppState> store) {
    try {
      final List<DeliveryAddresses> listOfAddresses =
          List.from(store.state.userState.listOfDeliveryAddresses)
            ..add(newAddress);

      store.dispatch(UpdateListOfDeliveryAddresses(listOfAddresses));
    } catch (e, s) {
      log.error(
        'ERROR - addDeliveryAddress',
        error: e,
        stackTrace: s,
      );
      Sentry.captureException(
        Exception('ERROR - addDeliveryAddress: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - addDeliveryAddress',
      );
    }
  };
}

ThunkAction<AppState> removeDeliveryAddress({
  required int addressId,
}) {
  return (Store<AppState> store) {
    try {
      final List<DeliveryAddresses> listOfAddresses =
          List.from(store.state.userState.listOfDeliveryAddresses)
            ..removeWhere((element) => element.internalID == addressId);

      store.dispatch(UpdateListOfDeliveryAddresses(listOfAddresses));
    } catch (e, s) {
      log.error(
        'ERROR - removeDeliveryAddress',
        error: e,
        stackTrace: s,
      );
      Sentry.captureException(
        Exception('ERROR - removeDeliveryAddress: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - removeDeliveryAddress',
      );
    }
  };
}

ThunkAction<AppState> updateDeliveryAddress({
  required int oldId,
  required DeliveryAddresses newAddress,
}) {
  return (Store<AppState> store) {
    try {
      final List<DeliveryAddresses> listOfAddresses =
          List.from(store.state.userState.listOfDeliveryAddresses);
      final index =
          listOfAddresses.indexWhere((element) => element.internalID == oldId);

      listOfAddresses
        ..removeAt(index)
        ..insert(index, newAddress);

      store.dispatch(UpdateListOfDeliveryAddresses(listOfAddresses));
    } catch (e, s) {
      log.error(
        'ERROR - updateDeliveryAddress',
        error: e,
        stackTrace: s,
      );
      Sentry.captureException(
        Exception('ERROR - updateDeliveryAddress: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - updateDeliveryAddress',
      );
    }
  };
}

ThunkAction<AppState> checkForSavedSeedPhrase() {
  return (Store<AppState> store) async {
    if (store.state.userState.hasSavedSeedPhrase) return;
    if (store.state.userState.initialLoginDateTime.isEmpty) return;
    if (DateTime.now()
            .difference(
              DateTime.fromMillisecondsSinceEpoch(
                int.parse(
                  store.state.userState.initialLoginDateTime,
                ),
              ),
            )
            .inDays <
        7) {
      //show the banner
      store.dispatch(SetShowSeedPhraseBanner(showSeedPhraseBanner: true));
    }
  };
}

ThunkAction<AppState> fetchUserLocation({
  void Function() callbackIfDenied = ToNull,
}) {
  return (Store<AppState> store) async {
    if (!store.state.userState.useLiveLocation) return;

    final Position newPosition = await locationService.getUserCurrentLocation(
      callbackIfDenied: callbackIfDenied,
    );
    store.dispatch(UpdateUserLocation(newLocation: newPosition));
  };
}

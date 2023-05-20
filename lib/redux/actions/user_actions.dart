import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:vegan_liverpool/models/waitingListFunnel/waitingListEntry.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/services/apis/locationService.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/json_helpers.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/firebase.dart';

class ResetAppState {
  ResetAppState();
  @override
  String toString() => 'ResetAppState';
}

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

class SetBiometricallyAuthenticated {
  SetBiometricallyAuthenticated({required this.isBiometricallyAuthenticated});
  bool isBiometricallyAuthenticated;

  @override
  String toString() =>
      'SetBiometricallyAuthenticated : isBiometricallyAuthenticated: $isBiometricallyAuthenticated';
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

class SetUserAuthenticationStatus {
  SetUserAuthenticationStatus({
    this.firebaseStatus,
    this.vegiStatus,
    this.fuseStatus,
  });

  final FirebaseAuthenticationStatus? firebaseStatus;
  final VegiAuthenticationStatus? vegiStatus;
  final FuseAuthenticationStatus? fuseStatus;

  @override
  String toString() {
    return 'SetUserAuthenticationStatus : firebaseStatus:"${firebaseStatus?.name}", '
        'vegiStatus:"${vegiStatus?.name}", fuseStatus:"${fuseStatus?.name}"';
  }
}

// class AuthenticateFuseWalletSDKFailure {
//   AuthenticateFuseWalletSDKFailure({
//     required this.fuseStatus,
//   });

//   final FuseAuthenticationStatus fuseStatus;

//   @override
//   String toString() {
//     return 'AuthenticateFuseWalletSDKFailure : error:"$fuseStatus"';
//   }
// }

// class FetchFuseSmartWalletFailure {
//   FetchFuseSmartWalletFailure({
//     required this.fuseStatus,
//   });

//   final FuseAuthenticationStatus fuseStatus;

//   @override
//   String toString() {
//     return 'FetchFuseSmartWalletFailure : $fuseStatus';
//   }
// }

class EmailWLRegistrationSuccess {
  EmailWLRegistrationSuccess({
    required this.entry,
  });
  final WaitingListEntry entry;

  @override
  String toString() => 'EmailWLRegistrationSuccess : email: $entry';
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

class SetPhoneNumberSuccess {
  SetPhoneNumberSuccess({
    required this.countryCode,
    required this.phoneNumber,
    this.displayName,
    this.email,
  });
  final CountryCode countryCode;
  final PhoneNumber phoneNumber;
  final String? displayName;
  final String? email;

  @override
  String toString() => 'SetPhoneNumberSuccess : countryCode: $countryCode, '
      'phoneNumber: ${phoneNumber.e164}, displayName: $displayName, email: $email';
}

class LoginRequestSuccess {
  LoginRequestSuccess({
    required this.countryCode,
    required this.phoneNumber,
    this.displayName,
    this.email,
  });
  final CountryCode countryCode;
  final PhoneNumber phoneNumber;
  final String? displayName;
  final String? email;

  @override
  String toString() => 'LoginRequestSuccess : countryCode: $countryCode, '
      'phoneNumber: ${phoneNumber.e164}, displayName: $displayName, email: $email';
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

class ResetSurveyCompleted {
  ResetSurveyCompleted();

  @override
  String toString() {
    return 'ResetSurveyCompleted';
  }
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

class SetUserRoleOnVegi {
  SetUserRoleOnVegi({
    required this.userRole,
    required this.isSuperAdmin,
  });
  VegiRole userRole;
  bool isSuperAdmin;

  @override
  String toString() => 'SetUserRoleOnVegi : userRole: $userRole';
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
  AuthCredential? firebaseCredentials;

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

class SetVerificationFailed {
  SetVerificationFailed();

  @override
  String toString() {
    return 'SetVerificationFailed';
  }
}

class SetVegiSessionExpired {
  SetVegiSessionExpired();

  @override
  String toString() {
    return 'SetVegiSessionExpired';
  }
}

class SetVegiSessionCookie {
  SetVegiSessionCookie({
    required this.cookie,
  });

  final String cookie;

  @override
  String toString() {
    return 'SetVegiSessionCookie : cookie:"$cookie"';
  }
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

class SetPositionInWaitingList {
  SetPositionInWaitingList({
    required this.positionInQueue,
  });

  final int positionInQueue;

  @override
  String toString() {
    return 'SetPositionInWaitingList : positionInQueue:"$positionInQueue"';
  }
}

ThunkAction<AppState> loggedInToVegiSuccess({
  required void Function(String err) onError,
  void Function()? successHandler,
}) {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(
          SetUserAuthenticationStatus(
            vegiStatus: VegiAuthenticationStatus.authenticated,
            firebaseStatus: FirebaseAuthenticationStatus.authenticated,
          ),
        )
        ..dispatch(isBetaWhitelistedAddress());

      successHandler?.call();
    } catch (e, s) {
      log.error('ERROR - loggedInToVegiSuccess $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - loggedInToVegiSuccess $e',
      );
      onError(
        'ERROR - loggedInToVegiSuccess $e',
      );
    }
  };
}

ThunkAction<AppState> updateEmail({
  required String email,
  required void Function(String) onError,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetEmail(email));
      if (store.state.userState.waitingListEntryId == null) {
        final warning =
            'Cant update user email with vegi as no waiting list entry id is stored in state...';
        log.error(warning);
        onError(warning);
      }

      final updatedEntry = await peeplEatsService.updateEmailForAccount(
        email: email,
        waitingListEntryId: store.state.userState.waitingListEntryId!,
        onError: (errStr) {
          log.error(errStr);
          Analytics.track(
            eventName: AnalyticsEvents.emailWLUpdateEmail,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': errStr,
            },
          );
          onError?.call(errStr);
        },
      );

      if (updatedEntry != null) {
        store
          ..dispatch(
            EmailWLRegistrationSuccess(
              entry: updatedEntry,
            ),
          )
          ..dispatch(
            SetSubscribedToWaitingListUpdates(
              updatedEntry: updatedEntry,
            ),
          );
        if (updatedEntry.email.toLowerCase() == email.toLowerCase()) {
          await onBoardStrategy.updateEmail(
            email: email,
          );
        }
      }
    } catch (e, s) {
      log.error('ERROR - updateEmail $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateEmail $e',
      );
      onError(
        'ERROR - updateEmail $e',
      );
    }
  };
}

ThunkAction<AppState> registerEmailWaitingListHandler(
  String email,
  void Function()? onSuccess,
  void Function(String error)? onError,
) {
  return (Store<AppState> store) async {
    try {
      final newEntry = await peeplEatsService.registerEmailToWaitingList(
        email,
        store,
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
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.emailWLRegistration,
          properties: {
            AnalyticsProps.status: AnalyticsProps.success,
          },
        ),
      );
      if (newEntry != null) {
        store
          ..dispatch(
            EmailWLRegistrationSuccess(
              entry: newEntry,
            ),
          )
          ..dispatch(
            SetSubscribedToWaitingListUpdates(
              updatedEntry: newEntry,
            ),
          );
      }
      onSuccess?.call();
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
    store.dispatch(
      fetchPositionInWaitingListQueue(
        errorHandler: (p0) {
          onError?.call(p0);
        },
      ),
    );
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

ThunkAction<AppState> fetchPositionInWaitingListQueue({
  void Function()? successHandler,
  required void Function(String) errorHandler,
}) {
  return (Store<AppState> store) async {
    try {
      final positionInQueue = await peeplEatsService.getPositionInWaitingList(
        store.state.userState.email,
        (error) {
          return errorHandler(error);
        },
      );
      store
          .dispatch(SetPositionInWaitingList(positionInQueue: positionInQueue));

      successHandler?.call();
    } catch (e, s) {
      log.error('ERROR - fetchPositionInWaitingListQueue $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchPositionInWaitingListQueue $e',
      );
      errorHandler(
        'ERROR - fetchPositionInWaitingListQueue $e',
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
        log.warn(warning, stackTrace: StackTrace.current);
        return;
      }
      final vegiAccount = await peeplEatsService.getVegiAccountForWalletAddress(
        store.state.userState.walletAddress,
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
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.getUserForWalletAddress,
          properties: {
            AnalyticsProps.status: AnalyticsProps.success,
          },
        ),
      );
      if (vegiAccount != null) {
        store
          ..dispatch(SetUserVerifiedStatusSuccess(vegiAccount.verified))
          ..dispatch(SetUserAvatar(vegiAccount.imageUrl))
          ..dispatch(SetUserVegiAccountIdSuccess(vegiAccount.id));
        if (vegiAccount.imageUrl.isEmpty) {
          store.dispatch(
            setRandomUserAvatar(
              onError: (errStr) {
                log.error(errStr);
                Sentry.captureException(
                  errStr,
                  stackTrace: StackTrace.current, // from catch (e, s)
                  hint: 'ERROR - setRandomUserAvatar $errStr',
                );
              },
            ),
          );
        }
      }

      if (store.state.userState.isLoggedInToVegi &&
          store.state.userState.email.isNotEmpty) {
        store.dispatch(getUserDetails());
      }
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

ThunkAction<AppState> getUserDetails() {
  return (Store<AppState> store) async {
    try {
      final vegiUser = await peeplEatsService.getUserDetails(
        store.state.userState.email,
        store.state.userState.phoneNumberNoCountry,
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
      if (vegiUser != null) {
        store.dispatch(
          SetUserRoleOnVegi(
            userRole: vegiUser.role,
            isSuperAdmin: vegiUser.isSuperAdmin,
          ),
        );
      }
    } catch (e, s) {
      log.error('ERROR - getUserDetails $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getUserDetails $e',
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
        Exception('Error in isUserWalletAddressAVendorAddress: $e'),
        stackTrace: s,
        hint: 'ERROR in isUserWalletAddressAVendorAddress',
      );
    }
  };
}

ThunkAction<AppState> loginHandler(
  CountryCode countryCode,
  PhoneNumber phoneNumber,
) {
  bool _useWeb3Auth = false;
  return (Store<AppState> store) async {
    try {
      store.dispatch(setDeviceId(phoneNumber.e164));
      await Analytics.setUserId(phoneNumber.e164);
      if (store.state.userState.firebaseCredentialIsValid) {
        // try reauthentication first?...
        final reauthSucceeded = await onBoardStrategy.reauthenticateUser();
        if (reauthSucceeded) {
          return;
        }
      }
      await onBoardStrategy.login(
        store,
        phoneNumber.e164,
      );
    } catch (e, s) {
      log.error(
        'ERROR - Login Request',
        error: e,
        stackTrace: s,
      );
      store
        ..dispatch(
          SignupFailed(
            error: ErrorDetails(
              title:
                  e.toString().contains('blocked all requests from this device')
                      ? 'Verification error'
                      : 'Something went wrong',
              message: store.state.userState.isVegiSuperAdmin
                  ? 'Firebase error: $e'
                  : '$e',
            ),
          ),
        )
        ..dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.phoneAuthFailed,
            vegiStatus: VegiAuthenticationStatus.failed,
          ),
        );
      await Analytics.track(
        eventName: AnalyticsEvents.loginWithPhone,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in login with phone number: $e'),
        stackTrace: s,
        hint: 'ERROR in Login Request',
      );
    }
  };
}

ThunkAction<AppState> verifyHandler(
  String verificationCode,
) {
  return (Store<AppState> store) async {
    await onBoardStrategy.verify(
      store,
      verificationCode,
    );
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
        ..dispatch(
          authenticate(),
        ); // authenticate call should still work and will ignore the priavteKey initialiastion as has already been done above here in this method
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

/// Function to first create the single External Owner Account that can have at most
/// ONE smart wallet linked with it.
///
/// Then init Firebase Credentials if needed (they cannot be serialized and not persisted, therefore needs to be done on ever recreation of persisted store)
///
/// Then authenticate with vegi if not already signed in with persistent sessionCookie that is still active.
ThunkAction<AppState> authenticate({
  PageRouteInfo<dynamic>? routeOnSuccess,
  bool shouldReplaceAllRouteStack = true,
}) {
  return (Store<AppState> store) async {
    routeOnSuccess ??= const MainScreen();
    if (store.state.onboardingState.signupIsInFlux) {
      log.warn(
        'Authentication already in flux, ignoring subsequent request',
        stackTrace: StackTrace.current,
      );
      return;
    }
    store.dispatch(SignupLoading(isLoading: true));

    // * Fuse Auth & Fetch
    try {
      final newFuseAuthStatus = await _initFuseWallet(store);
      if (![
        FuseAuthenticationStatus.authenticated,
        FuseAuthenticationStatus.created,
        FuseAuthenticationStatus.creationStarted,
        FuseAuthenticationStatus.creationSucceeded,
      ].contains(store.state.userState.fuseAuthenticationStatus)) {
        log.warn(
            'Fuse init pipeline did not work... status: FuseAuthenticationStatus.[${store.state.userState.fuseAuthenticationStatus.name}]');
      }

      // TODO: Check that allowign this to return if valid vegi session even if firebase has expired breaks app or not?...
      store.dispatch(checkIfVegiSessionIsValid());
      if (store.state.userState.vegiAuthenticationStatus ==
          VegiAuthenticationStatus.authenticated) {
        return;
      }

      // * Firebase Auth
      Future<void> pushSignUpScreen() async {
        store
          ..dispatch(SignupLoading(isLoading: false))
          ..dispatch(
            SetUserAuthenticationStatus(
              firebaseStatus: FirebaseAuthenticationStatus.beginAuthentication,
            ),
          );
        log.info(
            'ReplaceAll with SignUpScreen() from ${rootRouter.current.name} in authenticate thunk.');
        await rootRouter.replaceAll(
            [const SignUpScreen()]); // ~ https://stackoverflow.com/a/46713257
        return;
      }

      // reauth if not already authenticated with firebase.
      if (store.state.userState.firebaseSessionToken?.isEmpty ?? true) {
        if (store.state.userState.firebaseCredentialIsValid) {
          store.dispatch(SignupLoading(isLoading: true));
          final reauthSucceeded = await onBoardStrategy.reauthenticateUser();
          store.dispatch(SignupLoading(isLoading: false));
          if (!reauthSucceeded) {
            return pushSignUpScreen();
          }
        } else {
          // unable to reauth firebase so nav to SignUpScreen and return;
          return pushSignUpScreen();
        }
      }

      // * vegi Auth
      // use firebaseAuth SessionToken to authenticate vegi. From here we are sure that firebaseSessionToken is live.
      store.dispatch(SignupLoading(isLoading: true));
      final vegiAuthResult = await onBoardStrategy.loginToVegi(
        store: store,
        phoneNumber: store.state.userState.phoneNumber,
        firebaseSessionToken: store.state.userState.firebaseSessionToken!,
      );
      if (vegiAuthResult != LoggedInToVegiResult.success) {
        log.warn(
            'Failed to authenticate with vegi: LoggedInToVegiResult.[${vegiAuthResult.name}]');
        // finish by navigating to MainScreen regardless
      }
      store
        ..dispatch(ReLogin())
        ..dispatch(SignupLoading(isLoading: false));
      if (shouldReplaceAllRouteStack) {
        await rootRouter.replaceAll([routeOnSuccess!]);
      } else {
        await rootRouter.push(routeOnSuccess!);
      }
      return;
    } catch (e, s) {
      log.error(
        'ERROR - authenticate $e',
        stackTrace: s,
      );
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - authenticate $e',
      );
      store.dispatch(SignupLoading(isLoading: false));
    }
  };
}

bool fuseSDKNeedsAuthenticationFirst({
  required DC<Exception, SmartWallet> walletData,
}) {
  return walletData.hasError &&
      walletData.error.toString().contains('LateInit');
}

/// Function to create the single External Owner Account that can have at most
/// ONE smart wallet linked with it.
Future<FuseAuthenticationStatus> _initFuseWallet(Store<AppState> store) async {
  store.dispatch(
    SetUserAuthenticationStatus(
      fuseStatus: FuseAuthenticationStatus.loading,
    ),
  );

  // * Fuse - Create PrivateKey
  if (store.state.userState.fuseWalletCredentials == null ||
      store.state.userState.privateKey.isEmpty) {
    try {
      // Generate a random Ethereum private key
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
      store.dispatch(
        SetUserAuthenticationStatus(
          fuseStatus:
              FuseAuthenticationStatus.failedCreateLocalAccountPrivateKey,
        ),
      );
      return FuseAuthenticationStatus.failedCreateLocalAccountPrivateKey;
    }
    if (store.state.userState.privateKey.isEmpty) {
      store.dispatch(
        SetUserAuthenticationStatus(
          fuseStatus:
              FuseAuthenticationStatus.failedCreateLocalAccountPrivateKey,
        ),
      );
      return FuseAuthenticationStatus.failedCreateLocalAccountPrivateKey;
    }
  }

  // * FUSE - Fetch/Create Wallet from FuseSDK
  try {
    // Try to fetch a wallet for the EOA, if it doesn't exist create one
    final walletData = await fuseWalletSDK.fetchWallet();
    if (walletData.hasData) {
      final smartWallet = walletData.data!;
      log.info(
          'Successfully refetched smart wallet address ${smartWallet.smartWalletAddress}');
      store
        ..dispatch(
          saveSmartWallet(
            smartWallet: fuseWalletSDK.smartWallet,
          ),
        )
        ..dispatch(
          SetUserAuthenticationStatus(
            fuseStatus: FuseAuthenticationStatus.authenticated,
          ),
        );
    } else if (walletData.hasError) {
      // } else if (fuseSDKNeedsAuthenticationFirst(walletData: walletData)) {
      final exception = walletData.error!;
      if (exception.toString().contains('LateInit')) {
        // * FUSE - Authenticate SDK
        if (store.state.userState.jwtToken.isEmpty) {
          try {
            final EthPrivateKey credentials =
                EthPrivateKey.fromHex(store.state.userState.privateKey);
            final DC<Exception, String> authRes =
                await fuseWalletSDK.authenticate(
              credentials,
            );
            if (authRes.hasData) {
              final jwt = authRes.data!;
              store
                ..dispatch(LoginVerifySuccess(jwt))
                ..dispatch(
                  SetUserAuthenticationStatus(
                    fuseStatus: FuseAuthenticationStatus.created,
                  ),
                );
              fuseWalletSDK.jwtToken = jwt;
            } else if (authRes.hasError) {
              store
                ..dispatch(
                  SetUserAuthenticationStatus(
                    fuseStatus: FuseAuthenticationStatus.failedAuthentication,
                  ),
                )
                ..dispatch(
                  SignupFailed(
                    error: ErrorDetails(
                      title: 'Fuse authentication failed',
                      message:
                          'Error occurred in authenticate: ${authRes.error}',
                    ),
                  ),
                );
              return FuseAuthenticationStatus.failedAuthentication;
            }
          } catch (e, s) {
            store.dispatch(
              SetUserAuthenticationStatus(
                fuseStatus: FuseAuthenticationStatus.failedAuthentication,
              ),
            );
            final errMsg =
                'Bad AuthRes from Fuse Authentication did not contain either data or an error: $e';
            log.error(errMsg, stackTrace: s);
            await Sentry.captureException(
              errMsg,
              stackTrace: s, // from catch (err, s)
              hint: 'ERROR - user_actions.authenticateFuseWalletSDK $errMsg',
            );

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
        } else {
          fuseWalletSDK.jwtToken = store.state.userState.jwtToken;
        }
        // Try to REfetch wallet for the EOA, if it doesn't exist create one
        final walletData = await fuseWalletSDK.fetchWallet();
        if (walletData.hasData) {
          final smartWallet = walletData.data!;
          log.info(
              'Successfully refetched smart wallet address ${smartWallet.smartWalletAddress}');
          store
            ..dispatch(
              saveSmartWallet(
                smartWallet: fuseWalletSDK.smartWallet,
              ),
            )
            ..dispatch(
              SetUserAuthenticationStatus(
                fuseStatus: FuseAuthenticationStatus.authenticated,
              ),
            );
        } else if (walletData.hasError) {
          final exception = walletData.error!;
          if (exception.toString().contains('LateInit')) {
            store.dispatch(
              SetUserAuthenticationStatus(
                fuseStatus: FuseAuthenticationStatus
                    .failedToAuthenticateWalletSDKWithJWTTokenAfterInitialisationAttempt,
              ),
            );
            return FuseAuthenticationStatus
                .failedToAuthenticateWalletSDKWithJWTTokenAfterInitialisationAttempt;
          } else {
            // we move to createWallet call below
            store.dispatch(
              SetUserAuthenticationStatus(
                fuseStatus: FuseAuthenticationStatus.createWalletForEOA,
              ),
            );
            final walletCreationResult = await fuseWalletSDK.createWallet();
            if (walletCreationResult.hasData) {
              store
                ..dispatch(
                  SetUserAuthenticationStatus(
                    fuseStatus: FuseAuthenticationStatus.created,
                  ),
                )
                ..dispatch(
                  SignupLoading(
                    isLoading: false,
                  ),
                );
              walletCreationResult.data!.listen(
                (SmartWalletEvent event) {
                  if (event.name == 'smartWalletCreationStarted') {
                    log.info('smartWalletCreationStarted ${event.data}');
                    store.dispatch(
                      SetUserAuthenticationStatus(
                        fuseStatus: FuseAuthenticationStatus.creationStarted,
                      ),
                    );
                  } else if (event.name == 'transactionHash') {
                    log.info('transactionHash ${event.data}');
                  } else if (event.name == 'smartWalletCreationSucceeded') {
                    log.info('smartWalletCreationSucceeded ${event.data}');
                    store.dispatch(
                      SetUserAuthenticationStatus(
                        fuseStatus: FuseAuthenticationStatus.creationSucceeded,
                      ),
                    );
                    //todo:remove the below log
                    log.info(
                      event.data,
                      stackTrace: StackTrace.current,
                    );
                    //todo: does the walletAddress exist within event.data?
                    fuseWalletSDK.fetchWallet().then((walletData) {
                      if (walletData.hasData) {
                        final smartWallet = walletData.data!;
                        log.info(
                            'Successfully refetched smart wallet address ${smartWallet.smartWalletAddress}');
                        store
                          ..dispatch(
                            saveSmartWallet(
                              smartWallet: fuseWalletSDK.smartWallet,
                            ),
                          )
                          ..dispatch(
                            SetUserAuthenticationStatus(
                              fuseStatus:
                                  FuseAuthenticationStatus.authenticated,
                            ),
                          );
                      } else if (walletData.hasError) {
                        final exception = walletData.error!;
                        if (exception.toString().contains('LateInit')) {
                          store.dispatch(
                            SetUserAuthenticationStatus(
                              fuseStatus: FuseAuthenticationStatus
                                  .failedToAuthenticateWalletSDKWithJWTTokenAfterInitialisationAttempt,
                            ),
                          );
                          return null;
                        } else {
                          // we move to createWallet call below
                          store.dispatch(
                            SetUserAuthenticationStatus(
                              fuseStatus:
                                  FuseAuthenticationStatus.createWalletForEOA,
                            ),
                          );
                        }
                      }
                    });
                  } else if (event.name == 'smartWalletCreationFailed') {
                    log.error('smartWalletCreationFailed ${event.data}');
                    store.dispatch(
                      SetUserAuthenticationStatus(
                        fuseStatus: FuseAuthenticationStatus.failedCreate,
                      ),
                    );
                  } else {
                    log.warn(
                        'No event handler for fuseWalletSDK.fetchWallet event: '
                        '"${event.name}"');
                  }
                },
                cancelOnError: true,
                onError: (dynamic error) {
                  log.error(
                    error,
                    stackTrace: StackTrace.current,
                  );
                  Sentry.captureException(
                    error,
                    stackTrace: StackTrace.current, // from catch (err, s)
                    hint:
                        'ERROR - user_actions.dart.createLocalAccountCall[createWalletStream] $error',
                  );
                },
              );
            } else if (walletCreationResult.hasError) {
              log.error(walletCreationResult.error.toString());
              store
                ..dispatch(
                  SetUserAuthenticationStatus(
                    fuseStatus: FuseAuthenticationStatus.failedCreate,
                  ),
                )
                ..dispatch(
                  SignupLoading(
                    isLoading: false,
                  ),
                );
              return FuseAuthenticationStatus.failedCreate;
            }
          }
        }
      }
    }
    return store.state.userState.fuseAuthenticationStatus;
  } catch (e, s) {
    log.error(
      'ERROR - fetchFuseSmartWallet',
      error: e,
      stackTrace: s,
    );
    store
      ..dispatch(
        SetUserAuthenticationStatus(
          fuseStatus: FuseAuthenticationStatus.failedFetch,
        ),
      )
      ..dispatch(
        SignupLoading(
          isLoading: false,
        ),
      );
    await Sentry.captureException(
      Exception('Error in setup wallet call: $e'),
      stackTrace: s,
      hint: 'ERROR - fetchFuseSmartWallet',
    );
    return FuseAuthenticationStatus.failedFetch;
  }
}

// ThunkAction<AppState> authenticateFuseWalletSDK({
//   void Function()? onSuccess,
//   void Function(String message)? onFailure,
// }) {
//   onFailure ??= log.error;
//   onSuccess ??= () => log.info('authenticateFuseWalletSDK succeeded');
//   return (Store<AppState> store) async {
//     try {
//       if (store.state.userState.privateKey.isEmpty) {
//         store
//           ..dispatch(
//             SetUserAuthenticationStatus(
//               fuseStatus: FuseAuthenticationStatus
//                   .failedAuthenticationAsMissingUserDetailsToAuthFuseWallet,
//             ),
//           )
//           ..dispatch(
//             createLocalAccountCall(() {
//               if (store.state.userState.privateKey.isEmpty) {
//                 store.dispatch(
//                   SetUserAuthenticationStatus(
//                     fuseStatus: FuseAuthenticationStatus
//                         .failedCreateLocalAccountPrivateKey,
//                   ),
//                 );
//               }
//             }),
//           );
//         return onFailure!(
//           'User details missing from reauthentication in authenticateFuseWalletSDK',
//         );
//       }
//       store.dispatch(
//         SetUserAuthenticationStatus(
//           fuseStatus: FuseAuthenticationStatus.loading,
//         ),
//       );
//       final EthPrivateKey credentials =
//           EthPrivateKey.fromHex(store.state.userState.privateKey);
//       final DC<Exception, String> authRes = await fuseWalletSDK.authenticate(
//         credentials,
//       );
//       if (authRes.hasError) {
//         store.dispatch(
//           SetUserAuthenticationStatus(
//             fuseStatus: FuseAuthenticationStatus.failedAuthentication,
//           ),
//         );
//         onFailure!('Error occurred in authenticate: ${authRes.error}');
//       } else if (authRes.hasData) {
//         final jwt = authRes.data!;
//         store
//           ..dispatch(LoginVerifySuccess(jwt))
//           ..dispatch(
//             SetUserAuthenticationStatus(
//               fuseStatus: FuseAuthenticationStatus.created,
//             ),
//           );
//         fuseWalletSDK.jwtToken = jwt;
//         store.dispatch(fetchFuseSmartWallet());
//       } else {
//         store.dispatch(
//           SetUserAuthenticationStatus(
//             fuseStatus: FuseAuthenticationStatus.failedAuthentication,
//           ),
//         );
//         final errMsg =
//             'Bad AuthRes from Fuse Authentication did not contain either data or an error: $authRes';
//         log.error(
//           errMsg,
//           stackTrace: StackTrace.current,
//         );
//         await Sentry.captureException(
//           errMsg,
//           stackTrace: StackTrace.current, // from catch (err, s)
//           hint: 'ERROR - user_actions.authenticateFuseWalletSDK $errMsg',
//         );
//       }
//     } catch (e, s) {
//       store.dispatch(
//         SetUserAuthenticationStatus(
//           fuseStatus: FuseAuthenticationStatus.failedAuthentication,
//         ),
//       );
//       final errMsg =
//           'Bad AuthRes from Fuse Authentication did not contain either data or an error: $e';
//       log.error(errMsg, stackTrace: s);
//       await Sentry.captureException(
//         errMsg,
//         stackTrace: s, // from catch (err, s)
//         hint: 'ERROR - user_actions.authenticateFuseWalletSDK $errMsg',
//       );
//       onFailure!('Error in authenticateFuseWalletSDK: $e');
//       log.error(
//         'ERROR - authenticateFuseWalletSDK',
//         error: e,
//         stackTrace: s,
//       );
//       await Sentry.captureException(
//         Exception('Error in authenticateFuseWalletSDK: $e'),
//         stackTrace: s,
//         hint: 'ERROR - authenticateFuseWalletSDK',
//       );
//     }
//   };
// }

// ThunkAction<AppState> fetchFuseSmartWallet({
//   void Function()? onSuccess,
//   void Function(Exception error)? onFailure,
//   void Function(Exception error)? onError,
//   bool allowRetry = true,
// }) {
//   return (Store<AppState> store) async {
//     store.dispatch(
//       SetUserAuthenticationStatus(
//         fuseStatus: FuseAuthenticationStatus.loading,
//       ),
//     );

//     //TODO: Move this whole flow within createLocalAccount function and rename so that all in one function and if we jsut want to fetch the wallet, we always first check if need a local account or authenticate....
//     try {
//       if (_smartWalletInitialised(fuseWalletSDK, store)) {
//         store
//           ..dispatch(
//             saveSmartWallet(
//               smartWallet: fuseWalletSDK.smartWallet,
//             ),
//           )
//           ..dispatch(
//             SetUserAuthenticationStatus(
//               fuseStatus: FuseAuthenticationStatus.authenticated,
//             ),
//           );
//         return onSuccess?.call();
//       }
//       // Try to fetch a wallet for the EOA, if it doesn't exist create one
//       final walletData = await fuseWalletSDK.fetchWallet();

//       walletData.pick(
//         onData: (SmartWallet smartWallet) async {
//           log.info(
//               'Successfully refetched smart wallet address ${smartWallet.smartWalletAddress}');
//           store
//             ..dispatch(
//               saveSmartWallet(
//                 smartWallet: fuseWalletSDK.smartWallet,
//               ),
//             )
//             ..dispatch(
//               SetUserAuthenticationStatus(
//                 fuseStatus: FuseAuthenticationStatus.authenticated,
//               ),
//             );
//           onSuccess?.call();
//         },
//         onError: (Exception exception) async {
//           store.dispatch(
//             SetUserAuthenticationStatus(
//               fuseStatus: FuseAuthenticationStatus.failedFetch,
//             ),
//           );
//           if (allowRetry &&
//               exception.toString().contains('LateInit') &&
//               store.state.userState.jwtToken != '') {
//             fuseWalletSDK.jwtToken = store.state.userState.jwtToken;
//             store
//               ..dispatch(
//                 SetUserAuthenticationStatus(
//                   fuseStatus: FuseAuthenticationStatus.loading,
//                 ),
//               )
//               ..dispatch(
//                 authenticateFuseWalletSDK(),
//               )
//               ..dispatch(
//                 fetchFuseSmartWallet(
//                   onSuccess: onSuccess,
//                   onFailure: onFailure,
//                   onError: onError,
//                   allowRetry: false,
//                 ),
//               );
//             return;
//           }
//           final exceptionOrStream = await fuseWalletSDK.createWallet();
//           if (exceptionOrStream.hasError) {
//             log.error(exceptionOrStream.error.toString());
//             store.dispatch(
//               SetUserAuthenticationStatus(
//                 fuseStatus: FuseAuthenticationStatus.failedCreate,
//               ),
//             );
//           } else if (exceptionOrStream.hasData) {
//             exceptionOrStream.data!.listen(
//               (SmartWalletEvent event) {
//                 if (event.name == 'smartWalletCreationStarted') {
//                   log.info('smartWalletCreationStarted ${event.data}');
//                 } else if (event.name == 'transactionHash') {
//                   log.info('transactionHash ${event.data}');
//                 } else if (event.name == 'smartWalletCreationSucceeded') {
//                   log.info('smartWalletCreationSucceeded ${event.data}');
//                   onSuccess?.call();
//                 } else if (event.name == 'smartWalletCreationFailed') {
//                   log.error('smartWalletCreationFailed ${event.data}');
//                   store.dispatch(
//                     SetUserAuthenticationStatus(
//                       fuseStatus: FuseAuthenticationStatus.failedCreate,
//                     ),
//                   );
//                   onFailure?.call(exception);
//                 } else {
//                   log.info(
//                       'No event handler for fuseWalletSDK.fetchWallet event: '
//                       '"${event.name}"');
//                 }
//               },
//               cancelOnError: true,
//               onError: (error) {
//                 log.error('Error occurred: $error');
//                 onError?.call(error as Exception);
//               },
//             );
//           }
//         },
//       );
//     } catch (e, s) {
//       log.error(
//         'ERROR - fetchFuseSmartWallet',
//         error: e,
//         stackTrace: s,
//       );
//       store.dispatch(
//         SetUserAuthenticationStatus(
//           fuseStatus: FuseAuthenticationStatus.failedFetch,
//         ),
//       );
//       onFailure?.call(
//         Exception('Error in setup wallet call: $e'),
//       );
//       await Sentry.captureException(
//         Exception('Error in setup wallet call: ${e.toString()}'),
//         stackTrace: s,
//         hint: 'ERROR - fetchFuseSmartWallet',
//       );
//     }
//   };
// }

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

ThunkAction<AppState> checkIfVegiSessionIsValid() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        SignupLoading(
          isLoading: true,
        ),
      );
      final sessionStillValid =
          await peeplEatsService.checkVegiSessionIsStillValid();
      if (sessionStillValid) {
        store
          ..dispatch(
            SignupLoading(
              isLoading: false,
            ),
          )
          ..dispatch(
            SetUserAuthenticationStatus(
              firebaseStatus: FirebaseAuthenticationStatus.authenticated,
              vegiStatus: VegiAuthenticationStatus.authenticated,
            ),
          );
        return;
      } else {
        store
          ..dispatch(
            SignupLoading(
              isLoading: false,
            ),
          )
          ..dispatch(
            SetUserAuthenticationStatus(
              vegiStatus: VegiAuthenticationStatus.unauthenticated,
            ),
          );
      }
    } on Exception catch (error, s) {
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus:
              FirebaseAuthenticationStatus.phoneAuthReauthenticationFailed,
        ),
      );
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

ThunkAction<AppState> reAuthenticateOnBoarding() {
  return (Store<AppState> store) async {
    try {
      final sessionStillValid =
          await peeplEatsService.checkVegiSessionIsStillValid();
      if (sessionStillValid) {
        store.dispatch(
          SetUserAuthenticationStatus(
            firebaseStatus: FirebaseAuthenticationStatus.authenticated,
            vegiStatus: VegiAuthenticationStatus.authenticated,
          ),
        );
        return;
      }
      if (store.state.userState.firebaseCredentialIsValid) {
        // try reauthentication first?...
        final reauthSucceeded = await onBoardStrategy.reauthenticateUser();
      }
    } on Exception catch (error, s) {
      store.dispatch(
        SetUserAuthenticationStatus(
          firebaseStatus:
              FirebaseAuthenticationStatus.phoneAuthReauthenticationFailed,
        ),
      );
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

ThunkAction<AppState> reLoginCall() {
  return (Store<AppState> store) async {
    store
      ..dispatch(ReLogin())
      ..dispatch(
        authenticate(),
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

ThunkAction<AppState> setRandomUserAvatar({
  required void Function(String err) onError,
  void Function()? onSuccess,
}) {
  return (Store<AppState> store) async {
    try {
      updateFirebaseCurrentUser(({required User firebaseUser}) async {
        final imageUrl = await peeplEatsService.setRandomAvatar(
          accountId: store.state.userState.vegiAccountId!.round(),
          onError: (error) async {
            log.error(
              'ERROR - peeplEatsService.setRandomAvatar',
              error: error,
              stackTrace: StackTrace.current,
            );
            await Sentry.captureException(
              Exception('ERROR - peeplEatsService.setRandomAvatar'),
              stackTrace: StackTrace.current,
            );
          },
        );
        if (imageUrl.isNotEmpty) {
          await firebaseUser.updatePhotoURL(imageUrl);
          store.dispatch(SetUserAvatar(imageUrl));
          onSuccess?.call();
        }
      });
    } catch (e, s) {
      log.error(
        'ERROR - getRandomUserAvatar',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception(
            'Error in update user profile image [getRandomUserAvatar]: ${e.toString()}'),
        stackTrace: s,
        hint: 'Error in update user profile image',
      );
      store.dispatch(SetUserAvatar(''));
    }
  };
}

ThunkAction<AppState> updateUserAvatarCall(
  ImageSource source, {
  required ProgressCallback progressCallback,
  required void Function() onSuccess,
  void Function(String errStr)? onError,
}) {
  return (Store<AppState> store) async {
    if (store.state.userState.vegiAccountId == null) {
      log.error(
          'No Account is set on vegi for user. Please login and retrieve account details first.');
      await Sentry.captureException(
        'No Account is set on vegi for user. Please login and retrieve account details first.',
        stackTrace: StackTrace.current,
      );
      return;
    }
    XFile? file;
    try {
      file = await ImagePicker().pickImage(source: source);
    } on PlatformException catch (err, s) {
      if (err.code == 'invalid_image' &&
          err.details == 'NSItemProviderErrorDomain') {
        log.error(
          'Image seems to be corrupt. See https://stackoverflow.com/questions/75492854/platformexceptioninvalid-image-cannot-load-representation-of-type-public-jpeg. \nTry uploading a different image. Message was: "${err.message}"',
          stackTrace: s,
        );
      } else {
        log.error(err);
      }
    } on Exception catch (e, s) {
      log.error(e, stackTrace: s);
    }
    if (file != null) {
      try {
        updateFirebaseCurrentUser(({required User firebaseUser}) async {
          final imageUrl = await peeplEatsService.uploadImageForUserAvatar(
            image: File(file!.path),
            accountId: store.state.userState.vegiAccountId!.round(),
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
              onError?.call(error);
            },
            onReceiveProgress: progressCallback,
          );
          if (imageUrl != null) {
            await firebaseUser.updatePhotoURL(imageUrl);
            store.dispatch(SetUserAvatar(imageUrl));
            onSuccess?.call();
          }
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

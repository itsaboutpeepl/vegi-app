import 'dart:ffi';
import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/utils/constants.dart' as VegiConstants;
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/version.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

String currencyJson(String? currency) => currency ?? 'usd';

BiometricAuth? authTypeFromJson(String auth) =>
    EnumToString.fromString(BiometricAuth.values, auth);

Locale localeFromJson(Map<String, dynamic>? map) => map == null
    ? const Locale('en', 'US')
    : Locale(map['languageCode'].toString(), map['countryCode'].toString());

Map<String, dynamic> localeToJson(Locale? locale) => locale == null
    ? {'languageCode': 'en', 'countryCode': 'US'}
    : {'languageCode': locale.languageCode, 'countryCode': locale.countryCode};

EthPrivateKey? ethPrivateKeyFromJson(dynamic value) =>
    tryCatchInline<EthPrivateKey?>(
      () => value == null || value == ''
          ? null
          : EthPrivateKey.fromInt(BigInt.parse(value as String)),
      null,
      silent: false,
    );

String ethPrivateKeyToJson(EthPrivateKey? ethPk) {
  return ethPk == null ? '' : ethPk.privateKeyInt.toString();
}

// Map<String, dynamic>? authCredentialToJson(AuthCredential? credential) {
//   return credential?.asMap();
// }

// AuthCredential? authCredentialFromJson(dynamic json) {
//   return json == null
//       ? null
//       : json is Map && (json as Map).containsKey('verificationId')
//           ? PhoneAuthCredential( //remove the whole thing and return to ignoring this whole thing...
//               providerId: json['providerId'] as String,
//               token: json['token'] as int?,
//               accessToken: json['accessToken'] as String?,
//               signInMethod: json['signInMethod'] as String,
//             )
//           : AuthCredential(
//               providerId: json['providerId'] as String,
//               token: json['token'] as int?,
//               accessToken: json['accessToken'] as String?,
//               signInMethod: json['signInMethod'] as String,
//             );
// }

@freezed
class UserState with _$UserState {
  @JsonSerializable()
  factory UserState({
    @JsonKey(ignore: true)
        String? wcURI,
    WalletModules? walletModules,
    DateTime? installedAt,
    bool? isContactsSynced,
    @Default(true)
        bool isLoggedOut,
    @Default(false)
        bool scrollToTop,

    /// * The wallet address is a smart contract wallet which actually conducts payments, holds balances, etc.
    /// * So basically, there are 3 types of stake folder in the fuse network technically speaking,
    /// there are wallet addresses which are opinionless dapps or smart contracts or classes that only
    /// act when given a request and either succeed or fail to perform an action.
    /// Then you have account addresses, these are the accounts that simply own wallets and are allowed to
    /// direct wallet dapps to perform transfers or any other action.
    /// Then finally there is the community manager address that also has power
    /// to direct wallet addresses that it does not necessarily own to perform functions such as transfers.
    @Default('')
        String walletAddress,

    /// * the account address simply signs transactions 'on behalf' of the smart contract wallet.
    /// This is so only people who verify their phone numbers can create wallets or something.
    /// Fuse would be able to give you more information
    ///
    /// The account address is a 'real' wallet generated on the device which is only stored on the device.
    // @Default('') String accountAddress,
    @Default('')
        String privateKey,
    @JsonKey(fromJson: ethPrivateKeyFromJson, toJson: ethPrivateKeyToJson)
    @Default(null)
        EthPrivateKey? fuseWalletCredentials,
    @JsonKey(ignore: true)
    @Default(VegiAuthenticationStatus.unauthenticated)
        VegiAuthenticationStatus vegiAuthenticationStatus,
    @Default(FirebaseAuthenticationStatus.unauthenticated)
        FirebaseAuthenticationStatus firebaseAuthenticationStatus,
    @Default(FuseAuthenticationStatus.unauthenticated)
        FuseAuthenticationStatus fuseAuthenticationStatus,
    @Default(false)
        bool backup,
    @Default([])
        List<String> networks,
    @Default([])
        List<String> mnemonic,
    @Default('')
        String pincode,
    @Default('')
        String countryCode,
    @Default('')
        String phoneNumber,
    @Default('')
        String phoneNumberNoCountry,
    @Default(false)
        bool warnSendDialogShowed,
    @Default('')
        String isoCode,
    @Default('')
        String jwtToken,
    @Default(VegiConstants.defaultDisplayName)
        String displayName,
    @Default('')
        String avatarUrl,
    @Default(PreferredSignonMethod.phone)
        PreferredSignonMethod preferredSignonMethod,
    @Default('')
        String email,
    @Default(null)
        String? password,
    String? verificationId,
    @Default(false)
        bool verificationPassed,
    @Default('')
        String identifier,
    @Default(false)
    bool appUpdateNeeded,
    @JsonKey(fromJson: Version.fromJson, toJson: Version.toJson,)
    @Default(null)
    Version? appUpdateNextVersion,
    @JsonKey(fromJson: Version.fromJson,
      toJson: Version.toJson,)
    @Default(null)
    Version? appUpdateNotificationSeenForBuildNumber,
    @Default([])
        List<String> syncedContacts,
    @Default({})
        Map<String, String> reverseContacts,
    @Default('usd')
        String currency,
    @JsonKey(ignore: true)
    @Default(false)
        bool hasUpgrade,
    @Default(BiometricAuth.none)
        BiometricAuth authType,
    @JsonKey(ignore: true)
    @Default(false)
        bool biometricallyAuthenticated,
    @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
        Locale? locale,
    @JsonKey(
      // fromJson: authCredentialFromJson,
      // toJson: authCredentialToJson,
      ignore: true,
    )
    @Default(null)
        AuthCredential? firebaseCredentials,
    @Default(null)
        String? firebaseSessionToken,
    @Default(null)
        String? vegiSessionCookie,
    @Default([])
        List<DeliveryAddresses> listOfDeliveryAddresses,
    @Default(false)
        bool hasSavedSeedPhrase,
    @Default(false)
        bool useLiveLocation,
    @Default(false)
    @JsonKey(ignore: true)
        bool userIsVerified,
    @Default(null)
    @JsonKey(ignore: true)
        Position? userLocation,
    @Default(false)
    @JsonKey(ignore: true)
        bool isUsingSimulator,
    @Default(false)
    @JsonKey(ignore: true)
        bool isUsingIosSimulator,
    @Default('')
        String initialLoginDateTime,
    @Default(false)
        bool showSeedPhraseBanner,
    @Default([])
    @JsonKey(ignore: true)
        List<SurveyQuestion> surveyQuestions,
    @Default(false)
        bool surveyCompleted,
    @Default('')
        String surveyEmailUsed,
    @Default(false)
        bool isVendor,
    @Default(null)
        String? stripeCustomerId,
    @Default(null)
        int? vegiAccountId,
    @Default(false)
        bool isVegiSuperAdmin,
    @Default(VegiRole.consumer)
        VegiRole userVegiRole,
    @Default(null)
        int? positionInWaitingList,
    @Default(false)
        bool subscribedToWaitingListUpdates,
    @Default(null)
        int? waitingListEntryId,
    @Default(0)
        int loginCounter,
  }) = _UserState;

  const UserState._();

  factory UserState.initial() => UserState(
        networks: [],
        mnemonic: [],
        syncedContacts: [],
        reverseContacts: <String, String>{},
        displayName: VegiConstants.defaultDisplayName,
        isLoggedOut: true,
        authType: BiometricAuth.none,
        currency: 'gbp',
        useLiveLocation: false,
        biometricallyAuthenticated: false,
        listOfDeliveryAddresses: [],
        surveyQuestions: [],
        surveyCompleted: false,
        surveyEmailUsed: '',
        isVendor: false,
        isUsingSimulator: false,
        isUsingIosSimulator: false,
        loginCounter: 0,
      );

  factory UserState.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$UserStateFromJson(json),
      );

  String get accountAddress => fuseWalletCredentials?.address.toString() ?? '';
  bool get accountDetailsExist =>
      accountAddress.isNotEmpty && walletAddress.isNotEmpty;
  bool get firebaseCredentialIsValid =>
      firebaseCredentials != null &&
      (firebaseCredentials is PhoneAuthCredential
          ? (firebaseCredentials! as PhoneAuthCredential).verificationId != null
          : true);

  bool get isLoggedInToVegi =>
      firebaseAuthenticationStatus ==
          FirebaseAuthenticationStatus.authenticated &&
      vegiAuthenticationStatus == VegiAuthenticationStatus.authenticated;

  bool get hasLoggedInBefore =>
      authType != BiometricAuth.none || vegiAccountId != null;

  EthPrivateKey get fuseWalletCredentialsNotNull {
    if (fuseWalletCredentials == null) {
      final e = Exception(
          'No user credentials available for current user: "$displayName"');
      log.error(e);
      Sentry.captureException(
        e,
        stackTrace: StackTrace.current,
        hint: 'ERROR - fuseWalletCredentials should not be null',
      );
      throw e;
    }
    return fuseWalletCredentials!;
  }
}

class UserStateConverter
    implements JsonConverter<UserState, Map<String, dynamic>?> {
  const UserStateConverter();

  @override
  UserState fromJson(Map<String, dynamic>? json) => tryCatchRethrowInline(
        () => json != null ? UserState.fromJson(json) : UserState.initial(),
      );

  @override
  Map<String, dynamic> toJson(UserState instance) => tryCatchRethrowInline(
        () => instance.toJson(),
      );
}

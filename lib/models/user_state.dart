import 'package:charge_wallet_sdk/models/wallet_modules/wallet_modules.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

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

@freezed
class UserState with _$UserState {
  @JsonSerializable()
  factory UserState({
    @JsonKey(ignore: true) String? wcURI,
    String? contractVersion,
    WalletModules? walletModules,
    DateTime? installedAt,
    bool? isContactsSynced,
    @Default(true) bool isLoggedOut,
    @Default(false) bool backup,
    @Default(false) bool scrollToTop,

    /// * The wallet address is a smart contract wallet which actually conducts payments, holds balances, etc.
    /// * So basically, there are 3 types of stake folder in the fuse network technically speaking,
    /// there are wallet addresses which are opinionless dapps or smart contracts or classes that only
    /// act when given a request and either succeed or fail to perform an action.
    /// Then you have account addresses, these are the accounts that simply own wallets and are allowed to
    /// direct wallet dapps to perform transfers or any other action.
    /// Then finally there is the community manager address that also has power
    /// to direct wallet addresses that it does not necessarily own to perform functions such as transfers.
    @Default('') String walletAddress,

    /// * the account address simply signs transactions 'on behalf' of the smart contract wallet.
    /// This is so only people who verify their phone numbers can create wallets or something.
    /// Fuse would be able to give you more information
    ///
    /// The account address is a 'real' wallet generated on the device which is only stored on the device.
    @Default('') String accountAddress,
    @Default('') String privateKey,
    @Default([]) List<String> networks,
    @Default([]) List<String> mnemonic,
    @Default('') String pincode,
    @Default('') String countryCode,
    @Default('') String phoneNumber,
    @Default(false) bool warnSendDialogShowed,
    @Default('') String isoCode,
    @Default('') String jwtToken,
    @Default('Anom') String displayName,
    @Default('') String avatarUrl,
    @Default('') String email,
    String? verificationId,
    @Default('') String identifier,
    @Default([]) List<String> syncedContacts,
    @Default({}) Map<String, String> reverseContacts,
    @Default('usd') String currency,
    @JsonKey(ignore: true) @Default(false) bool hasUpgrade,
    @Default(BiometricAuth.none) BiometricAuth authType,
    @JsonKey(fromJson: localeFromJson, toJson: localeToJson) Locale? locale,
    @JsonKey(ignore: true) PhoneAuthCredential? credentials,
    @Default([]) List<DeliveryAddresses> listOfDeliveryAddresses,
    @Default(false) bool hasSavedSeedPhrase,
    @Default(false) bool useLiveLocation,
    @Default(false) @JsonKey(ignore: true) bool userIsVerified,
    @Default(null) @JsonKey(ignore: true) Position? userLocation,
    @Default(false) @JsonKey(ignore: true) bool isUsingSimulator,
    @Default(false) @JsonKey(ignore: true) bool isUsingIosSimulator,
    @Default('') String initialLoginDateTime,
    @Default(false) bool showSeedPhraseBanner,
    @Default([]) @JsonKey(ignore: true) List<SurveyQuestion> surveyQuestions,
    @Default(false) bool surveyCompleted,
    @Default(false) bool isVendor,
  }) = _UserState;

  const UserState._();

  factory UserState.initial() => UserState(
        networks: [],
        mnemonic: [],
        syncedContacts: [],
        reverseContacts: <String, String>{},
        displayName: 'Anom',
        isLoggedOut: true,
        backup: false,
        authType: BiometricAuth.none,
        currency: 'usd',
        useLiveLocation: false,
        listOfDeliveryAddresses: [],
        surveyQuestions: [],
        surveyCompleted: false,
        isVendor: false,
        isUsingSimulator: false,
        isUsingIosSimulator: false,
      );

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  bool get accountDetailsExist => accountAddress.isNotEmpty;
}

class UserStateConverter
    implements JsonConverter<UserState, Map<String, dynamic>?> {
  const UserStateConverter();

  @override
  UserState fromJson(Map<String, dynamic>? json) =>
      json != null ? UserState.fromJson(json) : UserState.initial();

  @override
  Map<String, dynamic> toJson(UserState instance) => instance.toJson();
}

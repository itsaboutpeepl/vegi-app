// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      walletModules: json['walletModules'] == null
          ? null
          : WalletModules.fromJson(
              json['walletModules'] as Map<String, dynamic>),
      installedAt: json['installedAt'] == null
          ? null
          : DateTime.parse(json['installedAt'] as String),
      isContactsSynced: json['isContactsSynced'] as bool?,
      isLoggedOut: json['isLoggedOut'] as bool? ?? true,
      scrollToTop: json['scrollToTop'] as bool? ?? false,
      walletAddress: json['walletAddress'] as String? ?? '',
      privateKey: json['privateKey'] as String? ?? '',
      fuseWalletCredentials: json['fuseWalletCredentials'] == null
          ? null
          : ethPrivateKeyFromJson(json['fuseWalletCredentials']),
      backup: json['backup'] as bool? ?? false,
      networks: (json['networks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mnemonic: (json['mnemonic'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pincode: json['pincode'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      warnSendDialogShowed: json['warnSendDialogShowed'] as bool? ?? false,
      isoCode: json['isoCode'] as String? ?? '',
      jwtToken: json['jwtToken'] as String? ?? '',
      displayName: json['displayName'] as String? ?? 'Anom',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      email: json['email'] as String? ?? '',
      verificationId: json['verificationId'] as String?,
      verificationPassed: json['verificationPassed'] as bool? ?? false,
      identifier: json['identifier'] as String? ?? '',
      syncedContacts: (json['syncedContacts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      reverseContacts: (json['reverseContacts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      currency: json['currency'] as String? ?? 'usd',
      authType: $enumDecodeNullable(_$BiometricAuthEnumMap, json['authType']) ??
          BiometricAuth.none,
      locale: localeFromJson(json['locale'] as Map<String, dynamic>?),
      firebaseSessionToken: json['firebaseSessionToken'] as String?,
      listOfDeliveryAddresses: (json['listOfDeliveryAddresses']
                  as List<dynamic>?)
              ?.map(
                  (e) => DeliveryAddresses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasSavedSeedPhrase: json['hasSavedSeedPhrase'] as bool? ?? false,
      useLiveLocation: json['useLiveLocation'] as bool? ?? false,
      initialLoginDateTime: json['initialLoginDateTime'] as String? ?? '',
      showSeedPhraseBanner: json['showSeedPhraseBanner'] as bool? ?? false,
      surveyCompleted: json['surveyCompleted'] as bool? ?? false,
      surveyEmailUsed: json['surveyEmailUsed'] as String? ?? '',
      isVendor: json['isVendor'] as bool? ?? false,
      stripeCustomerId: json['stripeCustomerId'] as String? ?? null,
      vegiAccountId: json['vegiAccountId'] as num? ?? null,
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'walletModules': instance.walletModules?.toJson(),
      'installedAt': instance.installedAt?.toIso8601String(),
      'isContactsSynced': instance.isContactsSynced,
      'isLoggedOut': instance.isLoggedOut,
      'scrollToTop': instance.scrollToTop,
      'walletAddress': instance.walletAddress,
      'privateKey': instance.privateKey,
      'fuseWalletCredentials':
          ethPrivateKeyToJson(instance.fuseWalletCredentials),
      'backup': instance.backup,
      'networks': instance.networks,
      'mnemonic': instance.mnemonic,
      'pincode': instance.pincode,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'warnSendDialogShowed': instance.warnSendDialogShowed,
      'isoCode': instance.isoCode,
      'jwtToken': instance.jwtToken,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'verificationId': instance.verificationId,
      'verificationPassed': instance.verificationPassed,
      'identifier': instance.identifier,
      'syncedContacts': instance.syncedContacts,
      'reverseContacts': instance.reverseContacts,
      'currency': instance.currency,
      'authType': _$BiometricAuthEnumMap[instance.authType]!,
      'locale': localeToJson(instance.locale),
      'firebaseSessionToken': instance.firebaseSessionToken,
      'listOfDeliveryAddresses':
          instance.listOfDeliveryAddresses.map((e) => e.toJson()).toList(),
      'hasSavedSeedPhrase': instance.hasSavedSeedPhrase,
      'useLiveLocation': instance.useLiveLocation,
      'initialLoginDateTime': instance.initialLoginDateTime,
      'showSeedPhraseBanner': instance.showSeedPhraseBanner,
      'surveyCompleted': instance.surveyCompleted,
      'surveyEmailUsed': instance.surveyEmailUsed,
      'isVendor': instance.isVendor,
      'stripeCustomerId': instance.stripeCustomerId,
      'vegiAccountId': instance.vegiAccountId,
    };

const _$BiometricAuthEnumMap = {
  BiometricAuth.faceID: 'faceID',
  BiometricAuth.touchID: 'touchID',
  BiometricAuth.pincode: 'pincode',
  BiometricAuth.none: 'none',
};

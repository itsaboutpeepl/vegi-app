// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  @JsonKey(ignore: true)
  String? get wcURI => throw _privateConstructorUsedError;
  String? get contractVersion => throw _privateConstructorUsedError;
  WalletModules? get walletModules => throw _privateConstructorUsedError;
  DateTime? get installedAt => throw _privateConstructorUsedError;
  bool? get isContactsSynced => throw _privateConstructorUsedError;
  bool get isLoggedOut => throw _privateConstructorUsedError;
  bool get backup => throw _privateConstructorUsedError;
  bool get scrollToTop => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  List<String> get networks => throw _privateConstructorUsedError;
  List<String> get mnemonic => throw _privateConstructorUsedError;
  String get privateKey => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get accountAddress => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  bool get warnSendDialogShowed => throw _privateConstructorUsedError;
  String get isoCode => throw _privateConstructorUsedError;
  String get jwtToken => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  List<String> get syncedContacts => throw _privateConstructorUsedError;
  Map<String, String> get reverseContacts => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get hasUpgrade => throw _privateConstructorUsedError;
  BiometricAuth get authType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
  Locale? get locale => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  PhoneAuthCredential? get credentials => throw _privateConstructorUsedError;
  List<DeliveryAddresses> get listOfDeliveryAddresses =>
      throw _privateConstructorUsedError;
  bool get hasSavedSeedPhrase => throw _privateConstructorUsedError;
  String get initialLoginDateTime => throw _privateConstructorUsedError;
  bool get showSeedPhraseBanner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? wcURI,
      String? contractVersion,
      WalletModules? walletModules,
      DateTime? installedAt,
      bool? isContactsSynced,
      bool isLoggedOut,
      bool backup,
      bool scrollToTop,
      String walletAddress,
      List<String> networks,
      List<String> mnemonic,
      String privateKey,
      String pincode,
      String accountAddress,
      String countryCode,
      String phoneNumber,
      bool warnSendDialogShowed,
      String isoCode,
      String jwtToken,
      String displayName,
      String avatarUrl,
      String email,
      String? verificationId,
      String identifier,
      List<String> syncedContacts,
      Map<String, String> reverseContacts,
      String currency,
      @JsonKey(ignore: true) bool hasUpgrade,
      BiometricAuth authType,
      @JsonKey(fromJson: localeFromJson, toJson: localeToJson) Locale? locale,
      @JsonKey(ignore: true) PhoneAuthCredential? credentials,
      List<DeliveryAddresses> listOfDeliveryAddresses,
      bool hasSavedSeedPhrase,
      String initialLoginDateTime,
      bool showSeedPhraseBanner});

  $WalletModulesCopyWith<$Res>? get walletModules;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wcURI = freezed,
    Object? contractVersion = freezed,
    Object? walletModules = freezed,
    Object? installedAt = freezed,
    Object? isContactsSynced = freezed,
    Object? isLoggedOut = null,
    Object? backup = null,
    Object? scrollToTop = null,
    Object? walletAddress = null,
    Object? networks = null,
    Object? mnemonic = null,
    Object? privateKey = null,
    Object? pincode = null,
    Object? accountAddress = null,
    Object? countryCode = null,
    Object? phoneNumber = null,
    Object? warnSendDialogShowed = null,
    Object? isoCode = null,
    Object? jwtToken = null,
    Object? displayName = null,
    Object? avatarUrl = null,
    Object? email = null,
    Object? verificationId = freezed,
    Object? identifier = null,
    Object? syncedContacts = null,
    Object? reverseContacts = null,
    Object? currency = null,
    Object? hasUpgrade = null,
    Object? authType = null,
    Object? locale = freezed,
    Object? credentials = freezed,
    Object? listOfDeliveryAddresses = null,
    Object? hasSavedSeedPhrase = null,
    Object? initialLoginDateTime = null,
    Object? showSeedPhraseBanner = null,
  }) {
    return _then(_value.copyWith(
      wcURI: freezed == wcURI
          ? _value.wcURI
          : wcURI // ignore: cast_nullable_to_non_nullable
              as String?,
      contractVersion: freezed == contractVersion
          ? _value.contractVersion
          : contractVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      walletModules: freezed == walletModules
          ? _value.walletModules
          : walletModules // ignore: cast_nullable_to_non_nullable
              as WalletModules?,
      installedAt: freezed == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isContactsSynced: freezed == isContactsSynced
          ? _value.isContactsSynced
          : isContactsSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      backup: null == backup
          ? _value.backup
          : backup // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollToTop: null == scrollToTop
          ? _value.scrollToTop
          : scrollToTop // ignore: cast_nullable_to_non_nullable
              as bool,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      networks: null == networks
          ? _value.networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      warnSendDialogShowed: null == warnSendDialogShowed
          ? _value.warnSendDialogShowed
          : warnSendDialogShowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      jwtToken: null == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      syncedContacts: null == syncedContacts
          ? _value.syncedContacts
          : syncedContacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reverseContacts: null == reverseContacts
          ? _value.reverseContacts
          : reverseContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hasUpgrade: null == hasUpgrade
          ? _value.hasUpgrade
          : hasUpgrade // ignore: cast_nullable_to_non_nullable
              as bool,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as BiometricAuth,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      listOfDeliveryAddresses: null == listOfDeliveryAddresses
          ? _value.listOfDeliveryAddresses
          : listOfDeliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<DeliveryAddresses>,
      hasSavedSeedPhrase: null == hasSavedSeedPhrase
          ? _value.hasSavedSeedPhrase
          : hasSavedSeedPhrase // ignore: cast_nullable_to_non_nullable
              as bool,
      initialLoginDateTime: null == initialLoginDateTime
          ? _value.initialLoginDateTime
          : initialLoginDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      showSeedPhraseBanner: null == showSeedPhraseBanner
          ? _value.showSeedPhraseBanner
          : showSeedPhraseBanner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModulesCopyWith<$Res>? get walletModules {
    if (_value.walletModules == null) {
      return null;
    }

    return $WalletModulesCopyWith<$Res>(_value.walletModules!, (value) {
      return _then(_value.copyWith(walletModules: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? wcURI,
      String? contractVersion,
      WalletModules? walletModules,
      DateTime? installedAt,
      bool? isContactsSynced,
      bool isLoggedOut,
      bool backup,
      bool scrollToTop,
      String walletAddress,
      List<String> networks,
      List<String> mnemonic,
      String privateKey,
      String pincode,
      String accountAddress,
      String countryCode,
      String phoneNumber,
      bool warnSendDialogShowed,
      String isoCode,
      String jwtToken,
      String displayName,
      String avatarUrl,
      String email,
      String? verificationId,
      String identifier,
      List<String> syncedContacts,
      Map<String, String> reverseContacts,
      String currency,
      @JsonKey(ignore: true) bool hasUpgrade,
      BiometricAuth authType,
      @JsonKey(fromJson: localeFromJson, toJson: localeToJson) Locale? locale,
      @JsonKey(ignore: true) PhoneAuthCredential? credentials,
      List<DeliveryAddresses> listOfDeliveryAddresses,
      bool hasSavedSeedPhrase,
      String initialLoginDateTime,
      bool showSeedPhraseBanner});

  @override
  $WalletModulesCopyWith<$Res>? get walletModules;
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserState>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wcURI = freezed,
    Object? contractVersion = freezed,
    Object? walletModules = freezed,
    Object? installedAt = freezed,
    Object? isContactsSynced = freezed,
    Object? isLoggedOut = null,
    Object? backup = null,
    Object? scrollToTop = null,
    Object? walletAddress = null,
    Object? networks = null,
    Object? mnemonic = null,
    Object? privateKey = null,
    Object? pincode = null,
    Object? accountAddress = null,
    Object? countryCode = null,
    Object? phoneNumber = null,
    Object? warnSendDialogShowed = null,
    Object? isoCode = null,
    Object? jwtToken = null,
    Object? displayName = null,
    Object? avatarUrl = null,
    Object? email = null,
    Object? verificationId = freezed,
    Object? identifier = null,
    Object? syncedContacts = null,
    Object? reverseContacts = null,
    Object? currency = null,
    Object? hasUpgrade = null,
    Object? authType = null,
    Object? locale = freezed,
    Object? credentials = freezed,
    Object? listOfDeliveryAddresses = null,
    Object? hasSavedSeedPhrase = null,
    Object? initialLoginDateTime = null,
    Object? showSeedPhraseBanner = null,
  }) {
    return _then(_$_UserState(
      wcURI: freezed == wcURI
          ? _value.wcURI
          : wcURI // ignore: cast_nullable_to_non_nullable
              as String?,
      contractVersion: freezed == contractVersion
          ? _value.contractVersion
          : contractVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      walletModules: freezed == walletModules
          ? _value.walletModules
          : walletModules // ignore: cast_nullable_to_non_nullable
              as WalletModules?,
      installedAt: freezed == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isContactsSynced: freezed == isContactsSynced
          ? _value.isContactsSynced
          : isContactsSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      backup: null == backup
          ? _value.backup
          : backup // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollToTop: null == scrollToTop
          ? _value.scrollToTop
          : scrollToTop // ignore: cast_nullable_to_non_nullable
              as bool,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      networks: null == networks
          ? _value.networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      warnSendDialogShowed: null == warnSendDialogShowed
          ? _value.warnSendDialogShowed
          : warnSendDialogShowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      jwtToken: null == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      syncedContacts: null == syncedContacts
          ? _value.syncedContacts
          : syncedContacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reverseContacts: null == reverseContacts
          ? _value.reverseContacts
          : reverseContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hasUpgrade: null == hasUpgrade
          ? _value.hasUpgrade
          : hasUpgrade // ignore: cast_nullable_to_non_nullable
              as bool,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as BiometricAuth,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      listOfDeliveryAddresses: null == listOfDeliveryAddresses
          ? _value.listOfDeliveryAddresses
          : listOfDeliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<DeliveryAddresses>,
      hasSavedSeedPhrase: null == hasSavedSeedPhrase
          ? _value.hasSavedSeedPhrase
          : hasSavedSeedPhrase // ignore: cast_nullable_to_non_nullable
              as bool,
      initialLoginDateTime: null == initialLoginDateTime
          ? _value.initialLoginDateTime
          : initialLoginDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      showSeedPhraseBanner: null == showSeedPhraseBanner
          ? _value.showSeedPhraseBanner
          : showSeedPhraseBanner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserState extends _UserState with DiagnosticableTreeMixin {
  _$_UserState(
      {@JsonKey(ignore: true) this.wcURI,
      this.contractVersion,
      this.walletModules,
      this.installedAt,
      this.isContactsSynced,
      this.isLoggedOut = false,
      this.backup = false,
      this.scrollToTop = false,
      this.walletAddress = '',
      this.networks = const [],
      this.mnemonic = const [],
      this.privateKey = '',
      this.pincode = '',
      this.accountAddress = '',
      this.countryCode = '',
      this.phoneNumber = '',
      this.warnSendDialogShowed = false,
      this.isoCode = '',
      this.jwtToken = '',
      this.displayName = 'Anom',
      this.avatarUrl = '',
      this.email = '',
      this.verificationId,
      this.identifier = '',
      this.syncedContacts = const [],
      this.reverseContacts = const {},
      this.currency = 'usd',
      @JsonKey(ignore: true) this.hasUpgrade = false,
      this.authType = BiometricAuth.none,
      @JsonKey(fromJson: localeFromJson, toJson: localeToJson) this.locale,
      @JsonKey(ignore: true) this.credentials,
      this.listOfDeliveryAddresses = const [],
      this.hasSavedSeedPhrase = false,
      this.initialLoginDateTime = '',
      this.showSeedPhraseBanner = false})
      : super._();

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$$_UserStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? wcURI;
  @override
  final String? contractVersion;
  @override
  final WalletModules? walletModules;
  @override
  final DateTime? installedAt;
  @override
  final bool? isContactsSynced;
  @override
  @JsonKey()
  final bool isLoggedOut;
  @override
  @JsonKey()
  final bool backup;
  @override
  @JsonKey()
  final bool scrollToTop;
  @override
  @JsonKey()
  final String walletAddress;
  @override
  @JsonKey()
  final List<String> networks;
  @override
  @JsonKey()
  final List<String> mnemonic;
  @override
  @JsonKey()
  final String privateKey;
  @override
  @JsonKey()
  final String pincode;
  @override
  @JsonKey()
  final String accountAddress;
  @override
  @JsonKey()
  final String countryCode;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final bool warnSendDialogShowed;
  @override
  @JsonKey()
  final String isoCode;
  @override
  @JsonKey()
  final String jwtToken;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String avatarUrl;
  @override
  @JsonKey()
  final String email;
  @override
  final String? verificationId;
  @override
  @JsonKey()
  final String identifier;
  @override
  @JsonKey()
  final List<String> syncedContacts;
  @override
  @JsonKey()
  final Map<String, String> reverseContacts;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(ignore: true)
  final bool hasUpgrade;
  @override
  @JsonKey()
  final BiometricAuth authType;
  @override
  @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
  final Locale? locale;
  @override
  @JsonKey(ignore: true)
  final PhoneAuthCredential? credentials;
  @override
  @JsonKey()
  final List<DeliveryAddresses> listOfDeliveryAddresses;
  @override
  @JsonKey()
  final bool hasSavedSeedPhrase;
  @override
  @JsonKey()
  final String initialLoginDateTime;
  @override
  @JsonKey()
  final bool showSeedPhraseBanner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState(wcURI: $wcURI, contractVersion: $contractVersion, walletModules: $walletModules, installedAt: $installedAt, isContactsSynced: $isContactsSynced, isLoggedOut: $isLoggedOut, backup: $backup, scrollToTop: $scrollToTop, walletAddress: $walletAddress, networks: $networks, mnemonic: $mnemonic, privateKey: $privateKey, pincode: $pincode, accountAddress: $accountAddress, countryCode: $countryCode, phoneNumber: $phoneNumber, warnSendDialogShowed: $warnSendDialogShowed, isoCode: $isoCode, jwtToken: $jwtToken, displayName: $displayName, avatarUrl: $avatarUrl, email: $email, verificationId: $verificationId, identifier: $identifier, syncedContacts: $syncedContacts, reverseContacts: $reverseContacts, currency: $currency, hasUpgrade: $hasUpgrade, authType: $authType, locale: $locale, credentials: $credentials, listOfDeliveryAddresses: $listOfDeliveryAddresses, hasSavedSeedPhrase: $hasSavedSeedPhrase, initialLoginDateTime: $initialLoginDateTime, showSeedPhraseBanner: $showSeedPhraseBanner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState'))
      ..add(DiagnosticsProperty('wcURI', wcURI))
      ..add(DiagnosticsProperty('contractVersion', contractVersion))
      ..add(DiagnosticsProperty('walletModules', walletModules))
      ..add(DiagnosticsProperty('installedAt', installedAt))
      ..add(DiagnosticsProperty('isContactsSynced', isContactsSynced))
      ..add(DiagnosticsProperty('isLoggedOut', isLoggedOut))
      ..add(DiagnosticsProperty('backup', backup))
      ..add(DiagnosticsProperty('scrollToTop', scrollToTop))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('networks', networks))
      ..add(DiagnosticsProperty('mnemonic', mnemonic))
      ..add(DiagnosticsProperty('privateKey', privateKey))
      ..add(DiagnosticsProperty('pincode', pincode))
      ..add(DiagnosticsProperty('accountAddress', accountAddress))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('warnSendDialogShowed', warnSendDialogShowed))
      ..add(DiagnosticsProperty('isoCode', isoCode))
      ..add(DiagnosticsProperty('jwtToken', jwtToken))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('verificationId', verificationId))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('syncedContacts', syncedContacts))
      ..add(DiagnosticsProperty('reverseContacts', reverseContacts))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('hasUpgrade', hasUpgrade))
      ..add(DiagnosticsProperty('authType', authType))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('credentials', credentials))
      ..add(DiagnosticsProperty(
          'listOfDeliveryAddresses', listOfDeliveryAddresses))
      ..add(DiagnosticsProperty('hasSavedSeedPhrase', hasSavedSeedPhrase))
      ..add(DiagnosticsProperty('initialLoginDateTime', initialLoginDateTime))
      ..add(DiagnosticsProperty('showSeedPhraseBanner', showSeedPhraseBanner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            (identical(other.wcURI, wcURI) || other.wcURI == wcURI) &&
            (identical(other.contractVersion, contractVersion) ||
                other.contractVersion == contractVersion) &&
            (identical(other.walletModules, walletModules) ||
                other.walletModules == walletModules) &&
            (identical(other.installedAt, installedAt) ||
                other.installedAt == installedAt) &&
            (identical(other.isContactsSynced, isContactsSynced) ||
                other.isContactsSynced == isContactsSynced) &&
            (identical(other.isLoggedOut, isLoggedOut) ||
                other.isLoggedOut == isLoggedOut) &&
            (identical(other.backup, backup) || other.backup == backup) &&
            (identical(other.scrollToTop, scrollToTop) ||
                other.scrollToTop == scrollToTop) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            const DeepCollectionEquality().equals(other.networks, networks) &&
            const DeepCollectionEquality().equals(other.mnemonic, mnemonic) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.warnSendDialogShowed, warnSendDialogShowed) ||
                other.warnSendDialogShowed == warnSendDialogShowed) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.jwtToken, jwtToken) ||
                other.jwtToken == jwtToken) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality()
                .equals(other.syncedContacts, syncedContacts) &&
            const DeepCollectionEquality()
                .equals(other.reverseContacts, reverseContacts) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.hasUpgrade, hasUpgrade) ||
                other.hasUpgrade == hasUpgrade) &&
            (identical(other.authType, authType) ||
                other.authType == authType) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            const DeepCollectionEquality().equals(
                other.listOfDeliveryAddresses, listOfDeliveryAddresses) &&
            (identical(other.hasSavedSeedPhrase, hasSavedSeedPhrase) ||
                other.hasSavedSeedPhrase == hasSavedSeedPhrase) &&
            (identical(other.initialLoginDateTime, initialLoginDateTime) ||
                other.initialLoginDateTime == initialLoginDateTime) &&
            (identical(other.showSeedPhraseBanner, showSeedPhraseBanner) ||
                other.showSeedPhraseBanner == showSeedPhraseBanner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        wcURI,
        contractVersion,
        walletModules,
        installedAt,
        isContactsSynced,
        isLoggedOut,
        backup,
        scrollToTop,
        walletAddress,
        const DeepCollectionEquality().hash(networks),
        const DeepCollectionEquality().hash(mnemonic),
        privateKey,
        pincode,
        accountAddress,
        countryCode,
        phoneNumber,
        warnSendDialogShowed,
        isoCode,
        jwtToken,
        displayName,
        avatarUrl,
        email,
        verificationId,
        identifier,
        const DeepCollectionEquality().hash(syncedContacts),
        const DeepCollectionEquality().hash(reverseContacts),
        currency,
        hasUpgrade,
        authType,
        locale,
        credentials,
        const DeepCollectionEquality().hash(listOfDeliveryAddresses),
        hasSavedSeedPhrase,
        initialLoginDateTime,
        showSeedPhraseBanner
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStateToJson(
      this,
    );
  }
}

abstract class _UserState extends UserState {
  factory _UserState(
      {@JsonKey(ignore: true)
          final String? wcURI,
      final String? contractVersion,
      final WalletModules? walletModules,
      final DateTime? installedAt,
      final bool? isContactsSynced,
      final bool isLoggedOut,
      final bool backup,
      final bool scrollToTop,
      final String walletAddress,
      final List<String> networks,
      final List<String> mnemonic,
      final String privateKey,
      final String pincode,
      final String accountAddress,
      final String countryCode,
      final String phoneNumber,
      final bool warnSendDialogShowed,
      final String isoCode,
      final String jwtToken,
      final String displayName,
      final String avatarUrl,
      final String email,
      final String? verificationId,
      final String identifier,
      final List<String> syncedContacts,
      final Map<String, String> reverseContacts,
      final String currency,
      @JsonKey(ignore: true)
          final bool hasUpgrade,
      final BiometricAuth authType,
      @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
          final Locale? locale,
      @JsonKey(ignore: true)
          final PhoneAuthCredential? credentials,
      final List<DeliveryAddresses> listOfDeliveryAddresses,
      final bool hasSavedSeedPhrase,
      final String initialLoginDateTime,
      final bool showSeedPhraseBanner}) = _$_UserState;
  _UserState._() : super._();

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get wcURI;
  @override
  String? get contractVersion;
  @override
  WalletModules? get walletModules;
  @override
  DateTime? get installedAt;
  @override
  bool? get isContactsSynced;
  @override
  bool get isLoggedOut;
  @override
  bool get backup;
  @override
  bool get scrollToTop;
  @override
  String get walletAddress;
  @override
  List<String> get networks;
  @override
  List<String> get mnemonic;
  @override
  String get privateKey;
  @override
  String get pincode;
  @override
  String get accountAddress;
  @override
  String get countryCode;
  @override
  String get phoneNumber;
  @override
  bool get warnSendDialogShowed;
  @override
  String get isoCode;
  @override
  String get jwtToken;
  @override
  String get displayName;
  @override
  String get avatarUrl;
  @override
  String get email;
  @override
  String? get verificationId;
  @override
  String get identifier;
  @override
  List<String> get syncedContacts;
  @override
  Map<String, String> get reverseContacts;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  bool get hasUpgrade;
  @override
  BiometricAuth get authType;
  @override
  @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
  Locale? get locale;
  @override
  @JsonKey(ignore: true)
  PhoneAuthCredential? get credentials;
  @override
  List<DeliveryAddresses> get listOfDeliveryAddresses;
  @override
  bool get hasSavedSeedPhrase;
  @override
  String get initialLoginDateTime;
  @override
  bool get showSeedPhraseBanner;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

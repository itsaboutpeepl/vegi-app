// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:vegan_liverpool/constants/addresses.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String wethTokenAddress = '0xa722c13135930332eb3d749b2f0906559d2c5b99';
const String wbtcTokenAddress = '0x33284f95ccb7b948d9d352e1439561cf83d8d00d';
const String wfuseTokenAddress = '0x0be9e53fd7edac9f859882afdda116645287c629';

final Token fuseToken = Token(
  name: 'Fuse',
  symbol: 'FUSE',
  imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-token.png',
  decimals: 18,
  address: Addresses.zeroAddress,
  isNative: true,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token gbpxToken = Token(
  name: 'GBPx',
  symbol: 'GBPX',
  // imageUrl: "https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png",
  decimals: 18,
  address: Addresses.gbpxTokenAddress,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token pplToken = Token(
  name: 'Peepl',
  symbol: 'PPL',
  // imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-token.png',
  decimals: 18,
  address: Addresses.pplTokenAddress,
  isNative: false,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token fuseDollarToken = Token(
  name: 'Fuse Dollar',
  symbol: 'fUSD',
  imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png',
  decimals: 18,
  address: Addresses.fusdTokenAddress,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

/// Static class of DotEnv Secrets
class Secrets {
  // Make Constructor Private to force Static Intellisense use
  const Secrets._();

  static String get SENTRY_DSN => dotenv.env['SENTRY_DSN']!;

  static String get ON_BOARDING_STRATEGY => dotenv.env['ON_BOARDING_STRATEGY']!;

  static String get PEEPL_PAY_BACKEND => dotenv.env['PEEPL_PAY_BACKEND']!;
  static String get VEGI_EATS_BACKEND => dotenv.env['VEGI_EATS_BACKEND']!;

  static String get CHARGE_API_KEY => dotenv.env['CHARGE_API_KEY']!;
  static String get FUSE_WALLET_SDK_PK => dotenv.env['FUSE_WALLET_SDK_PK']!;
  static String get FUSE_WALLET_SDK_SK => dotenv.env['FUSE_WALLET_SDK_SK']!;
  static String get FOREIGN_NETWORK_ID => dotenv.env['FOREIGN_NETWORK_ID']!;

  static String get MAP_API_KEY_IOS => dotenv.env['MAP_API_KEY_IOS']!;
  static String get MAP_API_KEY_ANDROID => dotenv.env['MAP_API_KEY_ANDROID']!;

  static String get STRIPE_PAY_URL => dotenv.env['STRIPE_PAY_URL']!;
  static String get STRIPE_API_KEY_LIVE => dotenv.env['STRIPE_API_KEY_LIVE']!;
  static String get STRIPE_API_KEY_TEST => dotenv.env['STRIPE_API_KEY_TEST']!;

  static String get mode => dotenv.env['mode']!;

  static String get amazonS3BucketUrl => dotenv.env['amazonS3BucketUrl']!;
  static String get amazonS3Region => dotenv.env['amazonS3Region']!;
  static String get amazonS3Bucket => dotenv.env['amazonS3Bucket']!;
  static String get amazonS3Secret => dotenv.env['amazonS3Secret']!;
  static String get amazonS3AccessKey => dotenv.env['amazonS3AccessKey']!;
}

const EMAIL_NOT_PROVIDED = 'email@notprovided.com';

const VEGI_BASE_URL = 'https://vegiapp.co.uk';
const VEGI_PRIVACY_URL = '$VEGI_BASE_URL/privacy';
const VEGI_CONTACT_US_URL = '$VEGI_BASE_URL/contact';
const VEGI_TIKTOK_HANDLE = '@vegi_app';
const VEGI_TIKTOK_PROFILE_URL = 'https://vm.tiktok.com/ZMNF3ekHX/';
const VEGI_INSTA_HANDLE = 'wearevegi';
const VEGI_INSTA_PROFILE_URL = 'https://www.instagram.com/wearevegi/';

// const THE_GUIDE_LIVERPOOL_IOS_LINK = 'https://apps.apple.com/app/id1600049497';
// const THE_GUIDE_LIVERPOOL_GOOGLEPS_LINK =
//     'https://play.google.com/store/apps/details?id=com.theguideliverpool.theguideapp';
const THE_GUIDE_LIVERPOOL_LINKTREE = 'https://qrco.de/bdNuyp';
const THE_GUIDE_LIVERPOOL_IOS_LINK = THE_GUIDE_LIVERPOOL_LINKTREE;
const THE_GUIDE_LIVERPOOL_GOOGLEPS_LINK = THE_GUIDE_LIVERPOOL_LINKTREE;
const VEGI_SUPPORT_PHONE_NUMBER = '+447917787967';
const VEGI_SUPPORT_EMAIL = 'support@vegi.co.uk';

String getGuideLiverpoolLink() {
  return 'https://qrco.de/bdNuyp';
  // return Platform.isIOS
  //     ? THE_GUIDE_LIVERPOOL_IOS_LINK
  //     : THE_GUIDE_LIVERPOOL_GOOGLEPS_LINK;
}

class Messages {
  static const String email = 'Email Address';
  static const String enterEmail =
      'Please enter your email to be first to receive an update when we launch.';

  static const String createNewAccount = 'New Account';

  static const String invalidEmail = 'Invalid Email';
  static const String newSupportRequestSubjectHeader = 'New Support Request';
  static const String thanksForRegisteringEmailWaitList =
      'Thank you for registering with vegi 💚';
  static const String signUpForTheGuideToAccessTheBeta =
      'Sign up to the pre-release version of vegi via The Guide Liverpool';
  static const String byRegisteringEmailWaitListReason =
      "By registering, you'll be the first to know when we launch.";
  static const String unsubscribeAtAnyTime =
      'You can unsubscribe any time, no funny business.';

  static const String walletLoadedSnackbarMessage = 'Wallet loaded';
  static const String walletSignedOutSnackbarMessage = 'Wallet signed out';
  static const String walletNotBackedUpSnackbarMessage = 'Wallet not backed up';
}

const ENV = String.fromEnvironment('ENV', defaultValue: 'production');
const USE_FIREBASE_EMULATOR =
    String.fromEnvironment('USE_FIREBASE_EMULATOR', defaultValue: 'false');

const postcodeIoBaseUrl = 'https://api.postcodes.io/';
const postcodeIoGetPostcodeDetailRelUrl =
    '/postcodes'; // ~ https://postcodes.io/#:~:text=Get%20nearest%20postcodes%20for%20a%20given%20longitude%20%26%20latitude

const noVendorsFoundCopyTitle = "Pretty empty here, isn't it?";
const noVendorsFoundCopyEmoji = '😐';
final noVendorsFoundCopyMessage =
    (String location) => "We aren't currently delivering to $location, but "
        'we will in the future, so check back later!';

final scanQRCodeProductNotFoundPleaseSendUsDetails = (String nextButtonLabel) =>
    'This product was not found in our data. '
    'Please help us improve our service to you by sending us the product information so that we can tell you all about it. '
    'Click $nextButtonLabel to continue.';

final suggestProductPhotoDirector =
    (String photoLabel) => 'Please take a photo of the $photoLabel';
final suggestProductPhotoDirectorConfirm =
    (String photoLabel) => 'Please confirm your photo of the $photoLabel';

const suggestProductPhotoDirectorLabel1 = 'barcode';
const suggestProductPhotoDirectorLabel2 = 'front of the product';
const suggestProductPhotoDirectorLabel3 = 'nutritional info label';
const suggestProductPhotoDirectorLabel4 = 'ingredients list';
// const suggestProductPhotoDirectorLabelMap =
//     <String, ProductSuggestionImageType>{
//   suggestProductPhotoDirectorLabel1: ProductSuggestionImageType.barCode,
//   suggestProductPhotoDirectorLabel2: ProductSuggestionImageType.frontOfPackage,
//   suggestProductPhotoDirectorLabel3: ProductSuggestionImageType.nutritionalInfo,
//   suggestProductPhotoDirectorLabel4: ProductSuggestionImageType.ingredientInfo,
// };
const suggestProductPhotoDirectorLabelMap =
    <ProductSuggestionImageType, String>{
  ProductSuggestionImageType.barCode: suggestProductPhotoDirectorLabel1,
  ProductSuggestionImageType.frontOfPackage: suggestProductPhotoDirectorLabel2,
  ProductSuggestionImageType.nutritionalInfo: suggestProductPhotoDirectorLabel3,
  ProductSuggestionImageType.ingredientInfo: suggestProductPhotoDirectorLabel4,
  ProductSuggestionImageType.teachUsMore: 'Teach us more',
};

const productSuggestionAdditionalInfoRequestText =
    'Any additional information about the product to help us rate it';
const photoPickImageFromGalleryText = 'Pick Image from Gallery';
const photoTakePhotoWithCameraText = 'Take Photo with Camera';
const imageFromCameraText = 'Image from Camera';
const imageFromLibraryText = 'Image from Gallery';
const int cameraPreferredImageQuality =
    100; // % of image quality retained from original
const fileUploadVegiMaxSizeMB = 1; // 1MB

const inDebugMode = kDebugMode;

Future<bool> deviceIsSimulator() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    if (!iosInfo.isPhysicalDevice) {
      return true;
    }
  } else if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    if (!androidInfo.isPhysicalDevice) {
      return true;
    }
  }
  return false;
}

Future<bool> deviceIsIosSimulator() async =>
    Platform.isIOS && (await deviceIsSimulator());

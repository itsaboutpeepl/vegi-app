// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/addresses.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const LoadingScaffold = MyScaffold(
  title: '',
  body: Center(child: CircularProgressIndicator()),
);

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
  amount: BigInt.from(0.0),
  walletActions: WalletActions.initial(),
);

final Token gbpxToken = Token(
  name: 'GBPx',
  symbol: 'GBPX',
  // imageUrl: "https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png",
  decimals: 18,
  address: Addresses.gbpxTokenAddress,
  timestamp: 0,
  amount: BigInt.from(0.0),
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
  amount: BigInt.from(0.0),
  walletActions: WalletActions.initial(),
);

final Token fuseDollarToken = Token(
  name: 'Fuse Dollar',
  symbol: 'fUSD',
  imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png',
  decimals: 18,
  address: Addresses.fusdTokenAddress,
  timestamp: 0,
  amount: BigInt.from(0.0),
  walletActions: WalletActions.initial(),
);

/// Static class of DotEnv Secrets
class Secrets {
  // Make Constructor Private to force Static Intellisense use
  const Secrets._();

  static String get SENTRY_DSN => dotenv.env['SENTRY_DSN']!;
  static String get CURRENCY_CONVERTER_API_KEY => dotenv.env['CURRENCY_CONVERTER_API_KEY']!;

  static String get ON_BOARDING_STRATEGY => dotenv.env['ON_BOARDING_STRATEGY']!;

  static String get PEEPL_PAY_BACKEND => dotenv.env['PEEPL_PAY_BACKEND']!;
  static String get VEGI_EATS_BACKEND => dotenv.env['VEGI_EATS_BACKEND']!;

  static String get CHARGE_API_KEY => dotenv.env['CHARGE_API_KEY']!;
  static String get FUSE_WALLET_SDK_PUBLIC_KEY =>
      dotenv.env['FUSE_WALLET_SDK_PK']!;
  static String get FUSE_WALLET_SDK_SK => dotenv.env['FUSE_WALLET_SDK_SK']!;
  static String get FOREIGN_NETWORK_ID => dotenv.env['FOREIGN_NETWORK_ID']!;

  static String get WEB3AUTH_CLIENT_ID => dotenv.env['WEB3AUTH_CLIENT_ID']!;

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
const VEGI_FAQs_URL = '$VEGI_BASE_URL/FAQs';
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

const showWaitingListFunnel = false;


class CurrencyRateConstants {
  static const pplRewardsPcntDelivery = 0.05;
  static const pplRewardsPcntPoS = 0.01;
  static const numberOfPPLInOneGBP = 10.0;
  static const pplPenceValue = 0.1;
  static const pplPoundValue = pplPenceValue / 100;
  static const minESCRating = 0.0;
  static const maxESCRating = 5.0;

  /**
   * Description placeholder
   * @date 25/05/2023 - 09:15:53
   *
   * @type {0.01}
   * 
   * @value of 1 GBT in GBP
   */
  static const GBTPoundPegValue = 0.01;

  /**
   * Description placeholder
   * @date 25/05/2023 - 09:15:53
   *
   * @type {0.01}
   * 
   * @value of 1 GBPx in GBP
   */
  static const GBPxPoundPegValue = 0.01;

  /**
   * Description placeholder
   * @date 25/05/2023 - 09:15:53
   *
   * @type {0.01}
   * 
   * @value of 1 PPL in GBP
   */
  static const PPLPoundPegValue = 0.1;
}

class Fonts {
  static const String fatFace = 'Fat Cheeks';
  static const String gelica = 'Gelica';
  static const String europa = 'Europa';
}

class Messages {
  static const String email = 'Email Address';
  static const String voucherCode = 'Voucher';
  static const String enterEmail =
      'Please enter your email to be first to receive an update when we launch.';

  static const String emailRegisteredThankYou = 'Thank you for registering';
  static const String failedToRegisterEmailToWaitingList =
      'Registration failed';
  static const String failedToCheckPositionInWaitingList =
      'Failed to check position in waiting list.';
  static const String emailPleaseRegisterForLaunchNotifications =
      'Enter your email to be notified when we launch';
  static const String emailPleaseEnterToHelpProtectYourAccount =
      'Please enter your email to help us protect your account';
  static const String wellBeInTouchSoon = 'We will be in touch soon!';
  static const String pleaseEnterEmail = 'Please enter your email';

  static const String createNewAccount = 'New Account';
  static const String checkWaitingListError = 'Unable to check waitinglist';

  static String loginSuccess(BuildContext context) =>
      '${I10n.of(context).login} success!';

  static const String invalidEmail = 'Invalid Email';
  static const String invalidDiscountCode = 'Invalid voucher code';
  static const String newSupportRequestSubjectHeader = 'New Support Request';
  static const String thanksForRegisteringEmailWaitList =
      'Thank you for registering with vegi 💚';
  static const String signUpForTheGuideToAccessTheBeta =
      'Sign up to the pre-release version of vegi via The Guide Liverpool';
  static const String byRegisteringEmailWaitListReason =
      "By registering, you'll be the first to know when we launch.";
  static const String pullDownToRefresh = 'Pull down to refresh';
  static const String unsubscribeAtAnyTime =
      'You can unsubscribe any time, no funny business.';

  static const String walletLoadedSnackbarMessage = 'Wallet loaded';
  static const String walletSignedOutSnackbarMessage = 'Wallet signed out';
  static const String walletNotBackedUpSnackbarMessage = 'Wallet not backed up';

  static const String answerYNQuestionsToBumpQueue =
      'Answer 3 yes/no questions to move up the queue';
  static const String unableToRegisterEmailForNotifications =
      'Unable to register email for notifications';

  static const String addVoucherCode = 'Add a voucher code';
  static const String addVoucherCodeInvalidCode = 'Invalid code';
  static const String addVoucherCodeCodeCantBeEmpty =
      "Discount code can't be empty";
  static const String permissionDenied = 'Permission denied';
  static const String removeVoucherCodeNotAllowed =
      'Existing vouchers cannot be removed.';

  static const String willEmailOnceLive =
      "We'll send you an email when we are live and you can spend your credit!";

  static const String unableToFetchOrders = 'Unable to fetch latest orders';
  static const String unableToCheckWaitingListQueue =
      'Unable to check queue at this time. Please check back later.';
  static const String noUpcomingOrders = 'You have no upcoming orders… yet!';
  static const String noUpcomingOrdersSubtitle =
      'If this is incorrect, please contact support '
      ' for assistance. Details are in our FAQ section.';
  static const String connectionError = 'Connection error';
  static const String operationFailed = 'Operation failed';

  static const String searchVegiPlaceholder = 'Search vegi...';
  static const String searchVendorPlaceholder = 'Search vendor...';

  static const String signInFailed = 'Sign-in failed';
  static const String signInFailedEmailLinkMessage =
      'Unable to signup with email links at this time';
}

class CopyWrite {
  static const String onboardingScreenHeading1 = 'Shop plant-based';
  static const String onboardingScreenSubHeading1 =
      'Find plant-based, planet-kind and ethical '
      'products from local businesses and growers.';
  static const String onboardingScreenHeading2 = 'Shop local';
  static const String onboardingScreenSubHeading2 =
      'Use vegi to support independent businesses and keep more money in our local economy.';
  static const String onboardingScreenHeading3 = 'Earn rewards';
  static const String onboardingScreenSubHeading3 =
      'Enjoy cash-back when you use vegi to spend again next time you shop.';
  static const String continueWithoutDiscountCode =
      'Continue without voucher code?';
  static const String preLaunchPerksHeadingPart1 = 'Shop local, get rewards';
  static const String preLaunchPerksHeadingPart2 = ' ...even before we launch!';
  static final String preLaunchPerksCreditsExplanation =
      'Get £1 credit for every shop in Purple Carrot that includes an item '
      'from a local business this ${DateFormat('MMMM').format(DateTime.now())}';
  static const String startCollectingFreeCreditNow =
      'Start collecting free credit now';
  static const String collectCreditForEcoProducts =
      'Collect credit when you purchase a product made by a local business '
      'from Purple Carrot';

  static const String patientSnailLabel = 'Patient Snail';
  static const List<String> patientSnailMessage = [
    'Get notified when ',
    "we're ready!"
  ];
  static const String earlyBirdLabel = 'Early Bird';
  static const List<String> earlyBirdMessage = [
    'Join our beta app to use',
    'vegi now!'
  ];
}

class ImagePaths {
  static const String vegiHorizontalLogo =
      'assets/images/Vegi-Logo-horizontal.png';
  static const String vegiBeanMan = 'assets/images/beanman.jpg';
  static const String veganOnlyIcon = 'assets/images/vegan-only-icon.png';
  static const String fuseLogo = 'assets/images/fuse/fuse-logo.png';
  static const String fuseIconGreen = 'assets/images/fuse/fuse-icon-green.png';
  static const String fuseIconFilledGreen =
      'assets/images/fuse/fuse-icon-filled-green.png';
  static const String firbebaseLogo = 'assets/images/firebase-logo.svg';
  static const String vegiBeanManNSEW = 'assets/images/beanman-nsew.png';

  static const String onboardingPage2HeadingImage1 = 'plant-icon.svg';
  static const String onboardingPage3HeadingImage2 = 'local-icon.svg';
  static const String onboardingPage4HeadingImage3 = 'rewards-icon.svg';
  static const String onboardingPage1Background =
      'assets/images/design/1_intro_img.png';
  static const String onboardingPage2Background =
      'assets/images/design/2_plant_based_img.png';
  static const String onboardingPage3Background =
      'assets/images/design/3_shop_local_img.png';
  static const String onboardingPage4Background =
      'assets/images/design/4_earn_rewards_img.png';
  static const String onboardingPage5Background =
      'assets/images/design/5_outro_img.png';
  static const String onboardingPage5Card =
      'assets/images/design/5_outro_card.png';
  static const String onboardingPage5CardSnail =
      'assets/images/design/5_outro_card_snail.png';

  static const String onboardingPage1VegiText =
      'assets/images/design/1_intro_text.png';
  static const String previousScreenArrowOnboardingButton =
      'assets/images/design/previous_screen_arrow_button_onboarding.png';
  static const String nextScreenArrowOnboardingButton =
      'assets/images/design/next_screen_arrow_button_onboarding.png';
}

class Labels {
  static const String registerEmailOnboardingScreenTitle = 'Email';
  static const String registerEmailWaitingListNotificationsScreenTitle =
      'Register';

  static const String submit = 'Submit';
  static const String signupButtonLabelViewAccount = 'View account';
  static const String signupButtonLabelCreateAccount = 'Create account';
  static String Function(BuildContext) signupButtonLabelLogin =
      (BuildContext context) => I10n.of(context).login;
  static String Function(BuildContext) signupButtonLabelLogout =
      (BuildContext context) => I10n.of(context).logout;
  static String Function(BuildContext) signupButtonLabelSignUp =
      (BuildContext context) => I10n.of(context).sign_up;
  static const String signupButtonLabelResetSurvey = 'Reset survey';
  static const String signupButtonLabelReAuthenticate = 'Re-authenticate';
  static String Function({required bool isWhiteListedAccount})
      signupScreenTitle = ({required bool isWhiteListedAccount}) =>
          isWhiteListedAccount ? 'Welcome' : 'Waitlist';
  static String Function({required bool isWhiteListedAccount})
      signupScreenSubTitle = ({required bool isWhiteListedAccount}) =>
          isWhiteListedAccount
              ? ''
              : "We'll be in touch as soon as you're off the waitlist list!";
  static String Function(BuildContext) surveyThanksButtonRestoreBackupWallet =
      (BuildContext context) => I10n.of(context).restore_from_backup;

  static const String fullDetailsAndFAQsLinkLabel = 'Full details & FAQs';

  static const String notifyMeWhenYouRelease = 'Notify me when you launch';
  static const String dontNotifyMeWhenYouRelease =
      "Don't notify me when you launch";

  static String vegiPay({required bool vendorMode}) =>
      vendorMode ? 'Take vegiPayment' : 'vegiPay';

  static const String googleSignonLabel = 'Google';
  static const String appleSignonLabel = 'Apple';
  static const String emailAndPasswordSignonLabel = 'Email and Password';
  static const String emailLinkSignonLabel = 'Email link';
  static const String phoneSignonLabel = 'Phone';
}

const ENV = String.fromEnvironment('ENV', defaultValue: 'production');
const USE_FIREBASE_EMULATOR =
    String.fromEnvironment('USE_FIREBASE_EMULATOR', defaultValue: 'false');

const defaultDisplayName = 'Anom';

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

Future<bool> deviceIsNotSimulator() async {
  return !(await deviceIsSimulator());
}

Future<bool> deviceIsIosSimulator() async =>
    Platform.isIOS && (await deviceIsSimulator());

class DebugHelpers {
  static const bool inDebugMode = kDebugMode;
  static bool isVerboseDebugMode = kDebugMode &&
      const String.fromEnvironment('verbose', defaultValue: '').isNotEmpty;
  static Future<bool> deviceIsSimulator() => deviceIsSimulator();
  static Future<bool> deviceIsNotSimulator() => deviceIsNotSimulator();
  static Future<bool> deviceIsIosSimulator() => deviceIsIosSimulator();
}

class PackageConstants {
  static const String iosBundleIdentifier =
      'com.vegi.vegiAppTest'; // Runner.xcodeproj/project.pbxproj => PRODUCT_BUNDLE_IDENTIFIER = com.example.appname;
  static const String androidBundleIdentifier =
      'com.vegi.vegiAppTest'; // AndroidManifest => manifest xmlns:android="http://schemas.android.com/apk/res/android"
  static const String webBundleIdentifier = 'vegiapp.co.uk';
}

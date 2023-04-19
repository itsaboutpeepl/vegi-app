import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:phone_number/phone_number.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/services/apis/blueBeaconService.dart';
import 'package:vegan_liverpool/services/apis/peeplEats.dart';
import 'package:vegan_liverpool/services/apis/locationService.dart';
import 'package:vegan_liverpool/services/apis/peeplPay.dart';
import 'package:vegan_liverpool/services/apis/stripePay.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';
import 'package:vegan_liverpool/utils/stripe.dart';

final RootRouter rootRouter = getIt<RootRouter>();

final FuseWalletSDK fuseWalletSDK = getIt<FuseWalletSDK>();

final LocationService locationService = getIt<LocationService>();

final PeeplEatsService peeplEatsService = getIt<PeeplEatsService>();

final StripePayService stripePayService = getIt<StripePayService>();

final PeeplPayService peeplPayService = getIt<PeeplPayService>();

final BlueBeaconService beaconService = getIt<BlueBeaconService>();

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

final FirebaseMessaging firebaseMessaging = getIt<FirebaseMessaging>();

final PhoneNumberUtil phoneNumberUtil = getIt<PhoneNumberUtil>();

final IOnBoardStrategy onBoardStrategy = getIt<IOnBoardStrategy>();

final StripeService stripeService = getIt<StripeService>();

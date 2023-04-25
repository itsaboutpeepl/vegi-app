// import 'dart:io';

// import 'package:vegan_liverpool/utils/constants.dart';
// import 'package:web3auth_flutter/enums.dart';
// import 'package:web3auth_flutter/input.dart';
// import 'package:web3auth_flutter/web3auth_flutter.dart';

Future<void> initWeb3AuthService({String? redirectUrl}) async {
  // await Web3AuthFlutter.init(
  //   Web3AuthOptions(
  //     clientId: Secrets.WEB3AUTH_CLIENT_ID,
  //     network: Network.testnet,
  //     redirectUrl: redirectUrl != null ? Uri.tryParse(redirectUrl) : null,
  //   ),
  // );
}

Future<void> loginWeb3Auth({
  // required Provider loginProvider,
  String? redirectUriVegiForPlatform,
}) async {
  // final Web3AuthResponse response = await Web3AuthFlutter.login(
  //   LoginParams(
  //     loginProvider: loginProvider, //Provider.email_passwordless, // ~
  //     redirectUrl: Uri.tryParse('vegi://vegiApp.co.uk/signup-screen'),
  //     redirectUrl: Uri.tryParse('vegi://vegiApp.co.uk/user-name-screen'),
  //   ), //TODO: allow users to login in any number of ways that they want to...
  // );
}

// Future<void> initPlatformState() async {
//   Uri redirectUrl;
//   if (Platform.isAndroid) {
//     redirectUrl = Uri.parse('{SCHEME}://{HOST}/auth');
//     // w3a://com.example.w3aflutter/auth
//   } else if (Platform.isIOS) {
//     redirectUrl = Uri.parse('{bundleId}://openlogin');
//     // com.example.w3aflutter://openlogin
//   } else {
//     throw UnKnownException('Unknown platform');
//   }

//   await Web3AuthFlutter.init(Web3AuthOptions(
//       clientId: "WEB3AUTH_CLIENT_ID",
//       network: Network.testnet,
//       redirectUrl: redirectUrl));
// }

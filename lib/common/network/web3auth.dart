import 'package:vegan_liverpool/utils/constants.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

Future<void> initWeb3AuthService({String? redirectUrl}) async {
  await Web3AuthFlutter.init(
    Web3AuthOptions(
      clientId: Secrets.WEB3AUTH_CLIENT_ID,
      network: Network.testnet,
      redirectUrl: redirectUrl != null ? Uri.tryParse(redirectUrl) : null,
    ),
  );
}

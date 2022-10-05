import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/services.dart';

Future<bool> signInWithSMS(String phoneNumber, Function onSuccess) async {
  bool result = await walletApi.loginWithSMS(phoneNumber);
  rootRouter.push(VerifyPhoneNumber());
  onSuccess();
  return result;
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vegan_liverpool/features/pay/screens/generate_QR_from_cart.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/generateQRFromCartViewModel.dart';
import 'package:vegan_liverpool/redux/viewsmodels/paymentSheet.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/copy.dart';

class GenerateQRFromCartScreen extends StatelessWidget {
  // String qrData = "https://github.com/ChinmayMunje";
  final qrdataFeed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Center(child: Text("Generate Tote QR Code")),
      ),
      body: GenerateQRFromCart(),
    );
  }
}

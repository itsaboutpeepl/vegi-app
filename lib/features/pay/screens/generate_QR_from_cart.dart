import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/generate_QR_from_cart_vm.dart';
import 'package:vegan_liverpool/redux/viewsmodels/paymentSheet.dart';

class GenerateQRFromCart extends StatefulWidget {
  @override
  _GenerateQRFromCartState createState() => _GenerateQRFromCartState();
}

class _GenerateQRFromCartState extends State<GenerateQRFromCart> {
  String qrData = "https://github.com/ChinmayMunje";
  final qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Center(child: Text("Generate QR Code")),
      ),
      body: StoreConnector<AppState, GenerateQRFromCartViewModel>(
          distinct: true,
          converter: GenerateQRFromCartViewModel.fromStore,
          onInit: (store) {
            // store
            //   ..dispatch(SetTransferringPayment(flag: false))
            //   ..dispatch(SetPaymentButtonFlag(false))
            //   ..dispatch(
            //     UpdateSelectedAmounts(
            //       gbpxAmount: (store.state.cartState.cartTotal) / 100,
            //       pplAmount: 0,
            //     ),
            //   );
          },
          builder: (_, viewmodel) {
            return Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                //Scroll view given to Column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QrImage(data: viewmodel.encodedCartItems),
                    // SizedBox(height: 20),
                    // Text(
                    //   "Generate QR Code",
                    //   style: TextStyle(fontSize: 20),
                    // ),

                    // //TextField for input link
                    // TextField(
                    //   decoration:
                    //       InputDecoration(hintText: "Enter your link here..."),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   //Button for generating QR code
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors
                    //           .white, // ~ The backgroundColor and foregroundColor properties were introduced in Flutter 3.3. Prior to that, they were called primary and onPrimary.
                    //       foregroundColor: Colors.black,
                    //       fixedSize: const Size(120, 40),
                    //       textStyle:
                    //           const TextStyle(fontWeight: FontWeight.w900),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       padding: const EdgeInsets.all(15),
                    //     ),
                    //     onPressed: () async {
                    //       //a little validation for the textfield
                    //       if (qrdataFeed.text.isEmpty) {
                    //         setState(() {
                    //           qrData = "";
                    //         });
                    //       } else {
                    //         setState(() {
                    //           qrData = qrdataFeed.text;
                    //         });
                    //       }
                    //     },
                    //     //Title given on Button
                    //     child: Text(
                    //       "Generate QR Code",
                    //       style: TextStyle(
                    //         color: Colors.indigo[900],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

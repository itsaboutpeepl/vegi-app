import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/ppl_balance_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/ppl_slider_control.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/paymentSheet.dart';

class QRFromCartSheet extends StatelessWidget {
  const QRFromCartSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeeplPaySheetViewModel>(
      distinct: true,
      converter: PeeplPaySheetViewModel.fromStore,
      onInit: (store) {
        store
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(
            UpdateSelectedAmounts(
              gbpxAmount: (store.state.cartState.cartTotal) / 100,
              pplAmount: 0,
            ),
          );
      },
      builder: (context, viewmodel) {
        return FractionallySizedBox(
          heightFactor: 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Peepl Pay InStore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      splashRadius: 25,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[800],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              // TODO: Replace the Entire Contents of the below widgets with the QR Code, app then waits for notification started by vendors phone to auto continue the process.
              // 1. Scan Generated QR code at till
              // 2. Get notification from vendor saying would you like to pay them x -> follow notifications
              // Alternatively the vendor builds the cart on theoir device and then user scans QR qhich brings up the 'would you like to pay' UN

              // const Image(
              //     image: NetworkImage(
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU")),

              //First Button
              ElevatedButton(
                child: Text(
                  'Scan QR Code',
                  style: TextStyle(color: Colors.indigo[900]),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .white, // ~ The backgroundColor and foregroundColor properties were introduced in Flutter 3.3. Prior to that, they were called primary and onPrimary.
                  foregroundColor: Colors.black,
                  fixedSize: const Size(120, 40),
                  textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  context.router.push(const ScanPaymentRecipientQR());
                },
              ),
              const SizedBox(height: 10),
              //Second Button
              ElevatedButton(
                child: Text(
                  "Generate QR Code",
                  style: TextStyle(color: Colors.indigo[900]),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(120, 40),
                  textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  context.router.push(const GenerateQRFromCart());
                },
              ),
              const Spacer()
            ],
          ),
        );
      },
    );
  }
}

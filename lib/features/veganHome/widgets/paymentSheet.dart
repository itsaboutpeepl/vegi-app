import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';
import 'package:vegan_liverpool/utils/biometric_local_auth.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  double _pplSliderValue = 0.0;
  double _amountToBePaid = 0;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      distinct: true,
      converter: UserCartViewModel.fromStore,
      onInit: (store) {
        _amountToBePaid = store.state.cartState.cartTotal.toDouble();
      },
      builder: (_, viewmodel) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.53,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Peepl Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      splashRadius: 25,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[800],
                        ),
                        child: Center(
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Current Wallet Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[800],
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "543.1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "GBPx",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: 20,
                      thickness: 2,
                      color: Colors.grey[600],
                      indent: 5,
                      endIndent: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "329.4",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          "assets/images/avatar-ppl-red.png",
                          width: 35,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  color: Colors.grey[800],
                  child: Column(
                    children: [
                      Text(
                        "Pay Delifonesca",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        "GBPx ${((_amountToBePaid / 100) - (_pplSliderValue / 1000)).toStringAsFixed(2)}, PPL ${(_pplSliderValue / 10).toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      // Text(
                      //   "Total Amount is ${cFPrice(viewmodel.cartTotal)}",
                      //   style: TextStyle(
                      //     color: Colors.grey[300],
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w200,
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total ${cFPrice(viewmodel.cartTotal)} | ",
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            "Earn ${(((_amountToBePaid / 100) - (_pplSliderValue / 1000)) * 5).toStringAsFixed(2)} ",
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Image.asset(
                            "assets/images/avatar-ppl-red.png",
                            width: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5.0,
                          trackShape: RoundedRectSliderTrackShape(),
                          activeTrackColor: Colors.grey[900],
                          inactiveTrackColor: Colors.grey[400],
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 9.0,
                            pressedElevation: 8.0,
                          ),
                          thumbColor: Colors.white,
                          overlayColor: Colors.grey.withOpacity(0.2),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 0.0),
                        ),
                        child: Slider(
                          min: 0.0,
                          max: _amountToBePaid * 10 <
                                  3294 //if amount to be paid is less than ppl balance then the max is amount to be paid * 10 otherwise max is wallet balance
                              ? _amountToBePaid * 100
                              : 3294,
                          value: _pplSliderValue,
                          divisions: 100,
                          onChanged: (value) {
                            setState(
                              () {
                                _pplSliderValue = value;
                              },
                            );
                          },
                        ),
                      ),
                      Text(
                        "Slide to use your Peepl Token balance",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : ElevatedButton(
                                child: Text("Pay Now"),
                                onPressed: () async {
                                  final BiometricAuth biometricAuth =
                                      await BiometricUtils
                                          .getAvailableBiometrics();
                                  final String biometric =
                                      BiometricUtils.getBiometricString(
                                    context,
                                    biometricAuth,
                                  );
                                  await BiometricUtils
                                      .showDefaultPopupCheckBiometricAuth(
                                    message:
                                        '${I10n.of(context).please_use} $biometric ${I10n.of(context).to_unlock}',
                                    callback: (bool result) {
                                      result
                                          ? setState(() {
                                              _isLoading = true;

                                              Future.delayed(
                                                  Duration(seconds: 3), () {
                                                context.router.push(
                                                    OrderConfirmedScreen());
                                              });
                                            })
                                          : null;
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  primary: Colors.grey[900],
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Europa",
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/paymentSheet.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/biometric_local_auth.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentSheetViewModel>(
      distinct: true,
      converter: PaymentSheetViewModel.fromStore,
      onInit: (store) {
        store
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            UpdateSelectedAmounts((store.state.cartState.cartTotal) / 100, 0),
          );
      },
      builder: (_, viewmodel) {
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
                      'Peepl Pay',
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
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  'Current Wallet Balance',
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
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          viewmodel.gbpXBalance,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          'GBPx',
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
                      indent: 15,
                      endIndent: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          viewmodel.pplBalance,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/avatar-ppl-red.png',
                          width: 25,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const PPLSlider(),
              const Spacer(),
              if (viewmodel.transferringTokens)
                const CircularProgressIndicator(
                  color: Colors.white,
                )
              else
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ShimmerButton(
                    buttonContent: const Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    buttonAction: () async {
                      if (await BiometricUtils.authenticateIsAvailable()) {
                        final BiometricAuth biometricAuth =
                            await BiometricUtils.getAvailableBiometrics();
                        final String biometric =
                            BiometricUtils.getBiometricString(
                          biometricAuth,
                        );
                        await BiometricUtils.showDefaultPopupCheckBiometricAuth(
                          message: 'Please use $biometric to unlock',
                          callback: (bool result) {
                            result
                                ? (parseBalance(viewmodel.gbpXBalance) <=
                                        viewmodel.selectedGBPxAmount)
                                    ? stripeService.handleStripe(
                                        walletAddress: viewmodel.walletAddress,
                                        amountText: ((parseBalance(
                                                          viewmodel.gbpXBalance,
                                                        ) -
                                                        viewmodel
                                                            .selectedGBPxAmount)
                                                    .abs() +
                                                0.01)
                                            .toStringAsFixed(2),
                                        context: context,
                                        shouldPushToHome: false,
                                      )
                                    : viewmodel.sendToken(
                                        () {
                                          context.router.push(
                                            const OrderConfirmedScreen(),
                                          );
                                        },
                                        () {
                                          print('error took place');
                                          showErrorSnack(
                                            context: context,
                                            title: 'Something went wrong',
                                          );
                                        },
                                      )
                                : context.router.pop();
                          },
                        );
                      } else {
                        //TODO: add pincode screen verification.
                        (double.parse(
                                  viewmodel.gbpXBalance.replaceAll(',', ''),
                                ) <=
                                viewmodel.selectedGBPxAmount)
                            ? stripeService.handleStripe(
                                walletAddress: viewmodel.walletAddress,
                                amountText: ((double.parse(
                                                  viewmodel.gbpXBalance
                                                      .replaceAll(',', ''),
                                                ) -
                                                viewmodel.selectedGBPxAmount)
                                            .abs() +
                                        0.01)
                                    .toStringAsFixed(2),
                                context: context,
                                shouldPushToHome: false,
                              )
                            : viewmodel.sendToken(
                                () {
                                  context.router
                                      .push(const OrderConfirmedScreen());
                                },
                                () {
                                  print('error took place');
                                  showErrorSnack(
                                    context: context,
                                    title: 'Something went wrong',
                                  );
                                },
                              );
                      }
                    },
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[850]!,
                  ),
                ),
              const Spacer()
            ],
          ),
        );
      },
    );
  }
}
//What do i need to do?

// I have a payment intent ID
// I have payment final amounts in GBPx and PPL
// Check if the amounts are actually there in the wallet
// Set Loading to true
// If PPL or GBPX payment amount is zero, dont make any payment in PPL/GBPx
// Make Payment for payment amount in GBPx
// Make Payment for payment amount in PPL
// Error? => show Error
// Confirmed => Show Screen

class PPLSlider extends StatefulWidget {
  const PPLSlider({Key? key}) : super(key: key);

  @override
  State<PPLSlider> createState() => _PPLSliderState();
}

class _PPLSliderState extends State<PPLSlider> {
  double _pplSliderValue = 0;
  double _gbpxSliderValue = 0;
  double _amountToBePaid = 0;
  double _pplBalance = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentSheetViewModel>(
      converter: PaymentSheetViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        _amountToBePaid = store.state.cartState.cartTotal.toDouble(); //in pence
        _gbpxSliderValue =
            store.state.cartState.cartTotal.toDouble(); //in pence
        _pplBalance = double.parse(
          store.state.cashWalletState.tokens[pplToken.address]!
              .getBalance(withPrecision: true),
        );
      },
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: (viewmodel.pplBalance != '0.0'
                    ? [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5,
                            trackShape: const RoundedRectSliderTrackShape(),
                            activeTrackColor: Colors.grey[800],
                            inactiveTrackColor: Colors.grey[400],
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 9,
                              pressedElevation: 8,
                            ),
                            thumbColor: Colors.white,
                            overlayColor: Colors.grey.withOpacity(0.2),
                            overlayShape:
                                const RoundSliderOverlayShape(overlayRadius: 0),
                          ),
                          child: Slider(
                            max: getPPLValueFromPence(_amountToBePaid) <
                                    _pplBalance // compare values in PPL terms //665 < 171.66 ? || 35 < 171.66
                                ? getPPLValueFromPence(_amountToBePaid)
                                : _pplBalance,
                            value: _pplSliderValue,
                            divisions: 100,
                            onChangeEnd: (value) {
                              _gbpxSliderValue = _amountToBePaid -
                                  value *
                                      10; //converting the PPL slider value into pence again
                              _pplSliderValue = value;
                              setState(() {});
                              viewmodel.updateSelectedValues(
                                _gbpxSliderValue / 100,
                                _pplSliderValue,
                              );
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  _gbpxSliderValue = _amountToBePaid -
                                      value *
                                          10; //converting the PPL slider value into pence again
                                  _pplSliderValue = value;
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Slide to use your Peepl Token balance',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]
                    : <Widget>[const SizedBox.shrink()]) +
                [
                  Text(
                    'Pay ${viewmodel.restaurantName}',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          'GBPx ${(_gbpxSliderValue / 100).toStringAsFixed(2)},',
                      children: [
                        TextSpan(
                          text: ' PPL ${_pplSliderValue.toStringAsFixed(2)}',
                        )
                      ],
                    ),
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Total ${cFPrice(viewmodel.cartTotal)} | ',
                      children: [
                        TextSpan(
                          text:
                              'Earn ${getPPLRewardsFromPence(_gbpxSliderValue).toStringAsFixed(2)} ',
                        ),
                        WidgetSpan(
                          child: Image.asset(
                            'assets/images/avatar-ppl-red.png',
                            width: 25,
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
          ),
        );
      },
    );
  }
}

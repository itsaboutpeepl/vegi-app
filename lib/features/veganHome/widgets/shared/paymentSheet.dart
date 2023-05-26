import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/pay/dialogs/stripe_payment_confirmed_dialog.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/ppl_balance_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/ppl_slider_control.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/paymentSheet.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeeplPaySheetViewModel>(
      converter: PeeplPaySheetViewModel.fromStore,
      onInit: (store) {
        store
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(
            UpdateSelectedAmounts(
              gbpxAmount: store.state.cartState.cartTotal.inGBPxValue.toDouble(),
              pplAmount: 0,
            ),
          );
      },
      distinct: true,
      onWillChange: (previousViewModel, newViewModel) async {
        if (newViewModel.transferringTokens &&
            !(previousViewModel?.transferringTokens ?? false)) {
          await showDialog<void>(
            context: context,
            builder: (context) => const ProcessingPayment(),
          );
        } else if (newViewModel.stripePaymentStatus !=
            (previousViewModel?.stripePaymentStatus ??
                StripePaymentStatus.none)) {
          String title = '';
          String message = '';
          if (newViewModel.stripePaymentStatus ==
              StripePaymentStatus.mintingFailed) {
            title = 'Minting update';
            message = 'minting failed';
            await showInfoSnack(
              context,
              title: message,
            );
          } else if (newViewModel.stripePaymentStatus ==
                  StripePaymentStatus.mintingStarted &&
              newViewModel.processingPayment != null) {
            await showDialog<void>(
              context: context,
              builder: (context) {
                return MintingDialog(
                  amountText:
                      newViewModel.processingPayment!.amount.formattedGBPxPrice,
                  shouldPushToHome: false,
                );
              },
              barrierDismissible: false,
            );
          } else if (newViewModel.stripePaymentStatus ==
              StripePaymentStatus.mintingSucceeded) {
            title = 'Minting update';
            message = 'minting succeeded';
            await showInfoSnack(
              context,
              title: message,
            );
          } else if (newViewModel.stripePaymentStatus ==
              StripePaymentStatus.paymentConfirmed) {
            // title = 'Payment update';
            // message = 'Payment confirmed';
            await showDialog<void>(
              context: context,
              builder: (context) {
                return const StripePaymentConfirmedDialog(); //TODO: Replace this with MintingDialog copy
              },
              barrierDismissible: true,
            );
          } else if (newViewModel.stripePaymentStatus ==
              StripePaymentStatus.paymentFailed) {
            await showDialog<void>(
              context: context,
              builder: (context) => const TopUpFailed(
                isFailed: true,
              ),
            );
          } else if (newViewModel.stripePaymentStatus ==
              StripePaymentStatus.topupSucceeded) {
            title = 'Topup update';
            message = 'Topup succeeded';
            await showInfoSnack(
              context,
              title: message,
            );
          } else {
            log.info(
                'Ignoring StripePaymentStatus update: "${newViewModel.stripePaymentStatus.name}"');
          }
        }
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
              const PeeplPayBalanceCard(),
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
                    buttonAction: () => viewmodel.startPaymentProcess(),
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

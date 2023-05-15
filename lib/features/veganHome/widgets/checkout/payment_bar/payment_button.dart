import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/pay/dialogs/stripe_payment_confirmed_dialog.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurant_not_live_dialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/qRFromCartSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/payment_methods.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/payment_method_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 60,
      child: StoreConnector<AppState, PaymentMethodViewModel>(
        converter: PaymentMethodViewModel.fromStore,
        distinct: true,
        // onWillChange: (previousViewModel, newViewModel) async {
        //   if (newViewModel.transferringTokens &&
        //       !(previousViewModel?.transferringTokens ?? false)) {
        //     await showDialog<void>(
        //       context: context,
        //       builder: (context) => const ProcessingPayment(),
        //     );
        //   } else if (newViewModel.orderCreationProcessStatus !=
        //       (previousViewModel?.orderCreationProcessStatus ??
        //           OrderCreationProcessStatus.none)) {
        //     if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.needToSelectATimeSlot) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'Please select a time slot',
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.needToSelectADeliveryAddress) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'Please select a delivery address',
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.sendOrderCallServerError) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'Our servers seem to be down',
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.sendOrderCallClientError) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'Failed to process order',
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.success) {
        //       // do nothing
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.sendOrderCallTimedOut) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'Our servers seem to be offline',
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus
        //             .paymentIntentAmountDoesntMatchCartTotal) {
        //       await showErrorSnack(
        //         context: context,
        //         title: "Order totals aren't matching",
        //       );
        //     } else if (newViewModel.orderCreationProcessStatus ==
        //         OrderCreationProcessStatus.orderIsBelowVendorMinimumOrder) {
        //       await showErrorSnack(
        //         context: context,
        //         title: 'This restaurant is not accepting orders below'
        //             '${newViewModel.restaurantMinimumOrder.formattedGBPxPrice}',
        //       );
        //     } else {
        //       log.info(
        //           'Ignoring OrderCreationProcessStatus update: "${newViewModel.orderCreationProcessStatus.name}"');
        //     }
        //   } else if (newViewModel.stripePaymentStatus !=
        //       (previousViewModel?.stripePaymentStatus ??
        //           StripePaymentStatus.none)) {
        //     String title = '';
        //     String message = '';
        //     if (newViewModel.stripePaymentStatus ==
        //         StripePaymentStatus.mintingFailed) {
        //       title = 'Minting update';
        //       message = 'minting failed';
        //       await showInfoSnack(
        //         context,
        //         title: message,
        //       );
        //     } else if (newViewModel.stripePaymentStatus ==
        //             StripePaymentStatus.mintingStarted &&
        //         newViewModel.processingPayment != null) {
        //       await showDialog<void>(
        //         context: context,
        //         builder: (context) {
        //           return MintingDialog(
        //             amountText: newViewModel
        //                 .processingPayment!.amount.formattedGBPxPrice,
        //             shouldPushToHome: true,
        //           );
        //         },
        //         barrierDismissible: false,
        //       );
        //     } else if (newViewModel.stripePaymentStatus ==
        //         StripePaymentStatus.mintingSucceeded) {
        //       title = 'Minting update';
        //       message = 'minting succeeded';
        //       await showInfoSnack(
        //         context,
        //         title: message,
        //       );
        //     } else if (newViewModel.stripePaymentStatus ==
        //         StripePaymentStatus.paymentConfirmed) {
        //       // title = 'Payment update';
        //       // message = 'Payment confirmed';
        //       await showDialog<void>(
        //         context: context,
        //         builder: (context) {
        //           return const StripePaymentConfirmedDialog(); //TODO: Replace this with MintingDialog copy
        //         },
        //         barrierDismissible: true,
        //       );
        //     } else if (newViewModel.stripePaymentStatus ==
        //         StripePaymentStatus.paymentFailed) {
        //       await showDialog<void>(
        //         context: context,
        //         builder: (context) => const TopUpFailed(
        //           isFailed: true,
        //         ),
        //       );
        //     } else if (newViewModel.stripePaymentStatus ==
        //         StripePaymentStatus.topupSucceeded) {
        //       title = 'Topup update';
        //       message = 'Topup succeeded';
        //       await showInfoSnack(
        //         context,
        //         title: message,
        //       );
        //     } else {
        //       log.info(
        //           'Ignoring StripePaymentStatus update: "${newViewModel.stripePaymentStatus.name}"');
        //     }
        //   }
        // },
        builder: (context, viewmodel) {
          return ShimmerButton(
            buttonContent: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewmodel.cartTotal,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Place Order',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            buttonAction: () {
              if (viewmodel.selectedRestaurantIsLive) {
                Analytics.track(
                  eventName: AnalyticsEvents.placeOrder,
                  properties: {'platform': 'vegi_app'},
                );
                viewmodel.startPaymentProcess(
                  showBottomPaymentSheet: (paymentMethod) async {
                    if (paymentMethod == PaymentMethod.qrPay) {
                      await showModalBottomSheet<Widget>(
                        isScrollControlled: true,
                        backgroundColor: const Color.fromARGB(255, 44, 42, 39),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        elevation: 5,
                        context: context,
                        builder: (context) => const QRFromCartSheet(),
                      );
                    } else if (paymentMethod == PaymentMethod.peeplPay) {
                      await showModalBottomSheet<Widget>(
                        isScrollControlled: true,
                        backgroundColor: Colors.grey[900],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        elevation: 5,
                        context: context,
                        builder: (context) => const PaymentSheet(),
                      );
                    }
                  },
                );
              } else {
                showDialog<Widget>(
                  context: context,
                  builder: (context) => const RestaurantNotLiveDialog(),
                );
              }
            },
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            isLoading: viewmodel.isLoading,
          );
        },
      ),
    );
  }
}

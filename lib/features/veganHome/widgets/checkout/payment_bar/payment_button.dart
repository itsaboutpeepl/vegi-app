import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/payment_method_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 60,
      child: StoreConnector<AppState, PaymentMethodViewModel>(
        converter: PaymentMethodViewModel.fromStore,
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
              Analytics.track(
                eventName: AnalyticsEvents.placeOrder,
              );
              viewmodel.startPaymentProcess(context: context);
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

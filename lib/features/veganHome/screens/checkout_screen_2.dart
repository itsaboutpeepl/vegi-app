import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/appbars/checkout_appbar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/appbars/ppl_rewards_appbar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/cart_items/cart_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/delivery_address_selector.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/fulfilment_method_selector.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_slots/delivery_time_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/bill_summary_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/discount_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/save_the_oceans_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/tip_selection_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/your_details_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/payment_bar/payment_bar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class CheckoutScreenPt2 extends StatelessWidget {
  const CheckoutScreenPt2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (_, flag) => const [
          CheckoutAppBar(
            key: ValueKey('checkoutAppBar'),
          ),
          PeeplRewardsAppBar(
            key: ValueKey('peeplAppBar'),
          )
        ],
        body: StoreConnector<AppState, bool>(
          onInit: (store) {
            store.dispatch(getNextAvaliableSlot());
          },
          converter: (store) => store.state.cartState.isDelivery,
          builder: (context, isDelivery) {
            return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    const DeliveryTimeCard(),
                    const FulfilmentMethodSelector(),
                    const CartItemsCard(),
                    const DiscountCard(),
                    const BillSummaryCard(),
                    if (isDelivery) const TipSelectionCard(),
                    const YourDetailsCard(),
                    //const SaveTheOceansCard(),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                ),
                const DeliveryAddressSelector(),
                const PaymentBar(),
              ],
            );
          },
        ),
      ),
    );
  }
}

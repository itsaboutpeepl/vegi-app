import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/address_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/bill_invoice_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/thanks_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/view_item.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/orderConfirmed.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrderConfirmedViewModel>(
      converter: OrderConfirmedViewModel.fromStore,
      onInit: (store) => store.dispatch(createNewPastOrder()),
      builder: (_, viewmodel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30,
                top: MediaQuery.of(context).size.height * 0.08,
              ),
              child: Column(
                children: [
                  ThankYouCard(
                    isDelivery: viewmodel.isDelivery,
                    orderId: viewmodel.orderID,
                  ),
                  AddressCard(
                    isDelivery: viewmodel.isDelivery,
                    orderAddress: viewmodel.orderAddress,
                    selectedSlot: viewmodel.selectedSlot!,
                    userName: viewmodel.userName,
                    restaurantName: viewmodel.restaurantName,
                  ),
                  BillInvoiceCard(orderDetails: viewmodel.orderDetails),
                  OrderListCard(
                    orderItems: viewmodel.cartItems
                        .map(
                          (oi) => ViewItem(
                            name: oi.menuItem.name,
                            totalPriceFormatted: oi.formattedPrice,
                            chosenOptions: oi.selectedProductOptionsString,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ShimmerButton(
                      buttonContent: const Center(
                        child: Text(
                          'Back to Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      buttonAction: () {
                        context.router.replaceAll([const VeganHomeScreenAlt()]);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () => viewmodel.clearCart(),
                        );
                      },
                      baseColor: Colors.grey[900]!,
                      highlightColor: Colors.grey[800]!,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

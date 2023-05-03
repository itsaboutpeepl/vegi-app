import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/address_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/bill_invoice_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_status_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/thanks_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/cart/view_item.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/orderConfirmed.dart';

class OrderViewScreen extends StatelessWidget {
  const OrderViewScreen({
    Key? key,
    required this.order,
    required this.isNewOrder,
    required this.homeAction,
  }) : super(key: key);

  final Order order;

  final bool isNewOrder;

  final void Function() homeAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 30,
            top: MediaQuery.of(context).size.height * 0.08,
          ),
          child: Column(
            children: [
              if (isNewOrder)
                ThankYouCard(
                  // * only on orderConfirmed
                  isDelivery: order.isDelivery,
                  orderId: order.orderID,
                )
              else
                OrderStatusCard(
                  isDelivery: order.isDelivery,
                  orderId: order.orderID,
                  orderStatus: order.orderAcceptanceStatus,
                ),

              AddressCard(
                isDelivery: order.isDelivery,
                orderAddress: order.address,
                selectedSlot: order.timeSlot,
                userName: order.deliveryName ?? 'No name',
                restaurantName: order.restaurantName,
              ),
              BillInvoiceCard(
                order: order,
              ), //TODO: include once we pull following from api in the order object: gbpxUsed, didUsePPL, pplUsed, pplRewardsEarned, pplRewardsEarnedValue;
              OrderListCard(
                orderItems: order.items
                    .map(
                      (element) => ViewItem(
                        name: element.product.name,
                        totalPriceFormatted: element.formattedPrice,
                        chosenOptions: element.selectedProductOptionsString,
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
                  buttonAction: homeAction,
                  baseColor: Colors.grey[900]!,
                  highlightColor: Colors.grey[800]!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleOrderItem.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

class PreparingOrderPage extends StatelessWidget {
  const PreparingOrderPage({Key? key, required this.orderDetails})
      : super(key: key);

  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorToWhiteGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/${orderDetails.orderAcceptanceStatus.imageTitle}',
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Order Status: ${orderDetails.orderAcceptanceStatus.name.capitalize()}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    orderDetails.orderAcceptanceStatus
                        .descriptionText(orderDetails.orderID),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.zero,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: orderDetails.isDelivery
                                        ? 'Delivering To \n\n'
                                        : 'Collecting From \n\n',
                                    children: [
                                      TextSpan(
                                        text: orderDetails.isDelivery
                                            ? '${orderDetails.userName}\n'
                                            : '${orderDetails.restaurantName}\n',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${orderDetails.orderAddress.addressLine1}, ',
                                      ),
                                      TextSpan(
                                        text:
                                            '${orderDetails.orderAddress.addressLine2}\n',
                                      ),
                                      TextSpan(
                                        text:
                                            '${orderDetails.orderAddress.postalCode}, ',
                                      ),
                                      TextSpan(
                                        text:
                                            orderDetails.orderAddress.townCity,
                                      ),
                                      TextSpan(
                                        text: '\nSlot: ${mapToString(
                                          orderDetails.selectedSlot,
                                        )}',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.zero,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Order Details \n\n\n',
                                    children: [
                                      TextSpan(
                                        text:
                                            '${cFPrice(orderDetails.cartTotal)}\n',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${orderDetails.GBPxAmountPaid.toStringAsFixed(2)} GBPx\n',
                                      ),
                                      TextSpan(
                                        text:
                                            '${orderDetails.PPLAmountPaid.toStringAsFixed(2)} ',
                                      ),
                                      WidgetSpan(
                                        child: Image.asset(
                                          'assets/images/avatar-ppl-red.png',
                                          width: 20,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' used',
                                      ),
                                      TextSpan(
                                        text:
                                            '\n${(orderDetails.GBPxAmountPaid * 0.05).toStringAsFixed(2)} ',
                                      ),
                                      WidgetSpan(
                                        child: Image.asset(
                                          'assets/images/avatar-ppl-red.png',
                                          width: 20,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' earned',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ] +
                orderDetails.cartItems
                    .map<Widget>(
                      (element) => SingleCartItem(
                        orderItem: element,
                      ),
                    )
                    .toList() +
                [
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
  }
}

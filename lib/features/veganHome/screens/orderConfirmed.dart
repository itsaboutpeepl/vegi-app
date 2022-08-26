import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleOrderItem.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/order_confirmed.dart';

class OrderConfirmedScreen extends StatefulWidget {
  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  _OrderConfirmedScreenState createState() => _OrderConfirmedScreenState();
}

class _OrderConfirmedScreenState extends State<OrderConfirmedScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 10));

    playConfetti();

    super.initState();
  }

  void playConfetti() {
    Future.delayed(Duration(milliseconds: 500), () {
      print("Playing confeetitititit");
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrderConfirmedViewModel>(
      converter: OrderConfirmedViewModel.fromStore,
      onInit: (store) {
        final OrderDetails orderDetails = OrderDetails(
          selectedSlot: store.state.cartState.selectedTimeSlot,
          isDelivery: store.state.cartState.isDelivery,
          orderAddress: store.state.cartState.isDelivery
              ? store.state.cartState.selectedDeliveryAddress!
              : store.state.cartState.restaurantAddress!,
          restaurantName: store.state.cartState.restaurantName,
          cartItems: store.state.cartState.cartItems,
          cartTotal: store.state.cartState.cartTotal,
          orderID: store.state.cartState.orderID,
          userName: store.state.userState.displayName,
          phoneNumber: store.state.cartState.isDelivery
              ? store.state.cartState.selectedDeliveryAddress!.phoneNumber ?? ""
              : store.state.cartState.restaurantAddress!.phoneNumber ?? "",
          GBPxAmountPaid: store.state.cartState.selectedGBPxAmount,
          PPLAmountPaid: store.state.cartState.selectedPPLAmount,
          orderAcceptanceStatus: OrderAcceptanceStatus.pending,
        );

        if (isScheduledDelivery(orderDetails.selectedSlot)) {
          List<OrderDetails> listOfScheduledOrders =
              List<OrderDetails>.from(store.state.pastOrderState.listOfScheduledOrders);

          listOfScheduledOrders.add(orderDetails);
          store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
        } else {
          List<OrderDetails> listOfOngoingOrders =
              List<OrderDetails>.from(store.state.pastOrderState.listOfOngoingOrders);

          listOfOngoingOrders.add(orderDetails);
          store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));
        }
      },
      builder: (_, viewmodel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colorToWhiteGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          viewmodel.isDelivery
                              ? Image.asset("assets/images/order-confirmed.png")
                              : Image.asset(
                                  "assets/images/order-confirmed-collection.png",
                                  width: MediaQuery.of(context).size.width * 0.6,
                                ),
                          ConfettiWidget(
                            confettiController: _confettiController,
                            blastDirectionality: BlastDirectionality.explosive,
                            shouldLoop: false,
                            colors: [
                              Colors.green.withOpacity(0.8),
                              Colors.blue.withOpacity(0.8),
                              Colors.pink.withOpacity(0.8),
                              Colors.orange.withOpacity(0.8),
                              Colors.purple.withOpacity(0.8)
                            ],
                            createParticlePath: drawStar,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("playing");
                          _confettiController.play();
                        },
                        child: Text(
                          "Thank you for choosing vegi!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Your order #${viewmodel.orderID} has been received and will be confirmed shortly. We'll send you a text with an update once they respond! \n Thank you for ordering with vegi 💚",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.zero,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: viewmodel.isDelivery ? "Delivering To \n\n" : "Collecting From \n\n",
                                        children: [
                                          TextSpan(
                                            text: viewmodel.isDelivery
                                                ? "${viewmodel.userName}\n"
                                                : "${viewmodel.restaurantName}\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: viewmodel.orderAddress.addressLine1 + ", ",
                                          ),
                                          TextSpan(
                                            text: viewmodel.orderAddress.addressLine2 + "\n",
                                          ),
                                          TextSpan(
                                            text: viewmodel.orderAddress.postalCode + ", ",
                                          ),
                                          TextSpan(
                                            text: viewmodel.orderAddress.townCity,
                                          ),
                                          TextSpan(text: "\nSlot: " + mapToString(viewmodel.selectedSlot))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.zero,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "Order Details \n\n\n",
                                        children: [
                                          TextSpan(
                                            text: "${cFPrice(viewmodel.cartTotal)}\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${(viewmodel.GBPxAmountPaid / 100).toStringAsFixed(2)} GBPx\n",
                                          ),
                                          TextSpan(
                                            text: "${viewmodel.PPLAmountPaid.toStringAsFixed(2)} ",
                                          ),
                                          WidgetSpan(
                                            child: Image.asset(
                                              "assets/images/avatar-ppl-red.png",
                                              width: 20,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "\n${getPPLRewardsFromPence(viewmodel.GBPxAmountPaid).toStringAsFixed(2)} ",
                                          ),
                                          WidgetSpan(
                                            child: Image.asset(
                                              "assets/images/avatar-ppl-red.png",
                                              width: 20,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " earned",
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
                    viewmodel.cartItems
                        .map<Widget>(
                          (element) => SingleCartItem(
                            orderItem: element,
                          ),
                        )
                        .toList() +
                    [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ShimmerButton(
                            buttonContent: Center(
                              child: Text(
                                "Back to Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            buttonAction: () {
                              context.router.replaceAll([VeganHomeScreenAlt()]);
                              Future.delayed(Duration(seconds: 2), () => viewmodel.clearCart());
                            },
                            baseColor: Colors.grey[900]!,
                            highlightColor: Colors.grey[800]!),
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

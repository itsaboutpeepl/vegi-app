import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleOrderItem.dart';
import 'package:vegan_liverpool/models/app_state.dart';
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
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));

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
      builder: (_, viewmodel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colorToWhiteGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.3, 0.5, 0.7, 0.9],
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
                          Image.asset("assets/images/order-confirmed.png"),
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
                          "Thank you for choosing Vegi!",
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
                        "Your order #${viewmodel.orderID} has been confirmed and will be delivered by Agile Liverpool within the next hour.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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
                                        text: viewmodel.isDelivery
                                            ? "Delivering To \n\n"
                                            : "Collecting From \n\n",
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
                                            text: viewmodel
                                                    .orderAddress.houseNumber +
                                                ", ",
                                          ),
                                          TextSpan(
                                            text: viewmodel
                                                    .orderAddress.buildingName +
                                                "\n",
                                          ),
                                          TextSpan(
                                            text: viewmodel
                                                    .orderAddress.postalCode +
                                                ", ",
                                          ),
                                          TextSpan(
                                            text:
                                                viewmodel.orderAddress.townCity,
                                          )
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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
                                        text: "Order Details \n\n",
                                        children: [
                                          TextSpan(
                                            text:
                                                "${cFPrice(viewmodel.cartTotal)}\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${viewmodel.GBPxAmountPaid} GBPx\n",
                                          ),
                                          TextSpan(
                                            text: "${viewmodel.PPLAmountPaid} ",
                                          ),
                                          WidgetSpan(
                                            child: Image.asset(
                                              "assets/images/avatar-ppl-red.png",
                                              width: 20,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "\n${(viewmodel.GBPxAmountPaid * 5).toStringAsFixed(2)} ",
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
                          )
                        ],
                      )
                    ] +
                    viewmodel.cartItems
                        .map<Widget>(
                          (element) => SingleOrderItem(
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
                              context.router.push(VeganHomeScreenAlt());
                              viewmodel.clearCart();
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

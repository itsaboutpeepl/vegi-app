import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleOrderItem.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

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
        ConfettiController(duration: const Duration(seconds: 5));

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
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colorToWhiteGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.3, 0.5, 0.7, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 60.0),
                child: Column(
                  children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Image.asset("assets/images/order-confirmed.png"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Order Confirmed",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your order #00001 has been confirmed and will be delivered by Agile Liverpool within the next hour.",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              color: Color(0xFFF6F6F6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Rewards Earned",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    ConfettiWidget(
                                      confettiController: _confettiController,
                                      blastDirectionality: BlastDirectionality
                                          .explosive, // don't specify a direction, blast randomly
                                      shouldLoop:
                                          false, // start again as soon as the animation is finished
                                      colors: const [
                                        Colors.green,
                                        Colors.blue,
                                        Colors.pink,
                                        Colors.orange,
                                        Colors.purple
                                      ], // manually specify the colors to be used
                                      createParticlePath: drawStar,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "342.5",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/avatar-ppl-red.png",
                                      width: 35,
                                    )
                                  ],
                                ),
                              ),
                            ),
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
                        // Card(
                        //   color: Color(0xFFF6F6F6),
                        //   margin: const EdgeInsets.only(
                        //       left: 20, right: 20, bottom: 20),
                        //   child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             "Total Amount Paid",
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 25,
                        //               fontWeight: FontWeight.w800,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: 10,
                        //           ),
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceEvenly,
                        //             children: [
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Text(
                        //                     "543.1",
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 25,
                        //                       fontWeight: FontWeight.w800,
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: 2,
                        //                   ),
                        //                   Text(
                        //                     "GBPx",
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.w400,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.end,
                        //                 children: [
                        //                   Text(
                        //                     "329.4",
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 25,
                        //                       fontWeight: FontWeight.w800,
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: 2,
                        //                   ),
                        //                   Image.asset(
                        //                     "assets/images/avatar-ppl-red.png",
                        //                     width: 35,
                        //                   ),
                        //                   SizedBox(
                        //                     height: 5,
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       )),
                        // ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          child: Text("Back To Home"),
                          onPressed: () {
                            context.router.push(VeganHomeScreenAlt());
                            viewmodel.clearCart();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            primary: Colors.grey[900],
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Europa",
                            ),
                          ),
                        ),
                      ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

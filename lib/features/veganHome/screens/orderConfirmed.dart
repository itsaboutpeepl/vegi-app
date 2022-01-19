import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

class OrderConfirmedScreen extends StatefulWidget {
  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  _OrderConfirmedScreenState createState() => _OrderConfirmedScreenState();
}

class _OrderConfirmedScreenState extends State<OrderConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow[200]!, Colors.yellow[100]!, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.1, 0.15],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
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
                loremImpsum,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              ElevatedButton(
                child: Text("Back To Home"),
                onPressed: () {
                  context.router.push(VeganHomeScreenAlt());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
    );
  }
}

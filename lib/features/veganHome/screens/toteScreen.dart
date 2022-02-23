import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/SingleCartItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class ToteScreen extends StatefulWidget {
  const ToteScreen({Key? key}) : super(key: key);

  @override
  _ToteScreenState createState() => _ToteScreenState();
}

class _ToteScreenState extends State<ToteScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: CustomAppBar(
            centerText: "",
            pageTitle: "Cart",
            otherAction: IconButton(
              onPressed: () => viewmodel.clearCart(),
              icon: ImageIcon(
                AssetImage("assets/images/clear-shopping-tote.png"),
              ),
            ),
          ),
          body: viewmodel.cartItems.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: viewmodel.cartItems
                            .map<Widget>(
                              (element) => SingleCartItem(orderItem: element),
                            )
                            .toList() +
                        [
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: Colors.grey[300],
                            indent: 20,
                            endIndent: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          totalsPriceItemTile(
                            "Subtotal",
                            cFPrice(viewmodel.cartSubTotal),
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey[300],
                            indent: 20,
                            endIndent: 20,
                          ),
                          totalsPriceItemTile(
                            "Total",
                            cFPrice(viewmodel.cartTotal),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: ShimmerButton(
                              buttonAction: () =>
                                  context.router.push(CheckoutScreen()),
                              buttonContent: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_basket_rounded,
                                    color: Colors.grey[800],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Checkout",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                  ),
                )
              : Center(
                  child: Text("Add some items to cart"), //TODO: Need Better UI
                ),
        );
      },
    );
  }

  Widget totalsPriceItemTile(String title, String trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            trailing,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

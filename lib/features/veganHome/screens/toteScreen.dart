import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/veganHome.dart';

List<String> tileTitles = ["Subtotal", "Tax", "Discount", "Total"];

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
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: CustomAppBar(
            centerText: "",
            pageTitle: "Cart",
            hasSearchAction: false,
          ),
          body: viewmodel.currentUserCart.cartItems.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: viewmodel.currentUserCart.cartItems
                            .map(
                              (element) => singleCartItem(element),
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
                            height: 20,
                          ),
                          totalsPriceItemTile(
                            "Subtotal",
                            cFPrice(viewmodel.currentUserCart.cartSubTotal),
                          ),
                          totalsPriceItemTile(
                            "Tax",
                            cFPrice(viewmodel.currentUserCart.cartTax),
                          ),
                          totalsPriceItemTile(
                            "Discount",
                            cFPrice(viewmodel.currentUserCart.cartDiscount),
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
                            cFPrice(viewmodel.currentUserCart.cartTotal),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.push(CheckoutScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_basket_rounded),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Checkout"),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                onPrimary: Colors.grey[800],
                                primary: Colors.yellow,
                                shadowColor: Colors.yellow,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
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

  Widget addOnPriceItemTile(String title, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          trailing,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget singleCartItem(OrderItem orderItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CachedNetworkImage(
                imageUrl: orderItem.menuItem.imageURLs[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text(
                      orderItem.menuItem.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          orderItem.menuItem.formattedPrice,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        quantityButtons(orderItem.itemQuantity),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Addons",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ] +
                  orderItem.selectedOptions.entries
                      .map(
                        (e) => addOnPriceItemTile(
                          e.key,
                          cFPrice(e.value),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget quantityButtons(int quantity) {
  return Row(
    children: [
      Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
            child: Icon(
          Icons.remove,
          size: 15,
        )),
      ),
      Container(
        height: 25,
        width: 35,
        child: Center(
          child: Text(
            quantity.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            vertical: BorderSide(color: Colors.grey),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(3, 0), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 15,
          ),
        ),
      ),
    ],
  );
}

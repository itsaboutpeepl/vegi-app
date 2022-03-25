import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/contacts/widgets/empty_state.dart';
import 'package:vegan_liverpool/features/shared/widgets/transparent_button.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/account.dart';
import 'package:vegan_liverpool/services.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  late List<Map<String, dynamic>> listOfOrders;
  bool _isLoading = true;
  bool _isEmpty = false;

  void fetchOrdersList(String walletAddress) async {
    listOfOrders =
        (await vegiEatsService.getPastOrders(walletAddress)).reversed.toList();

    setState(() {
      listOfOrders;
      _isLoading = false;
      listOfOrders.isEmpty ? _isEmpty = true : _isEmpty = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountViewModel>(
      converter: AccountViewModel.fromStore,
      onInit: (store) => fetchOrdersList(store.state.userState.walletAddress),
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: CustomAppBar(
            pageTitle: "My Orders",
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator())
              : _isEmpty
                  ? EmptyStatePage(
                      emoji: "😐",
                      title: "Pretty empty here, isn't it?",
                      subtitle:
                          "Try ordering from one of our amazing restauarants to fill this page up!",
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      itemBuilder: (_, index) =>
                          SingleOrderCard(order: listOfOrders[index]),
                      separatorBuilder: (_, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                      itemCount: listOfOrders.length),
        );
      },
    );
  }
}

class SingleOrderCard extends StatefulWidget {
  const SingleOrderCard({Key? key, required this.order}) : super(key: key);

  final Map<String, dynamic> order;

  @override
  State<SingleOrderCard> createState() => _SingleOrderCardState();
}

class _SingleOrderCardState extends State<SingleOrderCard> {
  bool _showDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: themeShade200,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Delifonesca \n",
                      children: [
                        TextSpan(
                          text: widget.order['total'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: widget.order['orderedDateTime'] + "\n",
                      children: [
                        TextSpan(
                          text: "Status: ${widget.order['paymentStatus']}",
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => SingleProductOrderItem(
                    product: widget.order['products'][index]),
                separatorBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                ),
                itemCount: widget.order['products'].length,
              ),
              SizedBox(
                height: 10,
              ),
              TransparentButton(
                label: "Show Delivery Address",
                onPressed: () => setState(() {
                  _showDelivery = !_showDelivery;
                }),
                fontSize: 15,
              ),
              _showDelivery
                  ? Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.order['deliveryName'] + "\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.order['deliveryEmail'] + "\n",
                                ),
                                TextSpan(
                                  text: widget.order['deliveryPhoneNumber'] +
                                      "\n",
                                ),
                                TextSpan(
                                  text: widget.order['deliveryAddressLineOne'] +
                                      ", ",
                                ),
                                TextSpan(
                                  text: widget.order['deliveryAddressLineTwo'] +
                                      "\n",
                                ),
                                TextSpan(
                                  text: widget.order['deliveryAddressPostCode'],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      color: Colors.white,
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProductOrderItem extends StatefulWidget {
  const SingleProductOrderItem({Key? key, required this.product})
      : super(key: key);

  final Map<String, dynamic> product;

  @override
  State<SingleProductOrderItem> createState() => _SingleProductOrderItemState();
}

class _SingleProductOrderItemState extends State<SingleProductOrderItem> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: widget.product['name'], children: [
                    TextSpan(text: "\n${widget.product['basePrice']}")
                  ]),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                widget.product.containsKey('options')
                    ? GestureDetector(
                        onTap: () => setState(() {
                          _showOptions = !_showOptions;
                        }),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            _showOptions ? Icons.remove : Icons.add,
                            size: 19,
                            color: themeShade300,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ] +
          widget.product['options']
              .map<Widget>(
                (Map<String, dynamic> option) => _showOptions
                    ? Text.rich(
                        TextSpan(
                          text: option['name'],
                          children: [
                            TextSpan(text: " - "),
                            TextSpan(text: option['chosenOption']),
                            TextSpan(text: " - "),
                            TextSpan(text: cFPrice(option['priceModifier']))
                          ],
                        ),
                        style: TextStyle(color: Colors.grey[700]),
                      )
                    : SizedBox.shrink(),
              )
              .toList(),
    );
  }
}

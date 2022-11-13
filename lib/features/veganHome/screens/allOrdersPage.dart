// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: argument_type_not_assignable
//TODO: Fix dynamic stuff here.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/transparent_button.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/cart/orderItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/account.dart';
import 'package:vegan_liverpool/services.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  late List<Order> listOfOrders;
  bool _isLoading = true;
  bool _isEmpty = false;

  Future<void> fetchOrdersList(String walletAddress) async {
    listOfOrders =
        (await peeplEatsService.getPastOrders(walletAddress)).reversed.toList();

    setState(() {
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
          appBar: const CustomAppBar(
            pageTitle: 'My Orders',
          ),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _isEmpty
                  ? const EmptyStatePage(
                      emoji: '😐',
                      title: 'You have no upcoming orders… yet!',
                      subtitle: 'If this is incorrect, please contact support '
                          ' for assistance. Details are in our FAQ section.',
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      itemBuilder: (_, index) =>
                          SingleOrderCard(order: listOfOrders[index]),
                      separatorBuilder: (_, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      itemCount: listOfOrders.length,
                    ),
        );
      },
    );
  }
}

class SingleOrderCard extends StatefulWidget {
  const SingleOrderCard({Key? key, required this.order}) : super(key: key);

  final Order order;

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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '${widget.order.restaurantName}\n',
                      children: [
                        TextSpan(
                          text: '${widget.order.total.formattedPrice}\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${widget.order.rewardsIssued.toStringAsFixed(2)} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        WidgetSpan(
                          child: Image.asset(
                            'assets/images/avatar-ppl-red.png',
                            width: 25,
                          ),
                        ),
                        const TextSpan(
                          text: ' earned',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '${widget.order.orderedDateTime.formattedForUI}\n',
                      children: [
                        TextSpan(
                          text:
                              'Status: ${widget.order.restaurantAcceptanceStatus.name.capitalize()}',
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                padding: const EdgeInsets.only(bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => SingleProductOrderItem(
                  orderItem: widget.order.items[index],
                ),
                separatorBuilder: (_, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                itemCount: widget.order.items.length,
              ),
              if (widget.order.isCollection)
                const SizedBox.shrink()
              else
                TransparentButton(
                  label: 'Show Delivery Address',
                  onPressed: () => setState(() {
                    _showDelivery = !_showDelivery;
                  }),
                  fontSize: 15,
                ),
              if (_showDelivery)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  color: Colors.white,
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
                              text: '${widget.order.deliveryName}\n',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.order.deliveryEmail}\n',
                            ),
                            TextSpan(
                              text: '${widget.order.deliveryPhoneNumber}\n',
                            ),
                            TextSpan(
                              text: '${widget.order.deliveryAddressLineOne}, ',
                            ),
                            TextSpan(
                              text: '${widget.order.deliveryAddressLineTwo}\n',
                            ),
                            TextSpan(
                              text: widget.order.deliveryAddressPostCode,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProductOrderItem extends StatefulWidget {
  const SingleProductOrderItem({Key? key, required this.orderItem})
      : super(key: key);

  final OrderItem orderItem;

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
                  TextSpan(
                    text: widget.orderItem.product.name,
                    children: [
                      TextSpan(
                          text:
                              '\n${widget.orderItem.product.basePrice.formattedPrice}')
                    ],
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.orderItem.product.options.isNotEmpty)
                  GestureDetector(
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
                else
                  const SizedBox.shrink(),
              ],
            ),
          ] +
          widget.orderItem.product.options
              .map<Widget>(
                (option) => _showOptions
                    ? Text.rich(
                        TextSpan(
                          text: option.name,
                          children: [
                            const TextSpan(text: ': '),
                            TextSpan(text: option.chosenOption),
                            const TextSpan(text: ' - '),
                            TextSpan(text: cFPrice(option.priceModifier))
                          ],
                        ),
                        style: TextStyle(color: Colors.grey[700]),
                      )
                    : const SizedBox.shrink(),
              )
              .toList(),
    );
  }
}

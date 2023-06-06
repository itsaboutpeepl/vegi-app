import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/cart/orderItem.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class ScheduledOrdersPage extends StatelessWidget {
  const ScheduledOrdersPage({Key? key}) : super(key: key);

  int itemCount(PastOrdersViewmodel viewmodel) =>
      viewmodel.listOfScheduledOrders.isEmpty
          ? 1
          : viewmodel.listOfScheduledOrders.length;

  Widget? Function(BuildContext context, int index) itemBuilder(
    PastOrdersViewmodel viewmodel,
  ) {
    Widget? builder(BuildContext context, int index) {
      if (viewmodel.listOfScheduledOrders.isEmpty) {
        return const EmptyStatePage(
          emoji: '😐',
          title: "Pretty empty here, isn't it?",
          subtitle:
              'Try scheduling an order from one of our amazing restauarants to fill this page up!',
          refreshable: true,
        );
      } else {
        return SingleScheduledOrderCard(
          order: viewmodel.listOfScheduledOrders[index],
        );
      }
    }

    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: const CustomAppBar(
            pageTitle: 'Scheduled Orders',
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemBuilder: itemBuilder(viewmodel),
            itemCount: itemCount(viewmodel),
            separatorBuilder: (_, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        );
      },
    );
  }
}

class SingleScheduledOrderCard extends StatelessWidget {
  const SingleScheduledOrderCard({Key? key, required this.order})
      : super(key: key);

  final Order order;

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
                      text: '${order.restaurantName}\n',
                      children: [
                        TextSpan(
                          text: '${order.cartTotal.inCcy(Currency.GBP).value.toStringAsFixed(2)}\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (order.rewardsTokensAmountPaid != 0.0)
                          TextSpan(
                            text:
                                '${order.rewardsTokensAmountPaid.toStringAsFixed(2)} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        else
                          const WidgetSpan(child: SizedBox.shrink()),
                        WidgetSpan(
                          child: order.rewardsTokensAmountPaid != 0.0
                              ? Image.asset(
                                  'assets/images/avatar-ppl-red.png',
                                  width: 25,
                                )
                              : const SizedBox.shrink(),
                        ),
                        if (order.rewardsTokensAmountPaid != 0.0)
                          const TextSpan(text: '\n')
                        else
                          const WidgetSpan(child: SizedBox.shrink()),
                        TextSpan(
                          text:
                              '${order.rewardsEarnedInPPL.toStringAsFixed(2)} ',
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
                      text: '${order.timeSlot.formattedDate}\n',
                      children: const [
                        TextSpan(
                          text: 'Status: Paid',
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
                padding: const EdgeInsets.only(bottom: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => SingleProductOrderItem(
                  item: order.items[index],
                ),
                separatorBuilder: (_, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                itemCount: order.items.length,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${order.deliveryName}\n',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '${order.deliveryAddressLineOne},',
                          ),
                          TextSpan(
                            text: '${order.deliveryAddressLineTwo}\n',
                          ),
                          TextSpan(
                            text: '${order.deliveryAddressCity}, ',
                          ),
                          TextSpan(
                            text: '${order.deliveryAddressPostCode}\n',
                          ),
                          // TextSpan(
                          //   text: orderDetails.orderAddress.phoneNumber,
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProductOrderItem extends StatefulWidget {
  const SingleProductOrderItem({Key? key, required this.item})
      : super(key: key);

  final OrderItem item;

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
                    text: widget.item.product?.name,
                    children: [
                      TextSpan(
                        text: '\n${widget.item.formattedPrice}',
                      )
                    ],
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.item.product?.options
                    .isNotEmpty ?? false)
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
          (widget.item.product?.options ?? [])
              .map(
                (option) => _showOptions
                    ? Text.rich(
                        TextSpan(
                          text: option.name,
                          children: [
                            const TextSpan(text: ' - '),
                            TextSpan(text: option.priceModifierFormatted)
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

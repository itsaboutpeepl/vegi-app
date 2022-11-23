import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_item_single.dart';
import 'package:vegan_liverpool/models/cart/view_item.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({Key? key, required this.orderItems}) : super(key: key);

  final List<ViewItem> orderItems;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: themeShade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Order',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderItems.length,
                itemBuilder: (_, index) => OrderItemSingle(
                  orderItem: orderItems[index],
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: themeShade300,
                  thickness: 1,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

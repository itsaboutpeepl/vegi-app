import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';

class OrderStatusCard extends StatefulWidget {
  const OrderStatusCard({
    Key? key,
    required this.isDelivery,
    required this.orderId,
    required this.orderStatus,
  }) : super(key: key);

  final bool isDelivery;
  final String orderId;
  final OrderAcceptanceStatus orderStatus;

  @override
  State<OrderStatusCard> createState() => _OrderStatusCardState();
}

class _OrderStatusCardState extends State<OrderStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeShade100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    widget.isDelivery
                        ? 'assets/${DeliveryOrderCreationStatus.confirmed.imageTitle}'
                        : 'assets/${CollectionOrderCreationStatus.confirmed.imageTitle}',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Order Status: ${widget.orderStatus.name.capitalize()}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.orderStatus.descriptionText(widget.orderId),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.isDelivery,
    required this.orderAddress,
    required this.selectedSlot,
    required this.userName,
    required this.restaurantName,
  }) : super(key: key);

  final bool isDelivery;
  final String userName;
  final String restaurantName;
  final DeliveryAddresses orderAddress;
  final Map<String, String> selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeShade100,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isDelivery ? 'Delivering to' : 'Collecting from',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                restaurantName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(orderAddress.shortAddress),
              Text('Time: ${slotMapToString(selectedSlot)}')
            ],
          ),
        ),
      ),
    );
  }
}

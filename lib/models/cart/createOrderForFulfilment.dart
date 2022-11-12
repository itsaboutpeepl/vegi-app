import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

abstract class CreateOrderForFulfilment {
  // CreateOrderForFulfilment({
  //   required this.items,
  //   required this.total,
  //   required this.tipAmount,
  //   required this.marketingOptIn,
  //   required this.discountCode,
  //   required this.vendor,
  //   required this.walletAddress,
  //   required this.address,
  //   required this.fulfilmentMethod,
  //   required this.fulfilmentSlotFrom,
  //   required this.fulfilmentSlotTo,
  // });

  CreateOrderForFulfilment();

  late final List<CartItem> items;
  late final int total;
  late final int tipAmount;
  late final bool marketingOptIn;
  late final String discountCode;
  late final String vendor;
  late final String walletAddress;
  late final DeliveryAddresses address;
  late final int fulfilmentMethod;
  late final String fulfilmentSlotFrom;
  late final String fulfilmentSlotTo;

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  Map<String, dynamic> toJson() {
    return {}
      ..addAll({
        'items': items
            .map(
              (e) => {
                'id': int.parse(e.menuItem.menuItemID),
                'quantity': e.itemQuantity,
                'options': e.selectedProductOptions.map(
                  (key, value) =>
                      MapEntry<String, int>(key.toString(), value.optionID),
                ),
              },
            )
            .toList(),
        'total': total,
        'tipAmount': tipAmount,
        'marketingOptIn': marketingOptIn,
        'discountCode': discountCode,
        'vendor': vendor,
        'walletAddress': walletAddress,
      })
      ..addAll(
        {
          'address': {
            'name': address.name,
            'email': address.email,
            'phoneNumber': address.phoneNumber,
            'lineOne': address.addressLine1,
            'lineTwo': address.addressLine2,
            'postCode': address.postalCode,
            'city': address.townCity,
            'deliveryInstructions': address.instructions,
          },
          'fulfilmentMethod': fulfilmentMethod,
          'fulfilmentSlotFrom': fulfilmentSlotFrom,
          'fulfilmentSlotTo': fulfilmentSlotTo
        },
      );
  }
}

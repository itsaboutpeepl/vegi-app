// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BiometricAuth {
  faceID,
  touchID,
  pincode,
  none,
}

enum OnboardStrategy {
  firebase,
  sms,
  none,
}

enum FulfilmentMethodType {
  collection,
  delivery,
  none,
}

enum OrderAcceptanceStatus {
  pending,
  accepted,
  declined,
}

enum RestaurantAcceptedStatus { accepted, rejected, pending }

extension OrderAcceptanceStatusHelpers on OrderAcceptanceStatus {
  static OrderAcceptanceStatus enumValueFromString(String other) {
    return other == 'pending'
        ? OrderAcceptanceStatus.pending
        : other == 'accepted'
            ? OrderAcceptanceStatus.accepted
            : OrderAcceptanceStatus.declined;
  }

  String get displayTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return 'is awaiting confirmation';

      case OrderAcceptanceStatus.accepted:
        return 'is being prepared';

      case OrderAcceptanceStatus.declined:
        return 'has been declined, sorry!';
    }
  }

  String get imageTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return 'order-pending.gif';

      case OrderAcceptanceStatus.accepted:
        return 'order-accepted.gif';

      case OrderAcceptanceStatus.declined:
        return 'order-declined.gif';
    }
  }

  String descriptionText(String orderID) {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return 'Your order #$orderID has been sent and is awaiting confirmation. We will notify you when the order status changes.\nIf you need help please contact support via the FAQ page.';

      case OrderAcceptanceStatus.accepted:
        return 'Your order #$orderID has been confirmed and is being prepared!\nIf you need help please contact support via the FAQ page.';

      case OrderAcceptanceStatus.declined:
        return 'Unfortunately your order #$orderID has been declined by the merchant.  Please try again or for help contact support via the FAQ page.';
    }
  }
}

enum DeliveryAddressLabel { home, work, hotel }

extension DeliveryAddressLabelHelpers on DeliveryAddressLabel {
  IconData get icon {
    switch (this) {
      case DeliveryAddressLabel.home:
        return FontAwesomeIcons.house;
      case DeliveryAddressLabel.work:
        return FontAwesomeIcons.building;
      case DeliveryAddressLabel.hotel:
        return FontAwesomeIcons.hotel;
    }
  }

  static DeliveryAddressLabel fromString(String value) {
    switch (value.toLowerCase()) {
      case 'home':
        return DeliveryAddressLabel.home;
      case 'work':
        return DeliveryAddressLabel.work;
      case 'hotel':
        return DeliveryAddressLabel.hotel;
      default:
        return DeliveryAddressLabel.home;
    }
  }
}

enum OrderPaidStatus { paid, unpaid, failed }

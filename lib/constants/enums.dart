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
  accepted,
  declined,
  partiallyFulfilled,
  pending,
  outForDelivery,
  delivered,
}

enum RestaurantAcceptedStatus { accepted, rejected, pending }

enum DeliveryOrderCreationStatus {
  confirmed,
  failed,
}

extension OrderCreationStatusHelpers on DeliveryOrderCreationStatus {
  static DeliveryOrderCreationStatus enumValueFromString(String other) {
    switch (other) {
      case 'confirmed':
        return DeliveryOrderCreationStatus.confirmed;

      case 'failed':
        return DeliveryOrderCreationStatus.failed;

      default:
        return DeliveryOrderCreationStatus.failed;
    }
  }

  String get imageTitle {
    switch (this) {
      case DeliveryOrderCreationStatus.confirmed:
        return 'images/order-confirmed.png';

      case DeliveryOrderCreationStatus.failed:
        return 'images/order-accepted.gif';
    }
  }
}

enum CollectionOrderCreationStatus {
  confirmed,
  failed,
}

extension CollectionOrderCreationStatusHelpers
    on CollectionOrderCreationStatus {
  static CollectionOrderCreationStatus enumValueFromString(String other) {
    switch (other) {
      case 'confirmed':
        return CollectionOrderCreationStatus.confirmed;

      case 'failed':
        return CollectionOrderCreationStatus.failed;

      default:
        return CollectionOrderCreationStatus.failed;
    }
  }

  String get imageTitle {
    switch (this) {
      case CollectionOrderCreationStatus.confirmed:
        return 'images/order-confirmed.png';

      case CollectionOrderCreationStatus.failed:
        return 'images/order-accepted.gif';
    }
  }
}

extension OrderAcceptanceStatusHelpers on OrderAcceptanceStatus {
  static OrderAcceptanceStatus enumValueFromString(String other) {
    switch (other) {
      case 'accepted':
        return OrderAcceptanceStatus.accepted;

      case 'outForDelivery':
        return OrderAcceptanceStatus.outForDelivery;

      case 'partially fulfilled':
        return OrderAcceptanceStatus.partiallyFulfilled;

      case 'delivered':
        return OrderAcceptanceStatus.delivered;

      case 'declined':
        return OrderAcceptanceStatus.declined;

      default:
        return OrderAcceptanceStatus.declined;
    }
  }

  String get displayTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return 'is awaiting confirmation';

      case OrderAcceptanceStatus.accepted:
        return 'is being prepared';

      case OrderAcceptanceStatus.declined:
        return 'has been declined, sorry!';

      case OrderAcceptanceStatus.outForDelivery:
        return 'is out for delivery!';

      case OrderAcceptanceStatus.partiallyFulfilled:
        return 'has been partially fulfilled, please review!';

      case OrderAcceptanceStatus.delivered:
        return 'has been delivered!';
    }
  }

  String get imageTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return 'videos/order-pending.gif';

      case OrderAcceptanceStatus.accepted:
        return 'videos/order-accepted.gif';

      case OrderAcceptanceStatus.declined:
        return 'videos/order-declined.gif';

      case OrderAcceptanceStatus.outForDelivery:
        return 'videos/order-out-for-delivery.gif';

      case OrderAcceptanceStatus.partiallyFulfilled:
        return 'videos/order-pending.gif';

      case OrderAcceptanceStatus.delivered:
        return 'videos/order-delivered.gif';
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

      case OrderAcceptanceStatus.outForDelivery:
        return 'Your order #$orderID is out for delivery!';

      case OrderAcceptanceStatus.partiallyFulfilled:
        return 'Your order #$orderID has been partially fulfilled! Please review in the orders section or for help contact support via the FAQ page.!';

      case OrderAcceptanceStatus.delivered:
        return 'Your order #$orderID has been delivered!';
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

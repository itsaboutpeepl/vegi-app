enum SendType {
  CONTACT,
  BUSINESS,
  QR_ADDRESS,
  FUSE_ADDRESS,
  PASTED_ADDRESS,
  ETHEREUM_ADDRESS,
}

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

enum FulfilmentMethod {
  collection,
  delivery,
  none,
}

enum OrderAcceptanceStatus {
  pending,
  accepted,
  declined,
}

extension OrderAcceptanceStatusHelpers on OrderAcceptanceStatus {
  static OrderAcceptanceStatus enumValueFromString(String other) {
    return other == "pending"
        ? OrderAcceptanceStatus.pending
        : other == "accepted"
            ? OrderAcceptanceStatus.accepted
            : OrderAcceptanceStatus.declined;
  }

  String get displayTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return "is awaiting confirmation";

      case OrderAcceptanceStatus.accepted:
        return "is being prepared";

      case OrderAcceptanceStatus.declined:
        return "has been declined, sorry!";
    }
  }

  String get imageTitle {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return "order-pending.gif";

      case OrderAcceptanceStatus.accepted:
        return "order-accepted.gif";

      case OrderAcceptanceStatus.declined:
        return "order-declined.gif";
    }
  }

  String descriptionText(String orderID) {
    switch (this) {
      case OrderAcceptanceStatus.pending:
        return "Your order #$orderID has been sent and is awaiting confirmation. We will notify you when the order status changes.\nIf you need help please contact support via the FAQ page.";

      case OrderAcceptanceStatus.accepted:
        return "Your order #$orderID has been confirmed and is being prepared!\nIf you need help please contact support via the FAQ page.";

      case OrderAcceptanceStatus.declined:
        return "Unfortunately your order #$orderID has been declined by the merchant.  Please try again or for help contact support via the FAQ page.";
    }
  }
}

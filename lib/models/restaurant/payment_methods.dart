enum PaymentMethod { stripe, peeplPay, applePay }

extension PaymentMethodHelpers on PaymentMethod {
  String get formattedName {
    switch (this) {
      case PaymentMethod.stripe:
        return 'Card';
      case PaymentMethod.peeplPay:
        return 'Peepl Pay';
      case PaymentMethod.applePay:
        return 'Apple Pay';
    }
  }
}

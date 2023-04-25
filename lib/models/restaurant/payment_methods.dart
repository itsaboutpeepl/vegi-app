enum PaymentMethod { stripe, stripeToFuse, peeplPay, applePay, qrPay }

extension PaymentMethodHelpers on PaymentMethod {
  String get formattedName {
    switch (this) {
      case PaymentMethod.stripe:
        return 'Card';
      case PaymentMethod.stripeToFuse:
        return 'Card';
      case PaymentMethod.peeplPay:
        return 'Peepl Pay';
      case PaymentMethod.applePay:
        return 'Apple Pay';
      case PaymentMethod.qrPay:
        return 'vegi Pay';
    }
  }
}

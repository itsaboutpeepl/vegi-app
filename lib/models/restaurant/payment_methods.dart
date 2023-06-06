enum PaymentMethod {
  stripe,
  stripeToFuse,
  peeplPay,
  applePay,
  applePayToFuse,
  googlePay,
  googlePayToFuse,
  qrPay
}

extension PaymentMethodHelpers on PaymentMethod {
  String get formattedName {
    switch (this) {
      case PaymentMethod.stripe:
        return 'Card';
      case PaymentMethod.stripeToFuse:
        return 'Card [Fuse]';
      case PaymentMethod.peeplPay:
        return 'Peepl Pay';
      case PaymentMethod.qrPay:
        return 'vegi Pay';
      case PaymentMethod.applePay:
        return 'Apple Pay';
      case PaymentMethod.googlePay:
        return 'Google Pay';
      case PaymentMethod.applePayToFuse:
        return 'Apple Pay [Fuse]';
      case PaymentMethod.googlePayToFuse:
        return 'Google Pay [Fuse]';
    }
  }
}

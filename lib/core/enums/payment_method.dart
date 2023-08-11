enum PaymentMethod {
  directDebit,
  compror,
  undefined;

  @override
  String toString() {
    switch (this) {
      case PaymentMethod.directDebit:
        return 'Débito em conta';
      case PaymentMethod.compror:
        return 'Compror';
      case PaymentMethod.undefined:
        return 'Indefinido';
    }
  }
}

PaymentMethod paymentMethodFromString(String? type) {
  switch (type?.toUpperCase()) {
    case 'DÉBITO EM CONTA':
      return PaymentMethod.directDebit;
    case 'COMPROR':
      return PaymentMethod.compror;
    case 'INDEFINIDO':
      return PaymentMethod.undefined;
    default:
      return PaymentMethod.directDebit;
  }
}

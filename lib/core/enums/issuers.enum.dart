enum Issuer {
  discover,
  maestro,
  visa,
  mastercard,
  boleto,
  americanExpress,
  alelo,
  dinersClub,
  elo,
  hipercard,
  bancoDoBrasil,
  jcb,
  aura,
  redecard;

  String get file {
    switch (this) {
      case Issuer.discover:
        return 'assets/images/credit_cards/DISCOVER.svg';
      case Issuer.maestro:
        return 'assets/images/credit_cards/MAESTRO.svg';
      case Issuer.visa:
        return 'assets/images/credit_cards/VISA.svg';
      case Issuer.mastercard:
        return 'assets/images/credit_cards/MASTERCARD.svg';
      case Issuer.boleto:
        return 'assets/images/credit_cards/BOLETO.svg';
      case Issuer.americanExpress:
        return 'assets/images/credit_cards/AMEX.svg';
      case Issuer.alelo:
        return 'assets/images/credit_cards/ALELO.svg';
      case Issuer.dinersClub:
        return 'assets/images/credit_cards/DINNERS.svg';
      case Issuer.elo:
        return 'assets/images/credit_cards/ELO.svg';
      case Issuer.hipercard:
        return 'assets/images/credit_cards/HIPERCARD.svg';
      case Issuer.bancoDoBrasil:
        return 'assets/images/credit_cards/BB.svg';
      case Issuer.jcb:
        return 'assets/images/credit_cards/JCB.svg';
      case Issuer.aura:
        return 'assets/images/credit_cards/AURA.svg';
      case Issuer.redecard:
        return 'assets/images/credit_cards/REDECARD.svg';
    }
  }
}

Issuer? issuerFromString(String flag) {
  switch (flag.toLowerCase()) {
    case 'discover':
      return Issuer.discover;
    case 'maestro':
      return Issuer.maestro;
    case 'visa':
      return Issuer.visa;
    case 'mastercard':
      return Issuer.mastercard;
    case 'boleto':
      return Issuer.boleto;
    case 'americanexpress':
      return Issuer.americanExpress;
    case 'alelo':
      return Issuer.alelo;
    case 'dinersclub':
      return Issuer.dinersClub;
    case 'elo':
      return Issuer.elo;
    case 'hipercard':
      return Issuer.hipercard;
    case 'bancodobrasil':
      return Issuer.bancoDoBrasil;
    case 'jcb':
      return Issuer.jcb;
    case 'aura':
      return Issuer.aura;
    case 'redecard':
      return Issuer.redecard;
  }
  return null;
}

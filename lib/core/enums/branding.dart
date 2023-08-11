enum Branding {
  colored,
  coloredNoText,
  black,
  blackNoText,
  white,
  whiteNoText,
  symbolBlack,
  symbol,
  symbolWhite,
  logoRightProgramaBem,
  logoLeftProgramaBem;

  String get file {
    switch (this) {
      case Branding.black:
        return 'assets/images/branding/black.svg';
      case Branding.blackNoText:
        return 'assets/images/branding/blackNoText.svg';
      case Branding.colored:
        return 'assets/images/branding/colored.svg';
      case Branding.coloredNoText:
        return 'assets/images/branding/coloredNoText.svg';
      case Branding.white:
        return 'assets/images/branding/white.svg';
      case Branding.whiteNoText:
        return 'assets/images/branding/whiteNoText.svg';
      case Branding.symbolBlack:
        return 'assets/images/symbol/black.svg';
      case Branding.symbolWhite:
        return 'assets/images/symbol/white.svg';
      case Branding.logoRightProgramaBem:
        return 'assets/images/branding/logoRightProgramaBem.svg';
      case Branding.logoLeftProgramaBem:
        return 'assets/images/branding/logoLeftProgramaBem.svg';
      case Branding.symbol:
        return 'assets/images/symbol/blue.svg';
    }
  }
}

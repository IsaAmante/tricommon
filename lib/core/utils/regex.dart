class TribancoRegex {
  TribancoRegex();

  static final RegExp _numbers = RegExp(r'[0-9]');
  static final RegExp _lowerCaseChar = RegExp(r'[a-z]');
  static final RegExp _upperCaseChar = RegExp(r'[A-Z]');
  static final RegExp _specialChar = RegExp(r'[!@#$%^&*()~]');

  static bool hasNumber(String value) => _numbers.hasMatch(value);
  static bool hasLowerCaseChar(String value) => _lowerCaseChar.hasMatch(value);
  static bool hasUpperCaseChar(String value) => _upperCaseChar.hasMatch(value);
  static bool hasSpecialChar(String value) => _specialChar.hasMatch(value);

  static bool hasSequenceNumber(String value) {
    for (var i = 0; i < value.length - 2; i++) {
      int codeUnit = value.codeUnitAt(i);
      int codeUnit1 = value.codeUnitAt(i + 1);
      int codeUnit2 = value.codeUnitAt(i + 2);

      //Mesmos caracteres
      if (codeUnit == codeUnit1 && codeUnit == codeUnit2) {
        return false;
      }
      //Sequencial inverso
      if (codeUnit == (codeUnit1 + 1) && codeUnit1 == (codeUnit2 + 1)) {
        return false;
      }
      //Sequencial
      if (codeUnit == (codeUnit1 - 1) && codeUnit1 == (codeUnit2 - 1)) {
        return false;
      }
    }
    return true;
  }
}

class BarcodeValidation {
  static bool isAValidBarcode(String barcode) {
    final cleanBarcode = barcode.replaceAll('.', '').replaceAll(' ', '').replaceAll('-', '');
    return cleanBarcode.length == 44 && RegExp(r'^[0-9]+$').hasMatch(cleanBarcode);
  }

  static bool isAValidLine(String line) {
    final cleanLine = line.replaceAll('.', '').replaceAll(' ', '').replaceAll('-', '');
    final int expectedLength = isConsumption(cleanLine) ? 48 : 47;
    return cleanLine.length == expectedLength && RegExp(r'^[0-9]+$').hasMatch(cleanLine);
  }

  // 8: indicates tax revenues
  static bool isConsumption(String code) => code.startsWith('8');

  static String getCleanLine(String line) {
    return line.replaceAll('.', '').replaceAll(' ', '').replaceAll('-', '');
  }

  static String? barcodeToLine(String barcode) {
    String? line;
    final cleanBarcode = getCleanLine(barcode);
    if (isAValidBarcode(cleanBarcode)) {
      if (isConsumption(cleanBarcode)) {
        line = _consumptionBarcodeToLine(cleanBarcode);
      } else {
        line = _defaultBarcodeToLine(cleanBarcode);
      }
    }
    return line;
  }

  static String _consumptionBarcodeToLine(String barcode) {
    String parsedLine = '';
    int barcodeIndex = 0;
    while (barcodeIndex < barcode.length) {
      int multiplier = 2;
      String stringToMultiply = barcode.substring(barcodeIndex, barcodeIndex + 11);
      barcodeIndex = barcodeIndex + 11;

      int sum = 0;

      for (int i = 0; i < stringToMultiply.length; i++) {
        int algarithym = int.parse(stringToMultiply[i]);
        final asString = (algarithym * multiplier).toString();
        sum += asString.split('').map((a) => int.parse(a)).reduce((value, element) => value = value + element);
        multiplier = multiplier == 2 ? 1 : 2;
      }

      int rest = sum % 10;
      int nextTen = (rest != 0) ? (sum - rest + 10) : sum;
      int dv = nextTen - sum;

      parsedLine += '$stringToMultiply$dv';
    }
    return parsedLine;
  }

  static String _defaultBarcodeToLine(String cleanBarcode) {
    String? line;
    final bank = cleanBarcode.substring(0, 3);
    final currency = cleanBarcode.substring(3, 4);
    final freeField = cleanBarcode.substring(19, 24);

    final firstField = '$bank$currency$freeField';
    final secondField = cleanBarcode.substring(24, 34);
    final thirdField = cleanBarcode.substring(34, 44);
    final fifthField = cleanBarcode.substring(5, 19);

    final codeDV = cleanBarcode.substring(4, 5);

    line = '$firstField$secondField$thirdField$fifthField';

    int multiplier = 2;
    int firstSum = 0;
    for (int i = 0; i < 9; i++) {
      int algarithym = int.parse(line[i]);
      final asString = (algarithym * multiplier).toString();
      firstSum += asString.split('').map((a) => int.parse(a)).reduce((value, element) => value = value + element);
      multiplier = multiplier == 2 ? 1 : 2;
    }
    int firstRest = firstSum % 10;
    int firstNextTen = (firstRest != 0) ? (firstSum - firstRest + 10) : firstSum;
    int firstDV = firstNextTen - firstSum;

    int secondSum = 0;
    for (int i = 9; i < 19; i++) {
      int algarithym = int.parse(line[i]);
      final asString = (algarithym * multiplier).toString();
      secondSum += asString.split('').map((a) => int.parse(a)).reduce((value, element) => value = value + element);
      multiplier = multiplier == 2 ? 1 : 2;
    }
    int secondRest = secondSum % 10;
    int secondNextTen = (secondRest != 0) ? (secondSum - secondRest + 10) : secondSum;
    int secondDV = secondNextTen - secondSum;

    int thirdSum = 0;
    for (int i = 19; i < 29; i++) {
      int algarithym = int.parse(line[i]);
      final asString = (algarithym * multiplier).toString();
      thirdSum += asString.split('').map((a) => int.parse(a)).reduce((value, element) => value = value + element);
      multiplier = multiplier == 2 ? 1 : 2;
    }
    int thirdRest = thirdSum % 10;
    int thirdNextTen = (thirdRest != 0) ? (thirdSum - thirdRest + 10) : thirdSum;
    int thirdDV = thirdNextTen - thirdSum;

    return '$firstField$firstDV$secondField$secondDV$thirdField$thirdDV$codeDV$fifthField';
  }
}

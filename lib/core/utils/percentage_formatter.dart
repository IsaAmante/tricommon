class PercentageFormatter {
  PercentageFormatter._();

  static String format(
    double value, {
    String symbol = '%',
    int digits = 2,
  }) {
    String formatted = value.toStringAsFixed(digits).replaceAll('.', ',');
    int size = formatted.length - 3;
    while (size > 3) {
      size -= 3;
      formatted = '${formatted.substring(0, size)}.${formatted.substring(size)}';
    }
    return '$formatted$symbol';
  }

  static double? toDouble(String value, {String symbol = '%'}) {
    String formatted = value.replaceAll(symbol, '').replaceAll('.', '');
    formatted = formatted.replaceAll(',', '');
    while (formatted.length < 2) {
      formatted = '0$formatted';
    }
    final index = formatted.length - 2;
    formatted = '${formatted.substring(0, index)}.${formatted.substring(index)}';
    return double.tryParse(formatted);
  }
}

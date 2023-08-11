enum ToDoubleMethod { replace, multiplication }

class MoneyFormatter {
  MoneyFormatter._();

  static String format(double value, {bool showSymbol = true, String symbol = 'R\$ ', int digits = 2, String prefix = ''}) {
    String formatted = value.toStringAsFixed(digits).replaceAll('.', ',');
    int size = formatted.length - 3;
    while (size > 3) {
      size -= 3;
      formatted = '${formatted.substring(0, size)}.${formatted.substring(size)}';
    }
    if (showSymbol) {
      formatted = '$symbol$formatted';
    }
    return '$prefix$formatted';
  }

  static double toDouble(String value, {String symbol = 'R\$ ', ToDoubleMethod method = ToDoubleMethod.replace}) {
    String formatted = value.replaceAll(symbol, '').replaceAll('.', '');
    if (method == ToDoubleMethod.replace) {
      formatted = formatted.replaceAll(',', '.');
    } else {
      formatted = formatted.replaceAll(',', '');
      while (formatted.length < 2) {
        formatted = '0$formatted';
      }
      final index = formatted.length - 2;
      formatted = '${formatted.substring(0, index)}.${formatted.substring(index)}';
    }
    return double.tryParse(formatted) ?? 0;
  }
}

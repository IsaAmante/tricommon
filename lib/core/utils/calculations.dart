class Calculations {
  String calculatePercentage({required double xValue, required double yValue}) {
    final percentage = (xValue / yValue) * 100;
    final percentageString = '${percentage.toStringAsFixed(2)}%'.replaceAll('.', '.');
    return percentageString;
  }

  String calculatePercentageAboutValue({required double xValue, required double yValue}) {
    final percentage = (xValue * yValue) / 100;
    final percentageString = '${percentage.toStringAsFixed(2)}%'.replaceAll('.', '.');
    return percentageString;
  }
}

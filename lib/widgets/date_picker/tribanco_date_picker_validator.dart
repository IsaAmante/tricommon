class TribancoDatePickerValidator {
  bool validateDate(String? value, {bool Function(DateTime date)? extraValidation}) {
    if (value == null || value.isEmpty) {
      return true;
    }
    final components = value.split("/");
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);
      if (day != null && month != null && year != null && year > 999) {
        final date = DateTime(year, month, day);
        if (date.year == year && date.month == month && date.day == day) {
          return extraValidation != null ? extraValidation(date) : true;
        }
      }
    }
    return false;
  }

  DateTime getDate(String? value) {
    if (value == null || value.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    final components = value.split("/");
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);
      if (day != null && month != null && year != null) {
        final date = DateTime(year, month, day);
        if (date.year == year && date.month == month && date.day == day) {
          return DateTime(year, month, day);
        }
      }
    }
    return DateTime.fromMillisecondsSinceEpoch(0);
  }
}

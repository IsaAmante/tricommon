import 'package:tricommon/common.dart';

extension DateTimeExtension on DateTime {
  bool isBeforeToday() {
    final now = DateTime.now();
    return isBefore(
      DateTime(
        now.year,
        now.month,
        now.day,
      ),
    );
  }

  bool isToday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  String toDDMMYYYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toDDMM() {
    return DateFormat('dd/MM').format(this);
  }

  String toHHmmss() {
    return DateFormat('HH:mm:ss').format(this);
  }

  String toHHmm() {
    return DateFormat('HH:mm').format(this);
  }
}

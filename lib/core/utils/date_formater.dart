import 'dart:js_interop';

import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class DateFormatter {
  DateFormatter._();

  static String getOnlyDate(DateTime dateTime) {
    final String ret = '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}';
    return ret;
  }

  static String getOnlyTime(DateTime dateTime) {
    final String ret = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
    return ret;
  }

  static String getDateTimeFullNoSecs(DateTime dateTime) {
    final String ret =
        '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    return ret;
  }

  static String getDateTimeFull(DateTime dateTime) {
    final String ret =
        '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
    return ret;
  }

  static String getHourNoSecs(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String getDayMonth(DateTime dateTime) {
    final String ret = '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}';
    return ret;
  }

  static String getDay(DateTime dateTime) {
    final String ret = dateTime.day.toString().padLeft(2, '0');
    return ret;
  }

  static String getMonthStringYear(DateTime dateTime, {bool fullYear = true}) {
    final String ret = '${getMonthString(dateTime)}/${fullYear ? dateTime.year.toString() : dateTime.year.toString().substring(2)}';
    return ret;
  }

  static String getMonthString(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'jan';
      case 2:
        return 'fev';
      case 3:
        return 'mar';
      case 4:
        return 'abr';
      case 5:
        return 'mai';
      case 6:
        return 'jun';
      case 7:
        return 'jul';
      case 8:
        return 'ago';
      case 9:
        return 'set';
      case 10:
        return 'out';
      case 11:
        return 'nov';
      case 12:
        return 'dez';
      default:
        return '';
    }
  }

  static String getFullMonthString(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'Janeiro';
      case 2:
        return 'Fevereiro';
      case 3:
        return 'Março';
      case 4:
        return 'Abril';
      case 5:
        return 'Maio';
      case 6:
        return 'Junho';
      case 7:
        return 'Julho';
      case 8:
        return 'Agosto';
      case 9:
        return 'Setembro';
      case 10:
        return 'Outubro';
      case 11:
        return 'Novembro';
      case 12:
        return 'Dezembro';
      default:
        return '';
    }
  }

  static String getFullMonthYear(DateTime date) {
    return '${getFullMonthString(date)} ${date.year}';
  }

  static String toStringAPI(DateTime dateTime) {
    final String ret = '${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    return ret;
  }

  static DateTime parseDateFromyyyyMMdd(String date) {
    if (date.length < 10) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    final int? year = int.tryParse(date.substring(0, 4));
    final int? month = int.tryParse(date.substring(5, 7));
    final int? day = int.tryParse(date.substring(8, 10));
    if (year == null || month == null || day == null) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    return DateTime(year, month, day);
  }

  static DateTime parseDateFromddMMyyyy(String date) {
    if (date.length < 10) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    final int? day = int.tryParse(date.substring(0, 2));
    final int? month = int.tryParse(date.substring(3, 5));
    final int? year = int.tryParse(date.substring(6));
    if (year == null || month == null || day == null) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    return DateTime(year, month, day);
  }

  static String getTransmitDate() {
    final date = DateTime.now();
    final formatted =
        '${date.year.toString()}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}-${date.hour.toString().padLeft(2, '0')}${date.minute.toString().padLeft(2, '0')}T';
    return formatted;
  }

  static Future<DateTime> openDatePicker(BuildContext context, {DateTime? initialDate}) async {
    DateTime dateTimeNow = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2101);
    DateTime initDate = initialDate ?? dateTimeNow;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: dateTimeNow,
      initialDate: initDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'Selecione uma data',
      cancelText: 'Cancelar',
      confirmText: 'OK',
      errorFormatText: 'Formato inválido',
      fieldLabelText: 'Data',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorPalette.colorPrimary500,
              onPrimary: ColorPalette.colorNeutralWhite,
              onSurface: ColorPalette.colorNeutral700,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorPalette.colorPrimary500,
                backgroundColor: ColorPalette.colorNeutralWhite,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate.isNull) {
      return initDate;
    } else {
      return pickedDate!;
    }
  }

  static Future<DateTimeRange?> openDateRangePicker(
    BuildContext context, {
    DateTime? minDate,
    int maxIntervalDays = 90,
    bool useMaxInterval = true,
  }) async {
    DateTime startDate = minDate ?? DateTime.now().subtract(const Duration(days: 7));
    DateTime endDate = DateTime.now();
    DateTimeRange selectedDate = DateTimeRange(start: startDate, end: endDate);

    bool isSelectDatesValid = false;
    DateTime firstDate = DateTime(2015, 8);
    DateTime lastDate = DateTime(2101);
    DateTimeRange? pickedDateRange;

    while (isSelectDatesValid == false) {
      pickedDateRange = await showDateRangePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.inputOnly,
        initialDateRange: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        helpText: 'Selecione uma data',
        cancelText: 'Cancelar',
        confirmText: 'Confirmar',
        errorFormatText: 'Formato inválido',
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorPalette.colorPrimary500,
                onPrimary: ColorPalette.colorNeutralWhite,
                onSurface: ColorPalette.colorNeutral700,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedDateRange != null && pickedDateRange != selectedDate) {
        isSelectDatesValid = true;

        debugPrint(pickedDateRange.start.toString());
        debugPrint(pickedDateRange.end.toString());
        debugPrint(pickedDateRange.duration.inDays.toString());

        // Check if the difference of days is greater than maxIntervalDays
        if (useMaxInterval && pickedDateRange.duration.inDays > maxIntervalDays) {
          isSelectDatesValid = false;
        }
      } else {
        // Cancel selection
        isSelectDatesValid = true;
      }
    }

    if (pickedDateRange != null) {
      return pickedDateRange;
    } else {
      return null;
    }
  }
}

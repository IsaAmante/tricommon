import 'package:tricommon/core/consts/color_palette.dart';
import 'package:flutter/material.dart';

class TribancoCalendar {
  /// firstDate: DateTime.now() - To not allow to choose before today
  static Future<DateTime?> showCalendar({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? currentDate,
    DateTime? firstDate,
    DateTime? lastDate,
    void Function(DateTime date)? onChanged,
  }) async {
    DateTime first = firstDate ?? DateTime(2000);
    DateTime last = lastDate ?? DateTime(2101);
    DateTime initial = initialDate ?? DateTime.now();

    initial = initial.isBefore(first)
        ? first
        : initial.isAfter(last)
            ? last
            : initial;

    return await showDatePicker(
      context: context,
      currentDate: currentDate ?? DateTime.now(),
      initialDate: initial,
      firstDate: first,
      lastDate: last,
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
  }
}

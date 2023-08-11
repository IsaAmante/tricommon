import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/enums/enums.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';
import 'package:tricommon/widgets/date_picker/tribanco_date_picker_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var _validatorService = TribancoDatePickerValidator();

class TribancoDateRangePicker extends StatefulWidget {
  const TribancoDateRangePicker({
    required this.firstDate,
    required this.lastDate,
    required this.startDateLabel,
    required this.endDateLabel,
    required this.onChanged,
    this.onCancel,
    this.size = ScreenSize.small,
    this.readOnly = false,
    this.maxDate,
    this.minDate,
    this.maxIntervalDays = 90,
    this.automaticOpenDatePickerRange = false,
    this.onMaxIntervalDaysExceeded,
    super.key,
  });

  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTimeRange?)? onChanged;
  final Function()? onCancel;
  final ScreenSize size;
  final bool readOnly;
  final String startDateLabel;
  final String endDateLabel;
  final DateTime? maxDate;
  final DateTime? minDate;
  final bool automaticOpenDatePickerRange;
  final int maxIntervalDays;
  final Function(DateTimeRange?)? onMaxIntervalDaysExceeded;

  @override
  State<TribancoDateRangePicker> createState() => _TribancoDateRangePickerState();
}

class _TribancoDateRangePickerState extends State<TribancoDateRangePicker> {
  TextEditingController firstDateinput = TextEditingController();
  TextEditingController lastDateinput = TextEditingController();

  FocusNode firstDateFocus = FocusNode();
  FocusNode secondDateFocus = FocusNode();

  bool isFirstDateValid = false;

  late DateTime startDate;
  late DateTime endDate;
  late DateTimeRange selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.firstDate != null) {
      firstDateinput.text = DateFormat('dd/MM/yyyy').format(widget.firstDate!);
    }

    if (widget.lastDate != null) {
      lastDateinput.text = DateFormat('dd/MM/yyyy').format(widget.lastDate!);
    }

    startDate = widget.minDate ?? DateTime.now().subtract(const Duration(days: 7));
    endDate = DateTime.now();
    selectedDate = DateTimeRange(start: startDate, end: endDate);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.automaticOpenDatePickerRange) {
        automaticOpenDateRangePicker();
      }
    });
  }

  @override
  dispose() {
    firstDateinput.dispose();
    lastDateinput.dispose();
    firstDateFocus.dispose();
    secondDateFocus.dispose();
    super.dispose();
  }

  Future<void> openDateRangePicker(BuildContext context) async {
    bool isSelectDatesValid = false;
    DateTime firstDate = DateTime(2015, 8);
    DateTime lastDate = widget.maxDate ?? DateTime(2101);
    DateTimeRange? pickedDateRange;

    while (isSelectDatesValid == false) {
      pickedDateRange = await showDateRangePicker(
        context: context,
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
        if (pickedDateRange.duration.inDays > widget.maxIntervalDays) {
          isSelectDatesValid = false;

          widget.onMaxIntervalDaysExceeded?.call(pickedDateRange);
        }
      } else {
        // Cancel selection
        isSelectDatesValid = true;
      }
    }

    if (pickedDateRange != null) {
      debugPrint(pickedDateRange.start.toString());
      debugPrint(pickedDateRange.end.toString());

      String formattedStartDate = DateFormat('dd/MM/yyyy').format(pickedDateRange.start);
      String formattedEndDate = DateFormat('dd/MM/yyyy').format(pickedDateRange.end);

      setState(() {
        firstDateinput.text = formattedStartDate;
        lastDateinput.text = formattedEndDate;
      });

      widget.onChanged?.call(pickedDateRange);
    } else {
      widget.onCancel?.call();
    }
  }

  void automaticOpenDateRangePicker() async {
    await openDateRangePicker(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.automaticOpenDatePickerRange
        ? Container()
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Date
              Expanded(
                child: TextFormField(
                  focusNode: firstDateFocus,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: ColorPalette.colorNeutral900,
                    fontSize: 16.hsp,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
                  autocorrect: false,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (!_validatorService.validateDate(value)) {
                      isFirstDateValid = false;
                      return 'Data inválida';
                    }

                    // Parse date in year, month and day
                    if (value != null && value.length == 10) {
                      var year = int.parse(value.substring(6, 10)).toString().padLeft(4, '0');
                      var month = int.parse(value.substring(3, 5)).toString().padLeft(2, '0');
                      var day = int.parse(value.substring(0, 2)).toString().padLeft(2, '0');

                      // Check if value is after firstDate
                      if (widget.minDate != null) {
                        if (widget.minDate!.isAfter(DateTime.tryParse('$year-$month-$day 23:59:59')!)) {
                          return 'A data deve ser igual ou posterior a ${DateFormat('dd/MM/yyyy').format(widget.firstDate!)}';
                        }
                      }

                      // Check if value is before lastDate
                      if (widget.maxDate != null) {
                        if (widget.maxDate!.isBefore(DateTime.tryParse('$year-$month-$day 00:00:00')!)) {
                          return 'A data deve ser igual ou anterior a ${DateFormat('dd/MM/yyyy').format(widget.lastDate!)}';
                        }
                      }

                      // Check if the difference of days is greater than maxIntervalDays
                      if (widget.maxIntervalDays != 0) {
                        if (widget.maxIntervalDays < DateTime.tryParse('$year-$month-$day 00:00:00')!.difference(widget.firstDate!).inDays) {
                          return 'O intervalo de datas deve ser menor ou igual a ${widget.maxIntervalDays} dias';
                        }
                      }
                    }

                    isFirstDateValid = true;
                    return null;
                  },
                  controller: firstDateinput,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    labelText: widget.startDateLabel,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, size: 12, color: ColorPalette.colorPrimary300),
                      onPressed: () async {
                        await openDateRangePicker(context);
                      },
                    ),
                    labelStyle: TextStyle(color: ColorPalette.colorPrimary400, fontSize: 16.hsp),
                    filled: true,
                    fillColor: ColorPalette.colorSecondary050,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary300),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary300),
                    ),
                    border: const UnderlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary400),
                    ),
                  ),
                  readOnly: widget.readOnly,
                  onTap: () async {
                    if (widget.readOnly == true) {
                      await openDateRangePicker(context);
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (_validatorService.validateDate(value)) {
                      if (secondDateFocus.canRequestFocus) {
                        lastDateinput.value = lastDateinput.value.copyWith(selection: TextSelection.fromPosition(TextPosition(offset: lastDateinput.text.length)));
                        secondDateFocus.requestFocus();
                      }
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              // Second Date
              Expanded(
                child: TextFormField(
                  focusNode: secondDateFocus,
                  textInputAction: (isFirstDateValid) ? TextInputAction.done : TextInputAction.next,
                  style: TextStyle(
                    color: ColorPalette.colorNeutral900,
                    fontSize: 16.hsp,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
                  autocorrect: false,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (!_validatorService.validateDate(value)) {
                      return 'Data inválida';
                    }

                    // Parse date in year, month and day
                    if (value != null && value.length == 10) {
                      var year = int.parse(value.substring(6, 10)).toString().padLeft(4, '0');
                      var month = int.parse(value.substring(3, 5)).toString().padLeft(2, '0');
                      var day = int.parse(value.substring(0, 2)).toString().padLeft(2, '0');

                      // Check if value is after firstDate
                      if (widget.minDate != null) {
                        if (widget.minDate!.isAfter(DateTime.tryParse('$year-$month-$day 23:59:59')!)) {
                          return 'A data deve ser igual ou posterior a ${DateFormat('dd/MM/yyyy').format(widget.firstDate!)}';
                        }
                      }

                      // Check if value is before lastDate
                      if (widget.maxDate != null) {
                        if (widget.maxDate!.isBefore(DateTime.tryParse('$year-$month-$day 00:00:00')!)) {
                          return 'A data deve ser igual ou anterior a ${DateFormat('dd/MM/yyyy').format(widget.lastDate!)}';
                        }
                      }
                    }

                    return null;
                  },
                  controller: lastDateinput,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    labelText: widget.endDateLabel,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, size: 12, color: ColorPalette.colorPrimary300),
                      onPressed: () async {
                        await openDateRangePicker(context);
                      },
                    ),
                    labelStyle: TextStyle(color: ColorPalette.colorPrimary400, fontSize: 16.hsp),
                    filled: true,
                    fillColor: ColorPalette.colorSecondary050,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary300),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary300),
                    ),
                    border: const UnderlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.colorPrimary400),
                    ),
                  ),
                  readOnly: widget.readOnly,
                  onTap: () async {
                    if (widget.readOnly == true) {
                      await openDateRangePicker(context);
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (_validatorService.validateDate(value)) {
                      if (_validatorService.validateDate(firstDateinput.text)) {
                        FocusScope.of(context).unfocus();
                        final end = _validatorService.getDate(value);
                        final start = _validatorService.getDate(firstDateinput.text);

                        final range = DateTimeRange(start: start, end: end);
                        widget.onChanged?.call(range);
                      } else {
                        if (firstDateFocus.canRequestFocus) {
                          firstDateinput.value = firstDateinput.value.copyWith(selection: TextSelection.fromPosition(TextPosition(offset: firstDateinput.text.length)));
                          firstDateFocus.requestFocus();
                        }
                      }
                    }
                  },
                ),
              ),
            ],
          );
  }
}

import 'package:tricommon/common.dart';
import 'package:tricommon/widgets/date_picker/tribanco_date_picker_validator.dart';
import 'package:flutter/material.dart';

var _validatorService = TribancoDatePickerValidator();

class TribancoDatePicker extends StatefulWidget {
  const TribancoDatePicker({
    required this.date,
    required this.label,
    required this.onChanged,
    this.size = ScreenSize.small,
    this.readOnly = false,
    this.enabled = true,
    super.key,
    this.initialDate,
    this.currentDate,
    this.firstDate,
    this.lastDate,
    this.validation,
  });

  final DateTime? date;
  final Function(DateTime?)? onChanged;
  final ScreenSize size;
  final bool readOnly;
  final String label;
  final bool enabled;
  final DateTime? initialDate;
  final DateTime? currentDate;

  /// DateTime.now() - not to allow to choose before today.
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool Function(DateTime? date)? validation;

  @override
  State<TribancoDatePicker> createState() => _TribancoDatePickerState();
}

class _TribancoDatePickerState extends State<TribancoDatePicker> {
  TextEditingController dateinput = TextEditingController();
  final _node = FocusNode();

  @override
  void initState() {
    if (widget.date != null) {
      dateinput.text = DateFormat('dd/MM/yyyy').format(widget.date!);
    }
    _node.addListener(_updateColor);
    super.initState();
  }

  void _updateColor() {
    setState(() {});
  }

  @override
  void dispose() {
    _node.removeListener(_updateColor);
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime firstDate = widget.firstDate ?? DateTime(2000);
    DateTime lastDate = widget.lastDate ?? DateTime(2101);
    DateTime initialDate = widget.initialDate ?? DateTime.now();

    initialDate = initialDate.isBefore(firstDate)
        ? firstDate
        : initialDate.isAfter(lastDate)
            ? lastDate
            : initialDate;

    Future<void> openDatePicker() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: widget.currentDate ?? DateTime.now(),
        initialDate: initialDate,
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

      if (pickedDate != null) {
        debugPrint(pickedDate.toString());
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

        setState(() {
          dateinput.text = formattedDate; //set output date to TextField value.
          widget.onChanged?.call(pickedDate);
        });
      }
    }

    return TextFormField(
      focusNode: _node,
      style: TextStyle(
        color: widget.enabled ? ColorPalette.colorNeutral900 : ColorPalette.colorNeutral300,
        fontSize: 16.hsp,
        height: 1.5,
      ),
      enabled: widget.enabled,
      inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
      autocorrect: false,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (!_validatorService.validateDate(value, extraValidation: widget.validation)) {
          return 'Data inválida';
        }

        // Parse date in year, month and day
        if (value != null && value.length == 10) {
          var year = int.parse(value.substring(6, 10)).toString().padLeft(4, '0');
          var month = int.parse(value.substring(3, 5)).toString().padLeft(2, '0');
          var day = int.parse(value.substring(0, 2)).toString().padLeft(2, '0');

          // Check if value is after firstDate
          if (widget.firstDate != null) {
            if (widget.firstDate!.isAfter(DateTime.tryParse('$year-$month-$day 23:59:59')!)) {
              return 'A data deve ser igual ou posterior a ${DateFormat('dd/MM/yyyy').format(widget.firstDate!)}';
            }
          }

          // Check if value is before lastDate
          if (widget.lastDate != null) {
            if (widget.lastDate!.isBefore(DateTime.tryParse('$year-$month-$day 00:00:00')!)) {
              return 'A data deve ser igual ou anterior a ${DateFormat('dd/MM/yyyy').format(widget.lastDate!)}';
            }
          }
        }
        return null;
      },
      controller: dateinput, //editing controller of this TextField
      decoration: InputDecoration(
        // suffixIcon: Icon(Icons.calendar_today), //icon of text field
        label: Text(
          widget.label,
          style: TextStyle(
            color: _checkTextColor(),
            fontSize: 14.hsp,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            TribancoIcons.calendarBlank,
            size: 12,
            color: _checkTextColor(),
          ),
          onPressed: () async {
            await openDatePicker();
          },
        ),
        labelStyle: TextStyle(color: _checkTextColor(), fontSize: 16.hsp),
        filled: true,
        fillColor: !widget.enabled ? ColorPalette.colorNeutral050 : _checkFillColor(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _checkUnderlineColor()),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.colorPrimary300),
        ),
        border: const UnderlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.wsp,
          vertical: 12.hsp,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.colorPrimary400),
        ),
      ),
      readOnly: widget.readOnly,
      onTap: () async {
        if (widget.readOnly == true) await openDatePicker();
      },
      onChanged: (value) {
        if (widget.onChanged != null && _validatorService.validateDate(value, extraValidation: widget.validation)) {
          final day = value.substring(0, 2);
          final month = value.substring(3, 5);
          final year = value.substring(6);
          widget.onChanged!(DateTime.tryParse('$year-$month-$day'));
        }
      },
    );
  }

  Color _checkFillColor() {
    if (_node.hasFocus) {
      return ColorPalette.colorSecondary100;
    } else {
      return ColorPalette.colorSecondary050;
    }
  }

  Color _checkUnderlineColor() {
    if (_node.hasFocus) {
      return ColorPalette.colorPrimary400;
    } else {
      return ColorPalette.colorSecondary300;
    }
  }

  Color _checkTextColor() {
    if (!widget.enabled) {
      return ColorPalette.colorNeutral300;
    }
    if (_node.hasFocus) {
      return ColorPalette.colorPrimary400;
    } else {
      return ColorPalette.colorNeutral600;
    }
  }
}

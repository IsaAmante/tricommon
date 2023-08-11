import 'package:tricommon/common.dart';
import 'package:tricommon/widgets/date_picker/tribanco_date_picker_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _validatorService = TribancoDatePickerValidator();

class TribancoScrollDatePicker extends StatefulWidget {
  const TribancoScrollDatePicker({
    required this.date,
    required this.label,
    required this.onChanged,
    this.onEditingComplete,
    this.firstDate,
    this.lastDate,
    this.size = ScreenSize.small,
    this.readOnly = false,
    super.key,
  });

  final DateTime date;
  final Function(DateTime?)? onChanged;
  final void Function()? onEditingComplete;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ScreenSize size;
  final bool readOnly;
  final String label;

  @override
  State<TribancoScrollDatePicker> createState() => _TribancoScrollDatePickerState();
}

class _TribancoScrollDatePickerState extends State<TribancoScrollDatePicker> {
  TextEditingController dateinput = TextEditingController();
  final _mask = MaskTextInputFormatter(mask: "##/##/####");

  @override
  void initState() {
    dateinput.text = DateFormat('dd/MM/yyyy').format(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> openDatePicker() async {
      DateTime? pickedDate =
          await showDatePicker(context: context, initialDate: widget.date, firstDate: widget.firstDate ?? DateTime(1920), lastDate: widget.lastDate ?? DateTime(2100));

      if (pickedDate != null) {
        debugPrint(pickedDate.toString());
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

        setState(() {
          dateinput.text = formattedDate;
          widget.onChanged?.call(pickedDate);
        });
      }
    }

    void openScrollDatePicker(context) {
      showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
                height: 500,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: widget.date,
                          onDateTimeChanged: (pickedDate) {
                            debugPrint(pickedDate.toString());
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              dateinput.text = formattedDate; //set output date to TextField value.
                              widget.onChanged?.call(pickedDate);
                            });
                          }),
                    ),
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ));
    }

    return TextFormField(
      style: TextStyle(
        color: ColorPalette.colorNeutral900,
        fontSize: 16.hsp,
      ),
      inputFormatters: [_mask],
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
      controller: dateinput,
      onChanged: (String value) {
        if (dateinput.text.isNotEmpty && _validatorService.validateDate(dateinput.text)) {
          widget.onChanged?.call(_validatorService.getDate(dateinput.text));
        } else {
          widget.onChanged?.call(DateTime(1900, 1, 1));
        }
      },
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today, size: 12, color: ColorPalette.colorPrimary300),
          onPressed: () async {
            openScrollDatePicker(context);
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
        if (widget.readOnly == true) await openDatePicker();
      },
    );
  }
}

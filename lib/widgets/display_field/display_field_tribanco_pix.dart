import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DisplayFieldSizePix { medium, large }

enum FieldTypePix { text, datePicker }

class DisplayFieldTribancoPix extends StatefulWidget {
  const DisplayFieldTribancoPix({
    Key? key,
    required this.title,
    this.size = DisplayFieldSizePix.large,
    this.enabled = true,
    this.fieldTypePix = FieldTypePix.text,
    this.keyboardType,
    this.mask,
    this.textError,
    this.onEditingComplete,
    this.initialValue,
    this.date,
    this.secondLine = false,
    this.initialValueBold = false,
    this.secondLineText,
    this.onTap,
    this.secondLineOnTap,
    this.onChanged,
    this.keyboardHeight = 0.0,
    this.modalHeader = 'Editar informação',
  }) : super(key: key);

  final String title;
  final DisplayFieldSizePix size;
  final bool enabled;
  final bool secondLine;
  final String? secondLineText;
  final bool initialValueBold;
  final void Function()? secondLineOnTap;
  final FieldTypePix fieldTypePix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? mask;
  final String? textError;
  final Function(String)? onChanged;
  final Function(String)? onEditingComplete;
  final String? initialValue;
  final DateTime? date;
  final Function()? onTap;
  final double keyboardHeight;
  final String? modalHeader;

  @override
  State<DisplayFieldTribancoPix> createState() => _DisplayFieldTribancoPixState();
}

class _DisplayFieldTribancoPixState extends State<DisplayFieldTribancoPix> {
  final _node = FocusNode();
  bool validatorController = true;
  late dynamic fieldValue;

  @override
  void initState() {
    super.initState();
    fieldValue = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title).small(
              style: TextStyle(
                color: ColorPalette.colorNeutral500,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: Spacing.small.wsp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  widget.initialValueBold == false
                      ? Text(
                          widget.initialValue ?? '',
                          textAlign: TextAlign.end,
                        ).small(
                          style: TextStyle(
                            color: ColorPalette.colorNeutral800,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          widget.initialValue ?? '',
                          textAlign: TextAlign.end,
                        ).small(
                          style: TextStyle(
                            color: ColorPalette.colorNeutral800,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  widget.secondLine == true
                      ? InkWell(
                          onTap: widget.secondLineOnTap,
                          child: Text(widget.secondLineText ?? '').small(
                            style: TextStyle(
                              color: ColorPalette.colorSecondary700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        if (widget.enabled)
          GestureDetector(
            onTap: () => TribancoModalBottomSheet.openBottomSheet(
              context,
              _editField(
                context,
                widget.keyboardHeight,
              ),
            ),
            child: Container(
              color: Colors.transparent,
              child: Icon(
                TribancoIcons.edit,
                color: ColorPalette.colorPrimary050,
                size: 18.wsp,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
          ),
          child: ColoredBox(color: ColorPalette.colorNeutral200, child: SizedBox(width: double.infinity, height: 1.hsp)),
        ),
      ],
    );
  }

  Widget _editField(
    BuildContext context,
    double keyboardHeight,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0.hsp,
        left: 12.wsp,
        right: 12.wsp,
        bottom: keyboardHeight + 160.hsp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 16.hsp,
              left: 4.wsp,
              right: 12.wsp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.modalHeader ?? '').small(
                  style: TextStyle(
                    color: ColorPalette.colorNeutral700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: Spacing.tiny.wsp),
                    child: Icon(
                      TribancoIcons.x,
                      size: 14.wsp,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Controls the keyboard visibility and move the field upper
          Focus(
            child: widget.fieldTypePix == FieldType.text
                ? TextFieldTribanco(
                    title: widget.title,
                    initialValue: widget.initialValue,
                    size: TextfieldSize.large,
                    mask: widget.mask,
                    keyboardType: widget.keyboardType,
                    autofocus: true,
                    onChanged: (String value) {
                      debugPrint('ON CHANGED');
                      setState(() {
                        fieldValue = value;
                      });
                    },
                    onEditingComplete: () {
                      debugPrint('ON EDIT COMPLETE');
                      widget.onEditingComplete?.call(fieldValue);
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  )
                : TribancoScrollDatePicker(
                    label: widget.title,
                    date: widget.date ?? DateTime.now(),
                    size: ScreenSize.small,
                    onChanged: (selectedDate) {
                      debugPrint('ON CHANGED');
                      setState(() {
                        fieldValue = selectedDate;
                      });
                    },
                    onEditingComplete: () {
                      debugPrint('ON EDIT COMPLETE');
                      widget.onEditingComplete?.call(fieldValue);
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
          )
        ],
      ),
    );
  }
}

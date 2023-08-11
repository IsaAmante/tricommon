import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DisplayFieldSize { medium, large }

enum FieldType { text, datePicker }

class DisplayFieldTribanco extends StatefulWidget {
  const DisplayFieldTribanco({
    Key? key,
    required this.title,
    this.size = DisplayFieldSize.large,
    this.enabled = true,
    this.fieldType = FieldType.text,
    // this.prefixIcon,
    // this.suffixIcon = TribancoIcons.edit,
    // this.suffixFunction,
    // this.prefixIconLabel,
    // this.textEditingController,
    this.keyboardType,
    this.mask,
    this.textError,
    // this.onChanged,
    this.onEditingComplete,
    // this.passwordInput = false,
    // this.hidePassword = true,
    this.initialValue,
    // this.textCapitalization = TextCapitalization.none,
    this.date,
    this.onTap,
    // this.prefixIconLabel,
    // this.textEditingController,
    // this.keyboardType,
    // this.mask,
    // this.textError,
    this.onChanged,
    // this.onEditingComplete,
    // required this.passwordInput,
    // required this.hidePassword,
    // required this.textCapitalization
    this.keyboardHeight = 0.0,
    this.modalHeader = 'Editar informação',
  }) : super(key: key);

  final String title;
  final DisplayFieldSize size;
  final bool enabled;
  final FieldType fieldType;
  // final IconData? prefixIcon;
  // final IconData? suffixIcon;
  // final Function()? suffixFunction;
  // final IconData? prefixIconLabel;
  // final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? mask;
  final String? textError;
  final Function(String)? onChanged;
  final Function(String)? onEditingComplete;
  // final bool passwordInput;
  // final bool hidePassword;
  final String? initialValue;
  final DateTime? date;

  // final TextCapitalization textCapitalization;
  final Function()? onTap;
  final double keyboardHeight;
  final String? modalHeader;

  @override
  State<DisplayFieldTribanco> createState() => _DisplayFieldTribancoState();
}

class _DisplayFieldTribancoState extends State<DisplayFieldTribanco> {
  final _node = FocusNode();
  bool validatorController = true;
  late dynamic fieldValue;

  @override
  void initState() {
    fieldValue = widget.initialValue ?? '';
    super.initState();
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title).small(
                  style: TextStyle(
                    color: ColorPalette.colorNeutral500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(widget.initialValue ?? '').small(
                  style: TextStyle(
                    color: ColorPalette.colorNeutral800,
                    fontWeight: FontWeight.w500,
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
          ],
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
            child: widget.fieldType == FieldType.text
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

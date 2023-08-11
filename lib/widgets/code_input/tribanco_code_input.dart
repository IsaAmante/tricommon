import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TribancoCodeInput extends StatefulWidget {
  const TribancoCodeInput({
    required this.onChanged,
    this.vertical,
    this.horizontal,
    this.errorInput = false,
    super.key,
    this.enabled = true,
    this.fieldWidth,
  });

  final Function(String) onChanged;
  final double? vertical;
  final double? horizontal;
  final bool errorInput;
  final bool enabled;
  final double? fieldWidth;

  @override
  State<TribancoCodeInput> createState() => _TribancoCodeInputState();
}

class _TribancoCodeInputState extends State<TribancoCodeInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.vertical ?? Spacing.tiny,
        horizontal: widget.horizontal ?? Spacing.small,
      ),
      child: PinCodeTextField(
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        length: 6,
        appContext: context,
        autoFocus: true,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        backgroundColor: Colors.transparent,
        cursorColor: widget.errorInput ? ColorPalette.colorDanger500 : ColorPalette.colorPrimary500,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldHeight: 88.hsp,
          fieldWidth: widget.fieldWidth ?? 40.wsp,
          borderRadius: TribancoBorder.radius(
            size: BorderRadiusSize.medium,
            positions: [
              BorderPosition.all,
            ],
          ),
          borderWidth: 2,
          inactiveColor: widget.errorInput ? ColorPalette.colorDanger500 : ColorPalette.colorSecondary400,
          activeColor: widget.errorInput ? ColorPalette.colorDanger500 : ColorPalette.colorPrimary500,
          selectedColor: widget.errorInput ? ColorPalette.colorDanger500 : ColorPalette.colorPrimary500,
        ),
        textStyle: TextStyle(
            fontFamily: NORMAL_FONT_FAMILY,
            fontSize: 32.0.hsp,
            color: !widget.enabled
                ? ColorPalette.colorNeutral400
                : widget.errorInput
                    ? ColorPalette.colorDanger500
                    : ColorPalette.colorPrimary500,
            fontWeight: FontWeight.w700,
            height: 1.5),
      ),
    );
  }
}

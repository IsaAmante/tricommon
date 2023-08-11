import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

enum CheckboxSize { small, medium, large }

class TribancoCheckbox extends StatelessWidget {
  const TribancoCheckbox({
    required this.value,
    required this.onChanged,
    this.title,
    this.size = CheckboxSize.small,
    this.enabled = true,
    this.textStyle,
    this.richText,
    this.checkColor,
    this.borderColor,
    this.fillColor,
    super.key,
  });

  final String? title;
  final CheckboxSize size;
  final bool value;
  final Function(bool?) onChanged;
  final bool enabled;
  final TextStyle? textStyle;
  final Widget? richText;
  final Color? checkColor;
  final Color? borderColor;
  final Color? fillColor;

  // checkbox default size 18 pixels
  double get _scale {
    switch (size) {
      case CheckboxSize.small:
        return (16 / 18).hsp;
      case CheckboxSize.medium:
        return (20 / 18).hsp;
      case CheckboxSize.large:
        return (24 / 18).hsp;
      default:
        return (16 / 18).hsp;
    }
  }

  Color get _boxColor {
    if (enabled) {
      return value ? ColorPalette.colorPrimary500 : ColorPalette.colorPrimary500;
    } else {
      return ColorPalette.colorNeutral200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: SizedBox(
            width: 18 * _scale,
            height: 18 * _scale,
            child: Transform.scale(
              scale: _scale,
              child: Checkbox(
                checkColor: checkColor ?? ColorPalette.colorNeutralWhite,
                activeColor: ColorPalette.colorPrimary500,
                // splashRadius: 0.0,
                fillColor: MaterialStateProperty.all(fillColor ?? _boxColor),
                value: value,
                onChanged: enabled ? onChanged : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1.0, color: borderColor ?? _boxColor),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Flexible(child: richText ?? Text(title ?? '', style: textStyle ?? TextStyle(fontSize: 14.hsp))),
      ],
    );
  }
}

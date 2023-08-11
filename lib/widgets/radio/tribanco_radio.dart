import 'package:flutter/material.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/enums/screensize.enum.dart';

class TribancoRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final ScreenSize size;
  final bool enabled;
  final String label;
  final TextStyle? textStyle;

  const TribancoRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.size = ScreenSize.small,
    this.enabled = true,
    this.textStyle,
  });

  // checkbox default size 18 pixels
  double get _scale {
    switch (size) {
      case ScreenSize.small:
        return 16 / 18;
      case ScreenSize.medium:
        return 24 / 18;
      case ScreenSize.large:
        return 32 / 18;
      default:
        return 16 / 18;
    }
  }

  Color get _color {
    if (enabled) {
      return (value == groupValue) ? ColorPalette.colorPrimary500 : ColorPalette.colorNeutral800;
    } else {
      return ColorPalette.colorNeutral200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enabled) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 18 * _scale,
              height: 18 * _scale,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _color,
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: Center(
                child: value == groupValue
                    ? Container(
                        width: (18 * _scale) - (7 * _scale),
                        height: (18 * _scale) - (7 * _scale),
                        decoration: ShapeDecoration(shape: const CircleBorder(), color: _color),
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                label,
                style: textStyle ?? TextStyle(color: _color),
              ),
            )
          ],
        ),
      ),
    );
  }
}

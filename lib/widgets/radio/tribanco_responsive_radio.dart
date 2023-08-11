import 'package:flutter/material.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';

class TribancoResponsiveRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final bool enabled;
  final String label;

  const TribancoResponsiveRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.enabled = true,
  });

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
        padding: EdgeInsets.symmetric(vertical: 4.hsp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 18.wsp,
              height: 18.wsp,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _color,
                  width: 2.0.wsp,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: Center(
                child: value == groupValue
                    ? Container(
                        width: 11.wsp,
                        height: 11.wsp,
                        decoration: ShapeDecoration(shape: const CircleBorder(), color: _color),
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0.wsp,
              ),
              child: Text(
                label,
                style: TextStyle(color: _color),
              ),
            )
          ],
        ),
      ),
    );
  }
}

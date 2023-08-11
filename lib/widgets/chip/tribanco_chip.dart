import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoChip extends StatelessWidget {
  final String? title;
  final PaymentMethod type;
  final int? count;
  const TribancoChip({super.key, required this.type, this.count, this.title});

  IconData get _icon {
    if (type == PaymentMethod.directDebit) {
      return TribancoIcons.money;
    } else if (type == PaymentMethod.compror) {
      return TribancoIcons.divide;
    } else if (type == PaymentMethod.undefined) {
      return TribancoIcons.warningCircle;
    } else {
      return TribancoIcons.money;
    }
  }

  Color get _backgroundColor {
    if (type == PaymentMethod.directDebit) {
      return ColorPalette.colorInformational050;
    } else if (type == PaymentMethod.compror) {
      return ColorPalette.colorTertiaryA050;
    } else if (type == PaymentMethod.undefined) {
      return ColorPalette.colorWarning050;
    } else {
      return ColorPalette.colorInformational050;
    }
  }

  Color get _borderColor {
    if (type == PaymentMethod.directDebit) {
      return ColorPalette.colorInformational200;
    } else if (type == PaymentMethod.compror) {
      return ColorPalette.colorTertiaryA200;
    } else if (type == PaymentMethod.undefined) {
      return ColorPalette.colorWarning200;
    } else {
      return ColorPalette.colorInformational200;
    }
  }

  Color get _textColor {
    if (type == PaymentMethod.directDebit) {
      return ColorPalette.colorInformational500;
    } else if (type == PaymentMethod.compror) {
      return ColorPalette.colorTertiaryA800;
    } else if (type == PaymentMethod.undefined) {
      return ColorPalette.colorWarning700;
    } else {
      return ColorPalette.colorInformational500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: Spacing.tiny),
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: Border.all(color: _borderColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 14, color: _textColor),
          const SizedBox(width: Spacing.xMicro),
          Text(title ?? type.toString()).xSmall(style: TextStyle(color: _textColor, fontWeight: FontWeight.w400)),
          const SizedBox(width: Spacing.tiny),
          count != null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.tiny),
                  decoration: BoxDecoration(
                    color: _textColor,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
                  ),
                  child: Text(count.toString()).xSmall(
                    style: TextStyle(
                      color: ColorPalette.colorNeutralWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

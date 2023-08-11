import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onPressed, required this.icon, required this.text, this.color, this.textColor, this.bigIcon = false});

  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final bool bigIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color ?? ColorPalette.colorTertiaryA500,
        ),
        padding: EdgeInsets.symmetric(vertical: Spacing.tiny.hsp, horizontal: Spacing.tiny.wsp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: Spacing.xMicro.hsp, top: bigIcon ? 0 : 8.hsp),
                child: Icon(
                  icon,
                  size: bigIcon ? 64.hsp : 48.hsp,
                  color: textColor ?? ColorPalette.colorTertiaryA900,
                )),
            SizedBox(
              width: 1000,
              child: Text(
                text,
                textAlign: TextAlign.center,
                softWrap: false,
              ).small(style: TextStyle(fontWeight: FontWeight.w400, color: textColor ?? ColorPalette.colorTertiaryA900)),
            )
          ],
        ),
      ),
    );
  }
}

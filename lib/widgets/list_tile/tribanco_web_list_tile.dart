import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoWebListTile extends StatelessWidget {
  const TribancoWebListTile({
    required this.title,
    required this.subTitle,
    this.onPressed,
    required this.backgroundIconColor,
    this.iconColor,
    this.icon = TribancoIcons.grid,
    this.isEnabled = false,
    super.key,
  });

  final String title;
  final String subTitle;
  final Function()? onPressed;
  final IconData icon;
  final Color backgroundIconColor;
  final Color? iconColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Spacing.small.hsp),
      padding: EdgeInsets.only(bottom: Spacing.small.hsp),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.colorNeutral200,
            width: 1.0.wsp,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _body(),
            Icon(
              TribancoIcons.chevronRight,
              size: 20.hsp,
              color: isEnabled ? null : ColorPalette.colorNeutral300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _icon(
          icon: Icon(
            icon,
            color: iconColor ?? ColorPalette.colorNeutralWhite,
          ),
          color: isEnabled ? backgroundIconColor : ColorPalette.colorNeutral300,
        ),
        SizedBox(width: Spacing.xTiny.wsp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title).xSmall(
              style: TextStyle(fontWeight: FontWeight.w700, color: isEnabled ? ColorPalette.colorNeutral800 : ColorPalette.colorNeutral300),
            ),
            Text(subTitle).xSmall(
              style: TextStyle(fontWeight: FontWeight.w500, color: isEnabled ? ColorPalette.colorNeutral800 : ColorPalette.colorNeutral300),
            ),
          ],
        ),
      ],
    );
  }

  Widget _icon({required Icon icon, required Color color}) {
    return Container(
      width: 34.wsp,
      height: 34.hsp,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}

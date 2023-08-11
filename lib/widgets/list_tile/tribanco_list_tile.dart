import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoListTile extends StatelessWidget {
  const TribancoListTile({
    required this.title,
    required this.onPressed,
    this.icon = TribancoIcons.grid,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Spacing.medium.wsp, right: Spacing.medium.wsp, bottom: Spacing.small.hsp),
      padding: EdgeInsets.only(bottom: Spacing.small.hsp),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.colorNeutral200,
            width: 1.0,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: Spacing.xTiny.wsp),
            Text(title).xSmall(
              style: TextStyle(fontWeight: FontWeight.w400, color: ColorPalette.colorNeutral800),
            ),
          ],
        ),
      ),
    );
  }
}

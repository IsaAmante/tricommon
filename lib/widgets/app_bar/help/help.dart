import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';
import 'package:flutter/services.dart';

class HelpAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(73.hsp);

  final String title;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? color;

  const HelpAppbar({super.key, required this.title, this.leadingIcon = TribancoIcons.arrowLeft, this.leadingOnPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          leadingWidth: 56.wsp,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.wsp),
            child: IconButton(
              icon: Icon(leadingIcon),
              iconSize: 24.wsp,
              color: color ?? ColorPalette.colorPrimary500,
              onPressed: leadingOnPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            ),
          ),
          title: _getTitle(),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.wsp),
              child: IconButton(icon: const Icon(TribancoIcons.question, color: Colors.transparent), iconSize: 26.wsp, onPressed: null),
            )
          ],
        ),
      ],
    );
  }

  Widget _getTitle() {
    return Center(
      child: Text(
        title,
      ).xMedium(
        style: TextStyle(color: color ?? ColorPalette.colorPrimary500, fontWeight: FontWeight.w400, height: 1),
      ),
    );
  }
}

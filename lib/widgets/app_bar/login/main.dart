import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(64.hsp);

  final String title;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? color;
  final AppbarSize? appbarSize;
  final Function()? onPressedQuestion;
  final bool showHelp;

  const LoginAppbar(
      {super.key,
      required this.title,
      this.appbarSize,
      this.leadingIcon = TribancoIcons.arrowLeft,
      this.leadingOnPressed,
      this.onPressedQuestion,
      this.color,
      this.showHelp = true})
      : assert(!showHelp || (showHelp && onPressedQuestion != null), 'LoginAppbar: When showHelp is true, you need to also define an onPressedQuestion action.');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      leadingWidth: 56.wsp,
      leading: Container(
        margin: EdgeInsets.only(left: 20.wsp),
        child: IconButton(
          icon: Icon(leadingIcon),
          iconSize: 24.hsp,
          color: color ?? ColorPalette.colorPrimary500,
          onPressed: leadingOnPressed ??
              () {
                Navigator.of(context).pop();
              },
        ),
      ),
      title: _getTitle(),
      actions: [
        Container(
          width: 36.wsp,
          margin: EdgeInsets.only(right: 20.wsp),
          child: IconButton(
              icon: Icon(TribancoIcons.question, color: !showHelp ? Colors.transparent : color ?? ColorPalette.colorPrimary500),
              iconSize: 24.hsp,
              onPressed: showHelp ? onPressedQuestion : null),
        )
      ],
    );
  }

  Widget _getTitle() {
    if (appbarSize == null || appbarSize == AppbarSize.xMedium20) {
      return Center(
        child: Text(
          title,
        ).xMedium(
          style: TextStyle(
            color: color ?? ColorPalette.colorPrimary500,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    return Center(
      child: Text(
        title,
      ).small(
        style: TextStyle(
          color: color ?? ColorPalette.colorPrimary500,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

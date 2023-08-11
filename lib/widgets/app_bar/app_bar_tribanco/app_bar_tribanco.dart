import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarTribanco extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80.hsp);

  final String title;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;
  final Color? color;
  final AppbarSize? appbarSize;
  final Function()? onPressedQuestion;
  final bool showHelp;
  final bool showLeading;
  final List<Widget>? actions;
  final double? leadingIconSize;

  const AppBarTribanco({
    super.key,
    required this.title,
    this.appbarSize,
    this.leadingIcon = TribancoIcons.arrowLeft,
    this.leadingOnPressed,
    this.onPressedQuestion,
    this.backgroundColor,
    this.color,
    this.showHelp = true,
    this.showLeading = true,
    this.actions,
    this.leadingIconSize,
  }) : assert(!showHelp || (showHelp && onPressedQuestion != null), 'AppBarTribanco: When showHelp is true, you need to also define an onPressedQuestion action.');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      toolbarHeight: preferredSize.height,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      leadingWidth: 56.wsp,
      leading: (showLeading)
          ? Padding(
              padding: EdgeInsets.only(left: 20.wsp),
              child: IconButton(
                icon: Icon(leadingIcon),
                iconSize: leadingIconSize ?? 24.wsp,
                color: color ?? ColorPalette.colorPrimary500,
                onPressed: leadingOnPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
            )
          : null,
      title: _getTitle(),
      centerTitle: true,
      actions: [
        if (actions != null) ...actions!,
        if (showHelp)
          Padding(
            padding: EdgeInsets.only(right: 20.wsp),
            child: IconButton(
                icon: Icon(TribancoIcons.question, color: !showHelp ? Colors.transparent : color ?? ColorPalette.colorPrimary500),
                iconSize: 26.wsp,
                onPressed: showHelp ? onPressedQuestion : null),
          ),
      ],
    );
  }

  Widget _getTitle() {
    if (appbarSize == null || appbarSize == AppbarSize.xMedium20) {
      return Text(
        title,
        textAlign: TextAlign.center,
      ).xMedium(
        style: TextStyle(color: color ?? ColorPalette.colorPrimary500, fontWeight: FontWeight.w400, height: 1),
      );
    }
    return Text(
      title,
      textAlign: TextAlign.center,
    ).small(
      style: TextStyle(
        color: color ?? ColorPalette.colorPrimary500,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

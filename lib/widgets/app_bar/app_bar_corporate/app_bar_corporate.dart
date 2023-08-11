import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarCorporate extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.hsp);

  final String title;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;
  final Color? color;
  final AppbarSize? appbarSize;
  final Function()? onPressedQuestion;
  final bool showHelp;
  final bool showLeading;

  const AppBarCorporate({
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
  }) : assert(!showHelp || (showHelp && onPressedQuestion != null), 'AppBarCorporate: When showHelp is true, you need to also define an onPressedQuestion action.');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor ?? Colors.transparent,
          toolbarHeight: preferredSize.height,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          leadingWidth: 56.wsp,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.wsp),
            child: IconButton(
              icon: Icon(leadingIcon),
              iconSize: 16.wsp,
              color: color ?? ColorPalette.colorPrimary500,
              onPressed: leadingOnPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            ),
          ),
          title: _getTitle(),
          centerTitle: true,
        ),
        Container(
          height: Spacing.xMicro.hsp,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [ColorPalette.colorTertiaryA500, ColorPalette.colorSecondary500])),
        ),
      ],
    );
  }

  Widget _getTitle() {
    if (appbarSize == null || appbarSize == AppbarSize.xMedium20) {
      return Text(
        title,
        textAlign: TextAlign.center,
      ).small(
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

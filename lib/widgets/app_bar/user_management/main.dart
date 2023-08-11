import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserManagementAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(90.hsp);

  final String title;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? color;
  final AppbarSize? appbarSize;
  final bool isShowModal;
  final Widget? widgetQuestion;

  const UserManagementAppbar(
      {super.key,
      required this.title,
      this.appbarSize,
      this.leadingIcon = TribancoIcons.arrowLeft,
      this.leadingOnPressed,
      this.color,
      required this.isShowModal,
      this.widgetQuestion})
      : assert(!isShowModal || (isShowModal && widgetQuestion != null), 'UserManagementAppbar: When isShowModal is true, you need to define a widgetQuestion.');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: preferredSize.height,
      leadingWidth: 56.wsp,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
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
      centerTitle: true,
      actions: [
        if (isShowModal)
          Padding(
              padding: EdgeInsets.only(right: 20.wsp),
              child: IconButton(
                  icon: Icon(TribancoIcons.question, color: ColorPalette.colorPrimary500),
                  iconSize: 26.wsp,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widgetQuestion ?? Container()));
                  }))
        else
          Container()
      ],
    );
  }

  Widget _getTitle() {
    if (appbarSize == null || appbarSize == AppbarSize.xMedium20) {
      return Text(
        title,
      ).xMedium(
        style: TextStyle(
          height: 1.0,
          color: color ?? ColorPalette.colorPrimary500,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    return Text(
      title,
    ).small(
      style: TextStyle(
        height: 1.0,
        color: color ?? ColorPalette.colorPrimary500,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

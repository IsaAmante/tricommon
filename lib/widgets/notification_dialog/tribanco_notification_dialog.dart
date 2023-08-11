import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoNotificationDialog extends StatelessWidget {
  const TribancoNotificationDialog({
    required this.type,
    required this.text,
    this.title,
    this.showIcon = true,
    this.color,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.centerIcon = true,
    this.borderSize = BorderSize.thin,
    this.borderRadiusSize = BorderRadiusSize.medium,
    this.fontWeight = FontWeight.w500,
    this.onTap,
    this.suffixIcon = false,
    this.customIcon,
    super.key,
  });

  final String text;
  final NotificationType type;
  final String? title;
  final bool showIcon;
  final Color? borderColor;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final bool centerIcon;
  final BorderSize borderSize;
  final BorderRadiusSize borderRadiusSize;
  final FontWeight fontWeight;
  final Function()? onTap;
  final bool suffixIcon;
  final IconData? customIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: TribancoBorder.radius(
          size: borderRadiusSize,
          positions: [BorderPosition.all],
        ),
        border: TribancoBorder.border(
          size: borderSize,
          color: borderColor ??
              ((type == NotificationType.information)
                  ? ColorPalette.colorInformational400
                  : (type == NotificationType.alert)
                      ? ColorPalette.colorWarning400
                      : (type == NotificationType.success)
                          ? ColorPalette.colorSuccess400
                          : ColorPalette.colorDanger400),
        ),
        color: color ??
            ((type == NotificationType.information)
                ? ColorPalette.colorInformational050
                : (type == NotificationType.alert)
                    ? ColorPalette.colorWarning050
                    : (type == NotificationType.success)
                        ? ColorPalette.colorSuccess050
                        : ColorPalette.colorDanger050),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.hsp,
          horizontal: 16.wsp,
        ),
        child: Row(
          crossAxisAlignment: centerIcon ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showIcon
                ? Padding(
                    padding: EdgeInsets.only(
                      right: 8.wsp,
                      top: (!centerIcon) ? 6.hsp : 0,
                    ),
                    child: GestureDetector(
                      onTap: onTap,
                      child: Icon(
                        customIcon ??
                            ((type == NotificationType.information)
                                ? TribancoIcons.info
                                : (type == NotificationType.alert)
                                    ? TribancoIcons.warning
                                    : (type == NotificationType.success)
                                        ? TribancoIcons.sucess
                                        : TribancoIcons.xCircle),
                        size: 26.wsp,
                        color: textColor ??
                            ((type == NotificationType.information)
                                ? ColorPalette.colorInformational700
                                : (type == NotificationType.alert)
                                    ? ColorPalette.colorWarning700
                                    : (type == NotificationType.success)
                                        ? ColorPalette.colorSuccess700
                                        : ColorPalette.colorDanger700),
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  title != null
                      ? Text(
                          title!,
                          softWrap: true,
                        ).xXSmall(
                          style: TextStyle(
                            fontSize: fontSize ?? 16.hsp,
                            height: (height ?? 16.hsp) / (fontSize ?? 16.hsp),
                            fontWeight: FontWeight.w700,
                            color: textColor ??
                                ((type == NotificationType.information)
                                    ? ColorPalette.colorInformational700
                                    : (type == NotificationType.alert)
                                        ? ColorPalette.colorWarning700
                                        : (type == NotificationType.success)
                                            ? ColorPalette.colorSuccess700
                                            : ColorPalette.colorDanger700),
                          ),
                        )
                      : Container(),
                  Text(
                    text,
                    softWrap: true,
                  ).xXSmall(
                    style: TextStyle(
                      fontSize: fontSize ?? 12.hsp,
                      height: (height ?? 16.hsp) / (fontSize ?? 12.hsp),
                      fontWeight: fontWeight,
                      color: textColor ??
                          ((type == NotificationType.information)
                              ? ColorPalette.colorInformational700
                              : (type == NotificationType.alert)
                                  ? ColorPalette.colorWarning700
                                  : (type == NotificationType.success)
                                      ? ColorPalette.colorSuccess700
                                      : ColorPalette.colorDanger700),
                    ),
                  ),
                ],
              ),
            ),
            suffixIcon
                ? Padding(
                    padding: EdgeInsets.only(
                      left: 8.wsp,
                      top: (!centerIcon) ? 6.hsp : 0,
                    ),
                    child: Icon(
                      TribancoIcons.chevronRight,
                      size: 24.wsp,
                      color: textColor ??
                          ((type == NotificationType.information)
                              ? ColorPalette.colorInformational700
                              : (type == NotificationType.alert)
                                  ? ColorPalette.colorWarning700
                                  : (type == NotificationType.success)
                                      ? ColorPalette.colorSuccess700
                                      : ColorPalette.colorDanger700),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StepsAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(showStepsProgress ? 140.hsp : 98.hsp);
  final String title;
  final int? step;
  final IconData leadingIcon;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? onPressedQuestion;
  final Color? color;
  final AppbarSize? appbarSize;
  final Widget? widgetQuestion;
  final bool showStepsProgress;
  final int? count;
  final bool isShowModal;
  final bool showHelp;
  const StepsAppbar({
    super.key,
    required this.step,
    required this.title,
    this.appbarSize,
    this.leadingIcon = TribancoIcons.arrowLeft,
    this.leadingOnPressed,
    this.onPressedQuestion,
    this.widgetQuestion,
    this.color,
    this.showStepsProgress = true,
    this.showHelp = true,
    this.count = 5,
    required this.isShowModal,
  }) : assert(!showHelp || (showHelp && (onPressedQuestion != null || widgetQuestion != null)),
            'StepsAppbar: When showHelp is true, you need to also define an onPressedQuestion action.');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: appbarSize == null ? 8.hsp : 0),
          child: AppBar(
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
            centerTitle: true,
            actions: [
              if (showHelp)
                Padding(
                  padding: EdgeInsets.only(right: 20.wsp),
                  child: IconButton(
                    icon: const Icon(TribancoIcons.question),
                    iconSize: 26.wsp,
                    color: color ?? ColorPalette.colorPrimary500,
                    onPressed: onPressedQuestion ??
                        () {
                          if (isShowModal) {
                            TribancoModal().openModal(context: context, content: widgetQuestion ?? Container());
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => widgetQuestion ?? Container()));
                          }
                        },
                  ),
                )
            ],
          ),
        ),
        if (step != null && showStepsProgress)
          Container(
            margin: EdgeInsets.only(top: Spacing.tiny.hsp),
            child: TribancoStepsDiletta(
              currentIndex: step!,
              count: count!,
            ),
          ),
        if (step != null)
          SizedBox(
            height: 8.hsp,
          )
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

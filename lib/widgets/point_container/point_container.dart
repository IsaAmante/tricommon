import 'package:flutter/material.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';

class PointComponent extends StatelessWidget {
  final Widget child;
  final bool showPoint;
  final double size;
  final Color? color;
  final bool isSpace;
  final double padding;
  final int count;

  const PointComponent({
    Key? key,
    required this.child,
    required this.showPoint,
    required this.size,
    this.color,
    required this.isSpace,
    required this.padding,
    this.count = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (child as Text).style!.height! * (child as Text).style!.fontSize!,
      child: showPoint ? _component : child,
    );
  }

  Widget get _component {
    final children = <Widget>[];
    for (int i = 0; i < count; i++) {
      if (i != 0) {
        children.add(_spacer);
      }
      children.add(_circle);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (child is Text) ...[
          Text('', style: (child as Text).style),
        ],
        ...children,
      ],
    );
  }

  Widget get _circle => Container(
        margin: EdgeInsets.only(
          top: isSpace ? padding : 0,
        ),
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? ((child is Text) ? (child as Text).style?.color : null),
        ),
      );

  Widget get _spacer => SizedBox(
        width: 2.wsp,
      );
}

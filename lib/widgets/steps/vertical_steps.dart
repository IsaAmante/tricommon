import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:tricommon/common.dart';

class VerticalSteps extends StatefulWidget {
  const VerticalSteps({
    required this.processIndex,
    this.itemCountTotal = 5,
    this.rotatedBoxCheck = 0,
    this.height,
    super.key,
  });

  final int processIndex;
  final int itemCountTotal;
  final int rotatedBoxCheck;
  final double? height;

  @override
  State<StatefulWidget> createState() => _VerticalStepsState();
}

class _VerticalStepsState extends State<VerticalSteps> with SingleTickerProviderStateMixin {
  var completeColor = ColorPalette.colorTertiaryA500;
  var inProgressColor = ColorPalette.colorNeutral300;
  var todoColor = ColorPalette.colorNeutral100;

  @override
  Widget build(BuildContext context) {
    double heightSteps = widget.height ?? (MediaQuery.of(context).size.height / widget.itemCountTotal);
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) => heightSteps,
        indicatorBuilder: (_, index) {
          Color color;
          dynamic child;
          if (index == widget.processIndex) {
            color = inProgressColor;
            child = Container(
              decoration: BoxDecoration(border: TribancoBorder.border(size: BorderSize.thick, color: completeColor), color: ColorPalette.colorNeutralWhite, shape: BoxShape.circle),
            );
          } else if (index < widget.processIndex) {
            color = completeColor;
            child = RotatedBox(
              quarterTurns: widget.rotatedBoxCheck,
              child: Icon(
                Icons.check,
                color: ColorPalette.colorTertiaryA900,
                size: 15.wsp,
              ),
            );
          } else {
            color = todoColor;
          }
          if (index <= widget.processIndex) {
            return DotIndicator(
              size: 24.wsp,
              color: color,
              child: child,
            );
          } else {
            return DotIndicator(
              size: 22.wsp,
              color: inProgressColor,
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              width: 8.wsp,
              color: (index <= widget.processIndex) ? completeColor : todoColor,
              duration: const Duration(milliseconds: 1500),
            );
          } else {
            return SolidLineConnector(
              thickness: 8.wsp,
              color: todoColor,
              direction: Axis.vertical,
            );
          }
        },
        itemCount: widget.itemCountTotal,
      ),
    );
  }
}

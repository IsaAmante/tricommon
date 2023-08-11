import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:tricommon/common.dart';

class TribancoSteps extends StatefulWidget {
  const TribancoSteps({
    required this.processIndex,
    this.itemCountTotal = 5,
    this.rotatedBoxCheck = 0,
    this.width,
    super.key,
  });

  final int processIndex;
  final int itemCountTotal;
  final int rotatedBoxCheck;
  final double? width;

  @override
  State<StatefulWidget> createState() => _TribancoStepsState();
}

class _TribancoStepsState extends State<TribancoSteps> with SingleTickerProviderStateMixin {
  var completeColor = ColorPalette.colorTertiaryA500;
  var inProgressColor = ColorPalette.colorNeutral300;
  var todoColor = ColorPalette.colorNeutral100;

  @override
  Widget build(BuildContext context) {
    double widthSteps = widget.width ?? (MediaQuery.of(context).size.width / widget.itemCountTotal);
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.horizontal,
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) => widthSteps,
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
                size: 15.hsp,
              ),
            );
          } else {
            color = todoColor;
          }
          if (index <= widget.processIndex) {
            return DotIndicator(
              size: 24.hsp,
              color: color,
              child: child,
            );
          } else {
            return DotIndicator(
              size: 16.hsp,
              color: inProgressColor,
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              height: 8.hsp,
              color: (index <= widget.processIndex) ? completeColor : todoColor,
              duration: const Duration(milliseconds: 1500),
            );
          } else {
            return SolidLineConnector(
              thickness: 8.hsp,
              color: todoColor,
            );
          }
        },
        itemCount: widget.itemCountTotal,
      ),
    );
  }
}

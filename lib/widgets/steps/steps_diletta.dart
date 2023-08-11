import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoStepsDiletta extends StatefulWidget {
  const TribancoStepsDiletta({
    required this.count,
    required this.currentIndex,
    this.width,
    this.margin,
    super.key,
  });

  final int count;
  final int currentIndex;
  final double? width;
  final double? margin;

  @override
  State<StatefulWidget> createState() => _TribancoStepsDiletta();
}

class _TribancoStepsDiletta extends State<TribancoStepsDiletta> {
  int count = 0;
  double width = 0;
  double margin = 0;
  final Color completeColor = ColorPalette.colorTertiaryA500;
  final Color inProgressColor = ColorPalette.colorNeutral200;
  final Color todoColor = ColorPalette.colorNeutral100;
  final Color backgroundColor = ColorPalette.colorNeutralWhite;
  final double circleSize = 24.hsp;
  final double lineHeight = 8.hsp;

  @override
  void initState() {
    super.initState();
    count = widget.count;
    margin = widget.margin ?? 24.wsp;
  }

  @override
  Widget build(BuildContext context) {
    width = widget.width ?? MediaQuery.of(context).size.width - margin - margin;
    final lineWidth = (width - circleSize) / (count - 1);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Stack(children: [
        Container(
            height: 24.hsp,
            margin: EdgeInsets.symmetric(horizontal: circleSize / 2),
            child: Row(
              children: _getLines(lineWidth: lineWidth),
            )),
        SizedBox(
            height: 24.hsp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getCircles(),
            )),
      ]),
    );
  }

  List<Widget> _getLines({required double lineWidth}) {
    final List<Widget> lines = [];
    for (int i = 0; i < count - 1; i++) {
      lines.add(_getLine(index: i, lineWidth: lineWidth));
    }
    return lines;
  }

  Widget _getLine({required int index, required double lineWidth}) {
    return Stack(
      children: [
        Container(
          height: 8.hsp,
          width: lineWidth,
          color: todoColor,
        ),
        AnimatedContainer(
          curve: Curves.linear,
          height: 8.hsp,
          width: (index < widget.currentIndex) ? lineWidth : 0,
          color: completeColor,
          duration: const Duration(milliseconds: 700),
        ),
      ],
    );
  }

  List<Widget> _getCircles() {
    final List<Widget> circles = [];
    for (int i = 0; i < count; i++) {
      circles.add(_getCircle(index: i));
    }
    return circles;
  }

  Widget _getCircle({required int index}) {
    return Container(
        width: index <= widget.currentIndex ? circleSize : circleSize - 4.hsp,
        height: index <= widget.currentIndex ? circleSize : circleSize - 4.hsp,
        decoration: BoxDecoration(
            color: index < widget.currentIndex
                ? completeColor
                : index == widget.currentIndex
                    ? backgroundColor
                    : inProgressColor,
            borderRadius: const BorderRadius.all(Radius.circular(180)),
            border: Border.all(color: index <= widget.currentIndex ? completeColor : Colors.transparent, width: 4.hsp)),
        child: index >= widget.currentIndex
            ? Container()
            : Icon(
                TribancoIcons.check,
                size: 12.hsp,
              ));
  }
}

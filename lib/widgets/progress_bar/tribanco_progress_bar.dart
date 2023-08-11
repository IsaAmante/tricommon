import 'package:flutter/material.dart';

import '../../common.dart';

class TribancoProgressBar extends StatelessWidget {
  const TribancoProgressBar({
    required this.value,
    required this.finalValue,
    this.height,
    this.width,
    this.backgroundColor,
    this.color,
    this.padding,
    super.key,
  });

  final double value;
  final double finalValue;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsets? padding;

  double get _result {
    return value / finalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(Spacing.tiny),
      child: SizedBox(
        width: width,
        height: height ?? Spacing.tiny,
        child: LinearProgressIndicator(
          minHeight: Spacing.tiny,
          backgroundColor: backgroundColor ?? ColorPalette.colorPrimary500,
          color: color ?? ColorPalette.colorTertiaryA500,
          value: (_result.isNaN) ? 0 : _result,
        ),
      ),
    );
  }
}

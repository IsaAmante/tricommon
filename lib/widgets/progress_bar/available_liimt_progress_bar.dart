import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class AvailableLimitProgressBar extends StatelessWidget {
  const AvailableLimitProgressBar({
    super.key,
    required this.availableLimit,
    required this.usedLimit,
  });
  final double availableLimit;
  final double usedLimit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0.hsp),
          height: 8.0.hsp,
          color: ColorPalette.colorPrimary500,
        ),
        Transform.scale(
          alignment: Alignment.centerLeft,
          scaleX: usedLimit / availableLimit,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0.hsp),
            height: 8.0.hsp,
            color: ColorPalette.colorTertiaryA500,
          ),
        ),
      ],
    );
  }
}

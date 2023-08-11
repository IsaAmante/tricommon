import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoHiddenAmount extends StatelessWidget {
  const TribancoHiddenAmount({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        6,
        (index) => Container(
          width: 4.0.wsp,
          height: 4.0.wsp,
          margin: EdgeInsets.symmetric(horizontal: 1.0.wsp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? ColorPalette.colorPrimary500,
          ),
        ),
      ),
    );
  }
}

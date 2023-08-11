import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/utils/utils.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key? key,
    this.color,
    this.value,
    this.size,
  }) : super(key: key);

  final Color? color;
  final double? value;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 24.wsp,
      height: size ?? 24.wsp,
      child: SpinKitFadingCircle(
        color: color ?? ColorPalette.colorPrimary500,
        size: size ?? 24.wsp,
      ),
    );
  }
}

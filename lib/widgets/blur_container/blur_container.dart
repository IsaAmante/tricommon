import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final bool fullScreen;
  final bool blurChild;
  final bool showBlur;

  const BlurContainer({Key? key, required this.child, this.fullScreen = false, this.blurChild = false, this.showBlur = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showBlur) {
      return child;
    }
    if (blurChild) {
      return ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 6,
        ),
        child: child,
      );
    }
    if (fullScreen) {
      return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 6,
          ),
          child: child);
    }
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 6,
            ),
            child: child));
  }
}

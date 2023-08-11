import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/enums/border.dart';
import 'package:flutter/material.dart';

class TribancoBorder extends Border {
  const TribancoBorder._();

  static double _getBorderSize(BorderSize size) {
    switch (size) {
      case BorderSize.none:
        return 0;
      case BorderSize.hairline:
        return 1.0;
      case BorderSize.thin:
        return 2.0;
      case BorderSize.thick:
        return 4.0;
      case BorderSize.heavy:
        return 8.0;
    }
  }

  static double _getRadiusSize(BorderRadiusSize size) {
    switch (size) {
      case BorderRadiusSize.none:
        return 0;
      case BorderRadiusSize.small:
        return 2.0;
      case BorderRadiusSize.medium:
        return 4.0;
      case BorderRadiusSize.large:
        return 8.0;
      case BorderRadiusSize.huge:
        return 16.0;
      case BorderRadiusSize.circle:
        return 10000.0; //we should build with shape?
    }
  }

  static Border border({
    BorderSize? size,
    Color? color,
    BorderStyle? style,
  }) {
    return Border.all(
      color: color ?? ColorPalette.colorPrimary500,
      width: _getBorderSize(size ?? BorderSize.none),
      style: style ?? BorderStyle.solid,
    );
  }

  static BorderRadius radius({required BorderRadiusSize size, required List<BorderPosition> positions}) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(_getRadiusSize(positions.contains(BorderPosition.bottomLeft) || positions.contains(BorderPosition.all) ? size : BorderRadiusSize.none)),
      bottomRight: Radius.circular(_getRadiusSize(positions.contains(BorderPosition.bottomRight) || positions.contains(BorderPosition.all) ? size : BorderRadiusSize.none)),
      topLeft: Radius.circular(_getRadiusSize(positions.contains(BorderPosition.topLeft) || positions.contains(BorderPosition.all) ? size : BorderRadiusSize.none)),
      topRight: Radius.circular(_getRadiusSize(positions.contains(BorderPosition.topRight) || positions.contains(BorderPosition.all) ? size : BorderRadiusSize.none)),
    );
  }
}

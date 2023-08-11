import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoToggleButtons extends StatelessWidget {
  const TribancoToggleButtons({
    super.key,
    required this.isSelected,
    required this.labels,
    this.size,
    this.onPressed,
    this.vertical = false,
  });

  final bool vertical;
  final List<bool> isSelected;
  final List<Widget> labels;
  final ScreenSize? size;
  final void Function(int index)? onPressed;

  static const double _borderWidth = 1.0;

  EdgeInsets _getPaddings() {
    switch (size) {
      case ScreenSize.small:
        return const EdgeInsets.symmetric(vertical: 4, horizontal: 12);
      case ScreenSize.medium:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 12);
      case ScreenSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 12);
      default:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 12);
    }
  }

  double _getHeight() {
    switch (size) {
      case ScreenSize.small:
        return 32.hsp;
      case ScreenSize.medium:
        return 48.hsp;
      case ScreenSize.large:
        return 56.hsp;
      default:
        return 32.hsp;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var label in labels) {
      children.add(
        Padding(
          padding: _getPaddings(),
          child: label,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          isSelected: isSelected,
          onPressed: onPressed,
          selectedColor: ColorPalette.colorNeutralWhite,
          fillColor: ColorPalette.colorPrimary500,
          constraints: BoxConstraints.expand(
            width: (constraints.maxWidth / isSelected.length - _borderWidth * 2),
            height: _getHeight(),
          ),
          borderColor: ColorPalette.colorPrimary500,
          selectedBorderColor: ColorPalette.colorPrimary500,
          borderWidth: _borderWidth,
          color: ColorPalette.colorPrimary500,
          borderRadius: TribancoBorder.radius(
            size: BorderRadiusSize.small,
            positions: [
              BorderPosition.all,
            ],
          ),
          children: children,
        );
      },
    );
  }
}

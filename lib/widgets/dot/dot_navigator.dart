import 'package:flutter/material.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';

class TribancoDotNavigator extends StatelessWidget {
  final double dotWidth;
  final double dotHeight;
  final Color? dotColor;
  final double dotSelectedWidth;
  final double dotSelectedHeight;
  final Color? dotSelectedColor;
  final double dotSpacing;
  final int dotsCount;
  final int dotSelected;
  const TribancoDotNavigator(
      {super.key,
      required this.dotsCount,
      required this.dotSelected,
      this.dotColor,
      this.dotSelectedColor,
      this.dotHeight = 4.0,
      this.dotWidth = 16.0,
      this.dotSelectedHeight = 8.0,
      this.dotSelectedWidth = 24.0,
      this.dotSpacing = 8.0});

  @override
  Widget build(BuildContext context) {
    final max = ((MediaQuery.of(context).size.width) / (dotWidth.wsp + dotSpacing.wsp)).floor() - 1;
    final count = dotsCount > max ? max : dotsCount;
    final dots = <Widget>[];
    for (int i = 0; i < count; i++) {
      dots.add(_dot(isSelected: (dotSelected == i || (i == count - 1 && dotSelected >= count)), isFirst: i == 0));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: dots,
    );
  }

  Widget _dot({required bool isFirst, required bool isSelected}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.only(left: isFirst ? 0 : dotSpacing.wsp),
      width: isSelected ? dotSelectedWidth.wsp : dotWidth.wsp,
      height: isSelected ? dotSelectedHeight.hsp : dotHeight.hsp,
      color: _getColor(isSelected: isSelected),
    );
  }

  Color _getColor({required bool isSelected}) {
    if (isSelected) {
      return dotSelectedColor ?? ColorPalette.colorPrimary500;
    }
    return dotColor ?? ColorPalette.colorPrimary050;
  }
}

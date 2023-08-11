import 'package:flutter/material.dart';

import '../../common.dart';

class TribancoSlider extends StatelessWidget {
  const TribancoSlider({
    super.key,
    required this.value,
    required this.maxValue,
    required this.onChanged,
    this.minValue,
    this.divisions,
    this.activetrackColor,
    this.inactivetrackColor,
  });

  final double value;
  final double maxValue;
  final double? minValue;
  final Function(double) onChanged;
  final int? divisions;
  final Color? activetrackColor;
  final Color? inactivetrackColor;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        trackHeight: Spacing.tiny.hsp,
        trackShape: const RectangularSliderTrackShape(),
        activeTrackColor: activetrackColor ?? ColorPalette.colorPrimary500,
        inactiveTrackColor: inactivetrackColor ?? ColorPalette.colorNeutral200,
        thumbShape: const RoundSliderThumbShape(),
        thumbColor: ColorPalette.colorNeutralWhite,
        tickMarkShape: SliderTickMarkShape.noTickMark,
      ),
      child: Slider(
        onChanged: onChanged,
        value: value,
        divisions: divisions,
        max: maxValue,
        min: minValue ?? 0,
      ),
    );
  }
}

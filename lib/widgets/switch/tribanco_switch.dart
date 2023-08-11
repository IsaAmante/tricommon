import 'package:flutter/cupertino.dart';
import 'package:tricommon/common.dart';

enum TribancoSwitchSize {
  tiny,
  small,
  medium,
  large,
}

class TribancoSwitch extends StatefulWidget {
  const TribancoSwitch({
    super.key,
    required this.isSelected,
    this.onChanged,
    this.size = TribancoSwitchSize.large,
  });

  final bool isSelected;
  final void Function(bool)? onChanged;
  final TribancoSwitchSize size;

  @override
  State<TribancoSwitch> createState() => _TribancoSwitchState();
}

class _TribancoSwitchState extends State<TribancoSwitch> {
  late bool isSelected;
  @override
  initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: CupertinoSwitch(
          activeColor: ColorPalette.colorPrimary500,
          trackColor: ColorPalette.colorNeutral200,
          value: isSelected,
          onChanged: ((value) {
            setState(() {
              isSelected = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          }),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (widget.size) {
      case TribancoSwitchSize.tiny:
        return 8;
      case TribancoSwitchSize.small:
        return 16;
      case TribancoSwitchSize.medium:
        return 24;
      case TribancoSwitchSize.large:
        return 32;
    }
  }
}

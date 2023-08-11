import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class TribancoAccordion extends StatelessWidget {
  const TribancoAccordion({
    super.key,
    required this.context,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    required this.header,
    required this.description,
  });

  final BuildContext context;
  final bool initiallyExpanded;
  final Function(bool)? onExpansionChanged;
  final Widget header;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return _accordion();
  }

  Widget _accordion() {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: ColorPalette.colorPrimary500,
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
              iconColor: ColorPalette.colorPrimary500,
              collapsedIconColor: ColorPalette.colorPrimary500,
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: initiallyExpanded,
              onExpansionChanged: onExpansionChanged,
              title: header,
              children: [description]),
        ),
        const DividerTribanco(),
      ],
    );
  }
}

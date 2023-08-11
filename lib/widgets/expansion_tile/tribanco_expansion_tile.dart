import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoExpansionTile extends StatelessWidget {
  final String title;
  final String bodyText;
  final Icon? icon;
  const TribancoExpansionTile({
    Key? key,
    required this.title,
    required this.bodyText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.small),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: ColorPalette.colorNeutral100),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: ColorPalette.colorPrimary500,
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            iconColor: ColorPalette.colorPrimary500,
            collapsedIconColor: ColorPalette.colorPrimary500,
            title: Text(title).xMedium(
              style: TextStyle(
                color: ColorPalette.colorPrimary500,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Text(bodyText),
              )
            ],
          ),
        ),
      ),
    );
  }
}

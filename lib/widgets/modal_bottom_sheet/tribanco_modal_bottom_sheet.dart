import 'package:flutter/material.dart';
import 'package:tricommon/core/consts/consts.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';

class TribancoModalBottomSheet {
  TribancoModalBottomSheet._();

  static Future<void> openBottomSheet(BuildContext context, Widget content, {bool isDismissible = true}) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              color: ColorPalette.colorNeutralWhite,
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Spacing.xTiny.wsp, vertical: Spacing.xTiny.hsp),
                      width: 32.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: ColorPalette.colorNeutralWhite,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    content,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

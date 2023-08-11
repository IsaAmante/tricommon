import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoModal<T> {
  Future<T> openModal({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
    bool border = true,
    EdgeInsets? contentPadding,
    bool canPop = true,
    double? width,
  }) async {
    return await showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (BuildContext cxt) {
        return WillPopScope(
          onWillPop: () async {
            return canPop;
          },
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(Spacing.xSmall.wsp),
              child: Material(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: ColorPalette.colorNeutralWhite,
                      border: Border.all(
                        width: border ? 1.0.wsp : 0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    child: Padding(
                      padding: contentPadding ?? EdgeInsets.all(Spacing.xXSmall.wsp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [content],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

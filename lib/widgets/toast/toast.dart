import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tricommon/core/enums/toast.dart';
import 'package:tricommon/core/utils/app_responsive/app_responsive_ext.dart';

import '../../core/consts/color_palette.dart';

@Deprecated("""
  [TribancoToast] is being deprecated in favor of [TribancoMessage].
  """)
class TribancoToast {
  TribancoToast._();

  @Deprecated("""
  [TribancoToast.show] is being deprecated in favor of [TribancoMessage.showMessage] and [TribancoMessage.showError].
  """)
  static void show({required String message, required TribancoToastType type, required TribancoToastPosition gravity}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: _getPosition(gravity: gravity),
      backgroundColor: _getBackgroundColor(type: type),
      textColor: _getTextColor(type: type),
      fontSize: 14.hsp,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Color _getBackgroundColor({required TribancoToastType type}) {
    switch (type) {
      case TribancoToastType.alert:
        return ColorPalette.colorWarning400;
      case TribancoToastType.info:
        return ColorPalette.colorSecondary400;
      case TribancoToastType.error:
        return ColorPalette.colorDanger400;
      case TribancoToastType.success:
        return ColorPalette.colorSuccess600;
    }
  }

  static Color _getTextColor({required TribancoToastType type}) {
    switch (type) {
      case TribancoToastType.alert:
        return ColorPalette.colorWarning700;
      case TribancoToastType.info:
        return ColorPalette.colorSecondary700;
      case TribancoToastType.error:
        return ColorPalette.colorDanger700;
      case TribancoToastType.success:
        return ColorPalette.colorSuccess050;
    }
  }

  static ToastGravity _getPosition({required TribancoToastPosition gravity}) {
    switch (gravity) {
      case TribancoToastPosition.top:
        return ToastGravity.TOP;
      case TribancoToastPosition.bottom:
        return ToastGravity.BOTTOM;
    }
  }
}

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TribancoScreenshot {
  static Future<Uint8List> getImageFromWidgetasUint8List(GlobalKey renderKey) async {
    RenderRepaintBoundary boundary = renderKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    if (kDebugMode) {
      if (boundary.debugNeedsPaint) {
        await Future.delayed(const Duration(milliseconds: 50));
        return getImageFromWidgetasUint8List(renderKey);
      }
    }
    try {
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (error) {
      await Future.delayed(const Duration(milliseconds: 50));
      debugPrint(error.toString());
      return getImageFromWidgetasUint8List(renderKey);
    }
  }
}

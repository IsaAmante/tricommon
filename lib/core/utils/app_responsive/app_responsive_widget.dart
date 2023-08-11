import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// This widget need be the home widget at MaterialApp
class AppResponsiveWidget extends StatelessWidget {
  const AppResponsiveWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    //A altura, vamos considerar o tamanho total da tela, menos os tamanhos da statusBar e da actionBar
    //Tamanho total da tela
    final totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    bool isFold = false;
    if (totalWidth > 500) {
      totalWidth = AppResponsive.lastWidth != 0.0 ? AppResponsive.lastWidth : totalWidth / 2;
      isFold = true;
    }
    //Tamanho da statusBar
    final statusBarSize = MediaQuery.of(context).padding.top;
    //Tamanho da actionBar
    final actionBarSize = MediaQuery.of(context).padding.bottom;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    AppResponsive()
      ..setIsAppWeb(kIsWeb)
      ..setWidth(totalHeight > totalWidth ? totalWidth : totalHeight)
      ..setStatusBarSize(statusBarSize)
      ..setActionBarSize(actionBarSize)
      ..setHeight(totalHeight > totalWidth ? totalHeight : totalWidth)
      ..setTextScaleFactor(textScaleFactor)
      ..setIsFold(isFold)
      ..setInitTextScaleFactor(textScaleFactor)
      ..setInitHeightAndWidth(totalHeight, totalWidth);
    return child ?? Container();
  }
}

import 'package:flutter/material.dart';

class WebResponsiveScreenType {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 576;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 576 && MediaQuery.of(context).size.width <= 768;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width <= 1373;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1373;
  }
}

import 'package:flutter/material.dart';

class TribancoShadow extends BoxShadow {
  const TribancoShadow._();

  static level4() {
    return const BoxShadow(
      color: Color.fromRGBO(38, 38, 46, 0.1),
      blurRadius: 4.0,
      blurStyle: BlurStyle.normal,
      offset: Offset(0, 1),
      spreadRadius: 0.0,
    );
  }

  static level8() {
    return const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 8.0,
      blurStyle: BlurStyle.normal,
      offset: Offset(0, 1),
      spreadRadius: 0.0,
    );
  }

  static level16() {
    return const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 16.0,
      blurStyle: BlurStyle.normal,
      offset: Offset(0, 4.0),
      spreadRadius: 0.0,
    );
  }

  static level24() {
    return const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      blurRadius: 24.0,
      blurStyle: BlurStyle.normal,
      offset: Offset(0, 8.0),
      spreadRadius: 0.0,
    );
  }

  static level32() {
    return const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      blurRadius: 32.0,
      blurStyle: BlurStyle.normal,
      offset: Offset(0, 16),
      spreadRadius: 0.0,
    );
  }
}

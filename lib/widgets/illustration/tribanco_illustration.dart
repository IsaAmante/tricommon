import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoIllustration {
  TribancoIllustration._();

  static Widget get({
    required IllustrationType type,
  }) {
    return SvgPicture.asset(
      type.file,
      package: 'common',
      semanticsLabel: type.semanticLabel,
    );
  }
}

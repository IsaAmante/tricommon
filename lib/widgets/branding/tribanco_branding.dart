import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class TribancoBranding {
  TribancoBranding._();

  static Widget get({
    required Branding type,
  }) {
    return SvgPicture.asset(
      type.file,
      package: 'common',
    );
  }
}

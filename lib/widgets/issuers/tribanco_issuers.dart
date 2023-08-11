import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class TribancoIssuers {
  TribancoIssuers._();

  static Widget get({
    required Issuer type,
  }) {
    return SvgPicture.asset(
      type.file,
      package: 'common',
    );
  }
}

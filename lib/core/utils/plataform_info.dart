import 'package:flutter/foundation.dart';

class PlatformInfo {
  static final PlatformInfo _singleton = PlatformInfo._internal();

  factory PlatformInfo() {
    return _singleton;
  }

  PlatformInfo._internal();

  TargetPlatform get _targetPlatform => defaultTargetPlatform;

  bool get isDesktop => _targetPlatform == TargetPlatform.macOS || _targetPlatform == TargetPlatform.linux || _targetPlatform == TargetPlatform.windows;

  bool get isMobile => _targetPlatform == TargetPlatform.iOS || _targetPlatform == TargetPlatform.android;

  bool get isLinux => _targetPlatform == TargetPlatform.linux;
  bool get isMacOS => _targetPlatform == TargetPlatform.macOS;
  bool get isWindows => _targetPlatform == TargetPlatform.windows;
}

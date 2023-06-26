import 'package:flutter/foundation.dart';

class PlatformClassifier {
  static final PlatformClassifier _platformClassifier =
      PlatformClassifier._internal();
  factory PlatformClassifier() {
    return _platformClassifier;
  }

  PlatformClassifier._internal();

  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;

  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.fuchsia;
}

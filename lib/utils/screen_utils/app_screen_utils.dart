import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class AppScreenUtils {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isWebOrDesktop() {
    return kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  static double scaleValue(BuildContext context, double baseValue) {
    double screenWidth = width(context);

    if (isWebOrDesktop()) {
      if (screenWidth > 1200) {
        return baseValue * 1.3;
      } else if (screenWidth > 800 && screenWidth <= 1200) {
        return baseValue * 1.2;
      }
    }
    return baseValue;
  }
}

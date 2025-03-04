import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FontSizes {
  static double scale(BuildContext context, double baseSize) {
    double width = MediaQuery.of(context).size.width;

    if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      if (width > 1200) {
        return baseSize * 1.3;
      } else if (width > 800 && width <= 1200) {
        return baseSize * 1.2;
      }
    }
    return baseSize;
  }

  static const double k10 = 10;
  static const double k12 = 12;
  static const double k14 = 14;
  static const double k16 = 16;
  static const double k18 = 18;
  static const double k20 = 20;
  static const double k24 = 24;
  static const double k28 = 28;
  static const double k32 = 32;
  static const double k36 = 36;
  static const double k40 = 40;
}

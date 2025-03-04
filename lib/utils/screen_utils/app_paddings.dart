import 'package:flutter/material.dart';
import 'package:jinee_ims/utils/extensions/app_size_extensions.dart';

class AppPaddings {
  static EdgeInsets p(BuildContext context, double value) =>
      EdgeInsets.all(value.appSize(context));

  static EdgeInsets ph(BuildContext context, double value) =>
      EdgeInsets.symmetric(horizontal: value.appSize(context));

  static EdgeInsets pv(BuildContext context, double value) =>
      EdgeInsets.symmetric(vertical: value.appSize(context));

  static EdgeInsets combined(
    BuildContext context, {
    required double horizontal,
    required double vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal.appSize(context),
      vertical: vertical.appSize(context),
    );
  }

  static EdgeInsets custom(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left.appSize(context),
      top: top.appSize(context),
      right: right.appSize(context),
      bottom: bottom.appSize(context),
    );
  }
}

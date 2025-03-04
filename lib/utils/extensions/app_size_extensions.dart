import 'package:flutter/material.dart';
import 'package:jinee_ims/utils/screen_utils/app_screen_utils.dart';

extension AppSizeExtension on num {
  double screenHeight(BuildContext context) =>
      AppScreenUtils.height(context) * this;
  double screenWidth(BuildContext context) =>
      AppScreenUtils.width(context) * this;
  double appSize(BuildContext context) =>
      AppScreenUtils.scaleValue(context, toDouble());
}

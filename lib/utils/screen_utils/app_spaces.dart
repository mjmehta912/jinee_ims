import 'package:flutter/material.dart';
import 'package:jinee_ims/utils/extensions/app_size_extensions.dart';

class AppSpaces {
  static SizedBox shrink = const SizedBox.shrink();

  //! Horizontal Spacings
  static SizedBox h(BuildContext context, double width) => SizedBox(
        width: width.appSize(context),
      );

  //! Vertical Spacings
  static SizedBox v(BuildContext context, double height) => SizedBox(
        height: height.appSize(context),
      );
}

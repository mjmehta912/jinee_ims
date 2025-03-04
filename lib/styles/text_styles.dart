import 'package:flutter/material.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/fonts.dart';

class TextStyles {
  static TextStyle kLightNunito(
    BuildContext context, {
    double baseSize = FontSizes.k20,
    Color color = kColorTextPrimary,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return TextStyle(
      fontSize: FontSizes.scale(context, baseSize),
      fontWeight: fontWeight,
      color: color,
      fontFamily: Fonts.nunitoLight,
    );
  }

  static TextStyle kRegularNunito(
    BuildContext context, {
    double baseSize = FontSizes.k20,
    Color color = kColorTextPrimary,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: FontSizes.scale(context, baseSize),
      fontWeight: fontWeight,
      color: color,
      fontFamily: Fonts.nunitoRegular,
    );
  }

  static TextStyle kMediumNunito(
    BuildContext context, {
    double baseSize = FontSizes.k20,
    Color color = kColorTextPrimary,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: FontSizes.scale(context, baseSize),
      fontWeight: fontWeight,
      color: color,
      fontFamily: Fonts.nunitoMedium,
    );
  }

  static TextStyle kSemiBoldNunito(
    BuildContext context, {
    double baseSize = FontSizes.k20,
    Color color = kColorTextPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: FontSizes.scale(context, baseSize),
      fontWeight: fontWeight,
      color: color,
      fontFamily: Fonts.nunitoSemiBold,
    );
  }

  static TextStyle kBoldNunito(
    BuildContext context, {
    double baseSize = FontSizes.k20,
    Color color = kColorTextPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontSize: FontSizes.scale(context, baseSize),
      fontWeight: fontWeight,
      color: color,
      fontFamily: Fonts.nunitoBold,
    );
  }
}

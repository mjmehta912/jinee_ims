import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.enabled,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.fillColor,
    this.suffixIcon,
    this.isObscure = false,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.fontSize,
    this.fontWeight,
    this.maxWidth,
  });

  final TextEditingController controller;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool? isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? 400,
        ),
        child: TextFormField(
          controller: controller,
          cursorColor: kColorTextPrimary,
          cursorHeight: 22,
          inputFormatters: inputFormatters,
          enabled: enabled ?? true,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          style: TextStyles.kMediumNunito(
            context,
            baseSize: fontSize ?? FontSizes.k16,
            color: kColorTextPrimary,
          ).copyWith(
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          obscureText: isObscure!,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.kLightNunito(
              context,
              baseSize: FontSizes.k14,
              color: kColorGrey,
            ),
            errorStyle: TextStyles.kRegularNunito(
              context,
              baseSize: FontSizes.k14,
              color: kColorRed,
            ),
            border: outlineInputBorder(
              borderColor: kColorGrey,
              borderWidth: 1.5,
            ),
            focusedBorder: outlineInputBorder(
              borderColor: kColorPrimary,
              borderWidth: 2,
            ),
            enabledBorder: outlineInputBorder(
              borderColor: kColorGrey,
              borderWidth: 1.5,
            ),
            errorBorder: outlineInputBorder(
              borderColor: kColorRed,
              borderWidth: 1.5,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            filled: true,
            fillColor: fillColor ?? kColorBackground,
            suffixIcon: suffixIcon,
            suffixIconColor: kColorTextPrimary,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    required Color borderColor,
    required double borderWidth,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }
}

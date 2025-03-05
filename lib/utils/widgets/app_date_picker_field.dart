import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/constants/image_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';

class AppDatePickerTextFormField extends StatefulWidget {
  const AppDatePickerTextFormField({
    super.key,
    required this.dateController,
    required this.hintText,
    this.fillColor,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.fontSize,
    this.fontWeight,
    this.maxWidth,
  });

  final TextEditingController dateController;
  final String hintText;
  final Color? fillColor;
  final bool enabled;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? maxWidth;

  @override
  State<AppDatePickerTextFormField> createState() =>
      _AppDatePickerTextFormFieldState();
}

class _AppDatePickerTextFormFieldState
    extends State<AppDatePickerTextFormField> {
  static const String dateFormat = 'dd-MM-yyyy';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate =
        _parseDate(widget.dateController.text) ?? DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kColorSecondary,
            colorScheme: const ColorScheme.light(
              primary: kColorSecondary,
              onPrimary: kColorBackground,
              surface: kColorBackground,
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyles.kBoldNunito(
                context,
                baseSize: FontSizes.k16,
                color: kColorTextPrimary,
              ),
              bodyLarge: TextStyles.kRegularNunito(
                context,
                baseSize: FontSizes.k12,
                color: kColorTextPrimary,
              ),
              titleLarge: TextStyles.kMediumNunito(
                context,
                baseSize: FontSizes.k14,
                color: kColorTextPrimary,
              ),
              displayLarge: TextStyles.kRegularNunito(
                context,
                baseSize: FontSizes.k12,
                color: kColorTextPrimary,
              ),
              labelLarge: TextStyles.kRegularNunito(
                context,
                baseSize: FontSizes.k12,
                color: kColorTextPrimary,
              ),
            ),
            dialogBackgroundColor: kColorWhite,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        widget.dateController.text = DateFormat(dateFormat).format(pickedDate);
      });

      if (widget.onChanged != null) {
        widget.onChanged!(widget.dateController.text);
      }
    }
  }

  DateTime? _parseDate(String dateString) {
    try {
      return DateFormat(dateFormat).parseStrict(dateString);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.maxWidth ?? 400, // Fixed width
        ),
        child: TextFormField(
          controller: widget.dateController,
          cursorColor: kColorTextPrimary,
          cursorHeight: 20, // Fixed cursor height
          enabled: widget.enabled,
          validator: widget.validator,
          style: TextStyles.kMediumNunito(
            context,
            baseSize: widget.fontSize ?? FontSizes.k12, // Fixed font size
            color: kColorTextPrimary,
          ).copyWith(
            fontWeight: widget.fontWeight ?? FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyles.kLightNunito(
              context,
              baseSize: FontSizes.k10, // Fixed font size
              color: kColorGrey,
            ),
            errorStyle: TextStyles.kRegularNunito(
              context,
              baseSize: FontSizes.k10, // Fixed font size
              color: kColorRed,
            ),
            border: outlineInputBorder(
              borderColor: kColorLightGrey,
              borderWidth: 1,
            ),
            focusedBorder: outlineInputBorder(
              borderColor: kColorPrimary,
              borderWidth: 1.5,
            ),
            enabledBorder: outlineInputBorder(
              borderColor: kColorLightGrey,
              borderWidth: 1,
            ),
            errorBorder: outlineInputBorder(
              borderColor: kColorRed,
              borderWidth: 1,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            filled: true,
            fillColor: widget.fillColor ?? kColorBackground,
            suffixIcon: IconButton(
              onPressed: widget.enabled ? () => _selectDate(context) : null,
              icon: SvgPicture.asset(
                kIconFilter,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  kColorGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
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
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }
}

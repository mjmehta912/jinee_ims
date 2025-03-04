import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jinee_ims/constants/color_constants.dart';
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
              headlineLarge: _fixedTextStyle(),
              bodyLarge: _fixedTextStyle(),
              titleLarge: _fixedTextStyle(),
              displayLarge: _fixedTextStyle(),
              labelLarge: _fixedTextStyle(),
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

  TextStyle _fixedTextStyle() {
    return TextStyles.kRegularNunito(
      context,
      baseSize: FontSizes.k16, // Fixed font size
      color: kColorBlack,
    );
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
            baseSize: widget.fontSize ?? FontSizes.k16, // Fixed font size
            color: kColorTextPrimary,
          ).copyWith(
            fontWeight: widget.fontWeight ?? FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyles.kLightNunito(
              context,
              baseSize: FontSizes.k14, // Fixed font size
              color: kColorGrey,
            ),
            errorStyle: TextStyles.kRegularNunito(
              context,
              baseSize: FontSizes.k14, // Fixed font size
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, // Fixed padding
              vertical: 12, // Fixed padding
            ),
            filled: true,
            fillColor: widget.fillColor ?? kColorBackground,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.calendar_today_rounded,
                size: 20,
                color: kColorPrimary,
              ),
              onPressed: widget.enabled ? () => _selectDate(context) : null,
            ),
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

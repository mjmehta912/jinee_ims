import 'package:flutter/material.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.borderColor,
    required this.title,
    this.titleSize,
    this.titleColor,
    required this.onPressed,
    this.maxWidth,
  });

  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final double? maxWidth;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.maxWidth ?? 400, // Fixed width
        ),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: SizedBox(
            height: widget.buttonHeight ?? 50, // Fixed height
            width: widget.buttonWidth ?? double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Fixed padding
                backgroundColor: widget.buttonColor == null
                    ? kColorPrimary.withAlpha((0.8 * 255).toInt())
                    : widget.buttonColor!.withAlpha((0.8 * 255).toInt()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                    color: widget.borderColor ??
                        (widget.buttonColor ?? kColorPrimary),
                  ),
                ),
                elevation: isHovered ? 6 : 2,
              ),
              onPressed: widget.onPressed,
              child: Text(
                widget.title,
                style: TextStyles.kMediumNunito(
                  context,
                  baseSize:
                      widget.titleSize ?? FontSizes.k16, // Fixed font size
                  color: widget.titleColor ?? kColorWhite,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

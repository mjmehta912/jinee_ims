import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jinee_ims/constants/color_constants.dart';

class AppLoadingOverlay extends StatelessWidget {
  final bool isLoading;

  const AppLoadingOverlay({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: kColorBlackWithOpacity,
            ),
          ),
        ),
        Positioned.fill(
          child: ModalBarrier(
            color: Colors.transparent,
            dismissible: false,
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.width * 0.05,
            child: CircularProgressIndicator(
              color: kColorWhite,
              strokeWidth: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

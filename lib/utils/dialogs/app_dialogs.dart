import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';
import 'package:jinee_ims/utils/screen_utils/app_paddings.dart';
import 'package:jinee_ims/utils/screen_utils/app_spaces.dart';

void showErrorDialog(String title, String message) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: AppPaddings.p(Get.context!, 20),
        decoration: BoxDecoration(
          color: kColorBackground,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kColorBlackWithOpacity,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: kColorRed,
              size: 50,
            ),
            AppSpaces.v(
              Get.context!,
              10,
            ),
            Text(
              title,
              style: TextStyles.kSemiBoldNunito(
                Get.context!,
                baseSize: FontSizes.k20,
                color: kColorRed,
              ),
            ),
            AppSpaces.v(
              Get.context!,
              10,
            ),
            Text(
              message,
              style: TextStyles.kRegularNunito(
                Get.context!,
                baseSize: FontSizes.k16,
                color: kColorTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpaces.v(
              Get.context!,
              20,
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "OK",
                style: TextStyles.kBoldNunito(
                  Get.context!,
                  baseSize: FontSizes.k20,
                  color: kColorRed,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void showSuccessDialog(String title, String message) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: AppPaddings.p(Get.context!, 20),
        decoration: BoxDecoration(
          color: kColorBackground,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kColorBlackWithOpacity,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: kColorGreen,
              size: 50,
            ),
            AppSpaces.v(
              Get.context!,
              10,
            ),
            Text(
              title,
              style: TextStyles.kSemiBoldNunito(
                Get.context!,
                baseSize: FontSizes.k20,
                color: kColorGreen,
              ),
            ),
            AppSpaces.v(
              Get.context!,
              10,
            ),
            Text(
              message,
              style: TextStyles.kRegularNunito(
                Get.context!,
                baseSize: FontSizes.k16,
                color: kColorTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpaces.v(
              Get.context!,
              20,
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "OK",
                style: TextStyles.kBoldNunito(
                  Get.context!,
                  baseSize: FontSizes.k20,
                  color: kColorRed,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

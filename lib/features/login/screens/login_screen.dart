import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/features/home/screens/home_screen.dart';
import 'package:jinee_ims/features/login/controllers/login_controller.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';
import 'package:jinee_ims/utils/screen_utils/app_paddings.dart';
import 'package:jinee_ims/utils/screen_utils/app_spaces.dart';
import 'package:jinee_ims/utils/widgets/app_button.dart';
import 'package:jinee_ims/utils/widgets/app_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  final LoginController _controller = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: AppPaddings.p(context, 10),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: kColorBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kColorBlackWithOpacity,
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: kColorPrimary,
              ),
            ),
            child: Form(
              key: _controller.loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyles.kBoldNunito(
                      context,
                      baseSize: FontSizes.k24,
                      color: kColorPrimary,
                    ),
                  ),
                  Text(
                    "Please sign in to your account \nto continue.",
                    style: TextStyles.kRegularNunito(
                      context,
                      baseSize: FontSizes.k14,
                      color: kColorGrey,
                    ),
                  ),
                  AppSpaces.v(context, 30),
                  AppTextFormField(
                    controller: _controller.usernameController,
                    hintText: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  AppSpaces.v(context, 15),
                  Obx(
                    () => AppTextFormField(
                      controller: _controller.passwordController,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      isObscure: _controller.obscuredText.value,
                      suffixIcon: IconButton(
                        onPressed: _controller.togglePasswordVisibility,
                        icon: Icon(
                          _controller.obscuredText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 18,
                          color: kColorPrimary,
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.v(context, 30),
                  AppButton(
                    title: 'Login',
                    onPressed: () {
                      _controller.hasAttemptedLogin.value = true;
                      if (_controller.loginFormKey.currentState!.validate()) {
                        Get.offAll(
                          () => HomeScreen(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

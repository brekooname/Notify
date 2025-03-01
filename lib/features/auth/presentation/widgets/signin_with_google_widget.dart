import 'package:flutter/material.dart';
import 'package:notify/core/style/app_colors.dart';
import 'package:notify/core/style/app_text_style.dart';
import 'package:notify/features/auth/presentation/screens/view%20model/auth_view_model.dart';

class SignInWithGoogleWidget extends StatelessWidget {
  const SignInWithGoogleWidget({
    super.key,
    required this.controller,
  });

  final AuthViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.signinWithGoogleHeight,
      width: controller.widgetsWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(controller.borderRadius),
        border:
            Border.all(color: AppColors.black, width: controller.borderWidth),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.signinWithGoogleString,
              style: AppTextStyle.mediumBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: controller.smallpaddingSpace,
            ),
            SizedBox(
              width: controller.googleIconSize,
              height: controller.googleIconSize,
              child: Image.asset(controller.googleIcon),
            ),
          ],
        ),
      ),
    );
  }
}
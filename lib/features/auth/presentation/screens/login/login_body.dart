import 'package:flutter/material.dart';
import 'package:notify/core/style/app_text_style.dart';
import 'package:notify/features/auth/presentation/screens/view%20model/login%20view%20model/login_view_modle.dart';
import 'package:notify/features/auth/presentation/widgets/signin_with_google_widget.dart';
import 'package:notify/features/auth/presentation/widgets/string_line_for_navigator_auth.dart';
import 'package:notify/shared/presentaion/widget/custom_button.dart';
import 'package:notify/shared/presentaion/widget/custom_text_form_field.dart';
import 'package:notify/features/auth/presentation/widgets/password_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  LoginViewModle controller = LoginViewModle();
  @override
  void initState() {
    super.initState();
    controller.emailController = TextEditingController();
    controller.passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.emailController.dispose();
    controller.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: controller.paddingSpace,
      ),
      Text(
        controller.notifyString,
        style: AppTextStyle.xxxLargeBlack.copyWith(
          letterSpacing: controller.letterSpace,
        ),
      ),
      SizedBox(
        height: controller.paddingSpace,
      ),
      SizedBox(
        width: controller.imageSize,
        height: controller.imageSize,
        child: Image.asset(controller.notify),
      ),
      SizedBox(
        height: 2 * controller.smallpaddingSpace,
      ),
      // headLine
      SizedBox(
        width: controller.widgetsWidth,
        child: Text(
          controller.headLine,
          style: AppTextStyle.largeBlack,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 2 * controller.paddingSpace,
      ),
      Form(
        key: controller.formKey,
        child: Column(
          children: [
            // email textFormField
            SizedBox(
              width: controller.widgetsWidth,
              child: CustomTextFormField(
                textController: controller.emailController,
                validator: (String? value) =>
                    controller.emailValidator(value, context),
                hintText: controller.emailString,
                labelText: controller.emailLabel,
                suffixIcon: controller.emailIcon,
              ),
            ),
            SizedBox(
              height: controller.paddingSpace,
            ),
            // password textFormField
            SizedBox(
              width: controller.widgetsWidth,
              child: PasswordWidget(
                  textController: controller.passwordController,
                  validator: (String? value) =>
                      controller.passwordValidator(value, context),
                  controller: controller),
            ),
          ],
        ),
      ),

      SizedBox(
        height: controller.largepaddingSpace,
      ),
      // login button
      SizedBox(
          width: controller.widgetsWidth,
          child: ButtonWidget(
              text: controller.loginString, onPressed: controller.login)),
      SizedBox(
        height: controller.paddingSpace,
      ),
      // Sign in with google
      SignInWithGoogleWidget(controller: controller),
      SizedBox(
        height: controller.paddingSpace,
      ),
      // don't have account
      StringLineForSwituchAuth(controller: controller),
    ])));
  }
}

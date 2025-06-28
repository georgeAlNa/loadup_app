import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/constant/colors.dart';
import 'package:loadup_app/core/constant/text_styles.dart';
import 'package:loadup_app/core/helpers/spacing.dart';
import 'package:loadup_app/core/public_widgets/button_widget.dart';

import '../widgets/login_footer.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          height: double.infinity,
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginHeader(),
                  verticalSpace(24),
                  LoginForm(
                    phoneOrEmailController: phoneOrEmailController,
                    passwordController: passwordController,
                    isPasswordVisible: isPasswordVisible,
                    onPasswordVisibilityChanged: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  verticalSpace(24),
                  ButtonWidget(
                    title: AppStrings.login,
                    onTap: () {
                      if (!formKey.currentState!.validate()) {}
                    },
                    textStyle: AppTextStyles.font14WhiteBold,
                  ),
                  LoginFooter(role: widget.role),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

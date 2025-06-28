import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/helpers/extentions.dart';
import 'package:loadup_app/core/routing/routes.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/helpers/spacing.dart';

class LoginFooter extends StatelessWidget {
  final String role;
  const LoginFooter({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        const Divider(),
        verticalSpace(12),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "By ",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
            children: [
              TextSpan(
                text: "logging in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ", you agree to our "),
              TextSpan(
                text: "Terms & Conditions ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "and "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        RichText(
          text: TextSpan(
            text: AppStrings.dontHaveAccount,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
            children: [
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    context.pushNamed(Routes.signupScreen, arguments: role);
                  },
                  child: Text(
                    AppStrings.signUp,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

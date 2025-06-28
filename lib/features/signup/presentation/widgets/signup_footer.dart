import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/helpers/extentions.dart';

import '../../../../core/constant/colors.dart';

import '../../../../core/routing/routes.dart';

class SignupFooter extends StatelessWidget {
  final String role;
  const SignupFooter({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.alreadyHaveAccount,
              style: TextStyle(fontSize: 13),
            ),
            GestureDetector(
              onTap: () {
                context.pushReplacementNamed(
                  Routes.loginScreen,
                  arguments: role,
                );
              },
              child: Text(
                AppStrings.login,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

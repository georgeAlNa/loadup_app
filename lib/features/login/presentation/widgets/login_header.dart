import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/constant/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(100),
        Image.asset(AppImages.logoImage, height: 150.h),
        verticalSpace(30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.welcomeBack,
            style: AppTextStyles.font16OrangeBold,
          ),
        ),
        verticalSpace(8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.welcomeMessage,
            style: AppTextStyles.font14SecondaryTextRegular,
          ),
        ),
      ],
    );
  }
}

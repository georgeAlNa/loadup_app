import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/constant/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logoImage, height: 100.h),
        verticalSpace(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.createAccount,
            style: AppTextStyles.font16OrangeBold.copyWith(fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}

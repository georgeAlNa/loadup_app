import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/constant/colors.dart';
import 'package:loadup_app/core/constant/images.dart';
import 'package:loadup_app/core/constant/text_styles.dart';
import 'package:loadup_app/core/helpers/extentions.dart';
import 'package:loadup_app/core/public_widgets/button_widget.dart';
import 'package:loadup_app/core/routing/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logoImage, height: 500.h, width: 320.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  width: 155.w,
                  height: 44.w,
                  title: AppStrings.driver,
                  onTap: () {
                    context.pushReplacementNamed(
                      Routes.loginScreen,
                      arguments: AppStrings.driver,
                    );
                  },
                  textStyle: AppTextStyles.font14WhiteBold,
                  backgroundColor: AppColors.primaryColor,
                ),
                ButtonWidget(
                  width: 155.w,
                  height: 44.w,
                  title: AppStrings.delivery,
                  onTap: () {
                    context.pushReplacementNamed(
                      Routes.loginScreen,
                      arguments: AppStrings.delivery,
                    );
                  },
                  textStyle: AppTextStyles.font14WhiteBold,
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

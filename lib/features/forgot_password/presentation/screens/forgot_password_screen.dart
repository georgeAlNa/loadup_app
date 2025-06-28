import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/constant/colors.dart';
import 'package:loadup_app/core/constant/images.dart';
import 'package:loadup_app/core/constant/text_styles.dart';
import 'package:loadup_app/core/helpers/spacing.dart';
import 'package:loadup_app/core/public_widgets/button_widget.dart';
import 'package:loadup_app/core/public_widgets/text_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneOrEmailController =
        TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                verticalSpace(100),
                Image.asset(AppImages.logoImage, height: 120.h),
                verticalSpace(40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.forgotPassword,
                    style: AppTextStyles.font16OrangeBold.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                verticalSpace(8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "At our app, we take the security of your\ninformation seriously.",
                    style: AppTextStyles.font14SecondaryTextRegular.copyWith(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                verticalSpace(24),
                TextFieldWidget(
                  controller: phoneOrEmailController,
                  hintText:
                      '${AppStrings.forgetPassword} / ${AppStrings.email}',
                  labelText: '${AppStrings.phoneNumber} / ${AppStrings.email}',
                  obscureText: false,
                ),
                verticalSpace(30),
                ButtonWidget(
                  title: AppStrings.resendPassword,
                  onTap: () {
                    if (!formKey.currentState!.validate()) {}
                  },
                  textStyle: AppTextStyles.font14WhiteBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

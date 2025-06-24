import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';
import 'package:loadup_app/core/constant/colors.dart';
import 'package:loadup_app/core/constant/images.dart';
import 'package:loadup_app/core/constant/text_styles.dart';
import 'package:loadup_app/core/helpers/spacing.dart';
import 'package:loadup_app/core/public_widgets/button_widget.dart';
import 'package:loadup_app/core/public_widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneOrEmailController =
        TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logoImage, height: 161.h, width: 161.w),
              Text(
                AppStrings.welcomeBack,
                style: AppTextStyles.font16OrangeBold,
              ),
              verticalSpace(14),
              Text(
                AppStrings.welcomeMessage,
                style: AppTextStyles.font14SecondaryTextRegular,
              ),
              verticalSpace(20),
              TextFieldWidget(
                controller: phoneOrEmailController,
                hintText: '${AppStrings.phoneNumber} / ${AppStrings.email}',
                labelText: '${AppStrings.phoneNumber} / ${AppStrings.email}',
                obscureText: false,
              ),
              verticalSpace(20),
              TextFieldWidget(
                controller: password,
                hintText: AppStrings.password,
                labelText: AppStrings.password,
                obscureText: false,
              ),
              verticalSpace(15),
              Text(
                AppStrings.forgotPassword,
                style: AppTextStyles.font12SecondaryTextSemibold,
              ),
              verticalSpace(20),
              ButtonWidget(
                title: AppStrings.login,
                onTap: () {},
                textStyle: AppTextStyles.font14WhiteBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

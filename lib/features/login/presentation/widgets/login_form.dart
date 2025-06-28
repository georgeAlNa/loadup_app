import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loadup_app/core/helpers/extentions.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/text_field_widget.dart';
import '../../../../core/routing/routes.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneOrEmailController;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityChanged;

  const LoginForm({
    super.key,
    required this.phoneOrEmailController,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: phoneOrEmailController,
          hintText: '${AppStrings.phoneNumber} / ${AppStrings.email}',
          labelText: '${AppStrings.phoneNumber} / ${AppStrings.email}',
          obscureText: false,
        ),
        verticalSpace(20),
        TextFieldWidget(
          controller: passwordController,
          hintText: AppStrings.password,
          labelText: AppStrings.password,
          obscureText: !isPasswordVisible,
          suffixIcon:
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          onPressedSuffixIcon: onPasswordVisibilityChanged,
          suffixIconColor: AppColors.lightGrayishTaupeColor,
        ),
        verticalSpace(12),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              context.pushNamed(Routes.forgotPasswordScreen);
            },
            child: Text(
              AppStrings.forgotPassword,
              style: AppTextStyles.font12SecondaryTextSemibold,
            ),
          ),
        ),
      ],
    );
  }
}

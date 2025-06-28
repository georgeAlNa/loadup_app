import 'package:flutter/material.dart';
import 'package:loadup_app/core/constant/app_strings.dart';

import '../../../../core/constant/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/text_field_widget.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController cityController;
  final String selectedJob;
  final void Function(String) onJobChanged;

  const SignupForm({
    super.key,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.cityController,
    required this.selectedJob,
    required this.onJobChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: fullNameController,
          hintText: AppStrings.fullName,
          labelText: AppStrings.fullName,
          obscureText: false,
        ),
        verticalSpace(14),
        TextFieldWidget(
          controller: phoneController,
          hintText: AppStrings.phoneNumber,
          labelText: AppStrings.phoneNumber,
          obscureText: false,
        ),
        verticalSpace(14),
        TextFieldWidget(
          controller: emailController,
          hintText: AppStrings.email,
          labelText: AppStrings.email,
          obscureText: false,
        ),
        verticalSpace(14),
        TextFieldWidget(
          controller: passwordController,
          hintText: AppStrings.password,
          labelText: AppStrings.password,
          obscureText: true,
        ),
        verticalSpace(14),
        TextFieldWidget(
          controller: confirmPasswordController,
          hintText: AppStrings.confirmPassword,
          labelText: AppStrings.confirmPassword,
          obscureText: true,
        ),
        verticalSpace(14),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.yourJob,
            style: AppTextStyles.font14SecondaryTextRegular,
          ),
        ),
        Row(
          children: [
            Radio<String>(
              value: AppStrings.driver,
              groupValue: selectedJob,
              onChanged: (value) => onJobChanged(value!),
            ),
            const Text(AppStrings.driver),
            Radio<String>(
              value: AppStrings.delivery,
              groupValue: selectedJob,
              onChanged: (value) => onJobChanged(value!),
            ),
            const Text(AppStrings.delivery),
          ],
        ),
        verticalSpace(10),
        TextFieldWidget(
          controller: cityController,
          hintText: AppStrings.yourCity,
          labelText: AppStrings.yourCity,
          obscureText: false,
          suffixIcon: Icons.keyboard_arrow_down,
        ),
      ],
    );
  }
}

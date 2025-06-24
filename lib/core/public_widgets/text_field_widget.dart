import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';
import '../constant/font_weight_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final IconData? suffixIcon;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onPressedSuffixIcon;
  final void Function()? onPressedPrefixIcon;
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.suffixIcon,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    this.keyboardType,
    this.onPressedSuffixIcon,
    this.onPressedPrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryColor,
      validator: (value) => value!.isEmpty ? 'Can\'t Be Empty' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundForTextField,
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onPressedSuffixIcon,
          color: suffixIconColor,
        ),
        prefixIcon: IconButton(
          icon: Icon(prefixIcon),
          onPressed: onPressedPrefixIcon,
          color: prefixIconColor,
        ),
        iconColor: AppColors.whiteForTextFieldBorderColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteForTextFieldBorderColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.whiteForTextFieldTextColor,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.whiteForTextFieldTextColor,
          fontWeight: AppFontWeightHelper.medium,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

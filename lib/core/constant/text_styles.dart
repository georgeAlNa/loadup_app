import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font14WhiteBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle font16OrangeBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle font14SecondaryTextRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.secondartTextColor,
  );
  static TextStyle font12SecondaryTextSemibold = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.secondartTextColor,
  );
}

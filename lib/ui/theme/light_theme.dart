// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:to_do_app/common/colors.dart';

import '../base/base_theme.dart';
import 'theme_colors.dart';

final class LightTheme extends BaseTheme {
  const LightTheme();

  @override
  ThemeColors get colors {
    return ThemeColors(
      primary: AppColors.orange100,
      primaryDark: AppColors.orange200,
      primaryHover: AppColors.orange300,
      onPrimary: AppColors.white,
      background: AppColors.white,
      container: AppColors.gray100,
      textMain: AppColors.black200,
      textSecondary: AppColors.black100,
      sheetIndicator: AppColors.gray200,
      containerHover: AppColors.gray200,
      hint: AppColors.gray300,
      backgroundDisabled: AppColors.gray100.withOpacity(0.42),
      textDisabled: AppColors.black200.withOpacity(0.42),
      hintDisabled: AppColors.gray300.withOpacity(0.42),
      textFieldShadow: AppColors.pink,
      mainGradient: const LinearGradient(
        colors: [
          Color(0xFFFFDB9E),
          Color(0xFFF9FFA0),
          Color(0xFFA0FFD0),
          Color(0xFFE6A0FF),
        ],
      ),
      primaryGradient: const LinearGradient(
        colors: [
          Color(0xFFFEF5E6),
          Color(0xFFFDFFE1),
          Color(0xFFE1FFF0),
          Color(0xFFF7E1FF),
        ],
        stops: [0.0, 0.3, 0.65, 0.97],
      ),
      secondaryGradient: const LinearGradient(
        colors: [
          Color(0xFFF6E1FF),
          Color(0xFFE1FEF1),
          Color(0xFFFDFFE1),
          Color(0xFFFDEBCD),
        ],
        stops: [0.03, 0.35, 0.7, 1],
      ),
      thirdGradient: const LinearGradient(
        colors: [
          Color(0xFFE1FEF0),
          Color(0xFFFEF6E5),
          Color(0xFFFCFEE1),
          Color(0xFFF7E0FF),
        ],
        stops: [0.14, 0.39, 0.68, 1],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:to_do_app/common/colors.dart';

import '../base/base_theme.dart';
import 'theme_colors.dart';

final class DarkTheme extends BaseTheme {
  const DarkTheme();

  @override
  ThemeColors get colors {
    return ThemeColors(
      primary: AppColors.orange100,
      primaryDark: AppColors.orange200,
      primaryHover: AppColors.orange300,
      onPrimary: AppColors.white,
      background: const Color(0xFF121212), // Tünd arxa fon
      container: const Color(0xFF1E1E1E), // Tünd konteyner
      textMain: AppColors.white,
      textSecondary: AppColors.gray100,
      sheetIndicator: AppColors.gray200,
      containerHover: const Color(0xFF2C2C2C),
      hint: AppColors.gray300,
      backgroundDisabled: const Color(0xFF1E1E1E).withOpacity(0.42),
      textDisabled: AppColors.white.withOpacity(0.42),
      hintDisabled: AppColors.gray300.withOpacity(0.42),
      textFieldShadow: AppColors.pink,
      mainGradient: const LinearGradient(
        colors: [
          Color(0xFF3D3D3D),
          Color(0xFF2C2C2C),
          Color(0xFF1E1E1E),
          Color(0xFF2C2C2C),
        ],
      ),
      primaryGradient: const LinearGradient(
        colors: [
          Color(0xFF2C2C2C),
          Color(0xFF1E1E1E),
          Color(0xFF2C2C2C),
          Color(0xFF3D3D3D),
        ],
        stops: [0.0, 0.3, 0.65, 0.97],
      ),
      secondaryGradient: const LinearGradient(
        colors: [
          Color(0xFF3D3D3D),
          Color(0xFF2C2C2C),
          Color(0xFF1E1E1E),
          Color(0xFF2C2C2C),
        ],
        stops: [0.03, 0.35, 0.7, 1],
      ),
      thirdGradient: const LinearGradient(
        colors: [
          Color(0xFF2C2C2C),
          Color(0xFF1E1E1E),
          Color(0xFF2C2C2C),
          Color(0xFF3D3D3D),
        ],
        stops: [0.14, 0.39, 0.68, 1],
      ),
    );
  }
}

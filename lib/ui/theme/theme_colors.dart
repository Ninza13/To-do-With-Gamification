import 'package:flutter/material.dart';

final class ThemeColors extends ThemeExtension<ThemeColors> {
  ThemeColors({
    required this.primary,
    required this.primaryDark,
    required this.primaryHover,
    required this.onPrimary,
    required this.background,
    required this.backgroundDisabled,
    required this.container,
    required this.containerHover,
    required this.textMain,
    required this.textSecondary,
    required this.textDisabled,
    required this.sheetIndicator,
    required this.hint,
    required this.hintDisabled,
    required this.textFieldShadow,
    required this.mainGradient,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.thirdGradient,
  });

  final Color primary;
  final Color primaryDark;
  final Color primaryHover;
  final Color onPrimary;

  final Color background;
  final Color backgroundDisabled;
  final Color container;
  final Color containerHover;

  final Color textMain;
  final Color textSecondary;
  final Color textDisabled;
  final Color sheetIndicator;

  final Color hint;
  final Color hintDisabled;

  final Color textFieldShadow;

  final LinearGradient mainGradient;
  final LinearGradient primaryGradient;
  final LinearGradient secondaryGradient;
  final LinearGradient thirdGradient;

  static ThemeColors get light => ThemeColors(
    primary: const Color(0xFF6200EE),
    primaryDark: const Color(0xFF3700B3),
    primaryHover: const Color(0xFF03DAC6),
    onPrimary: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF),
    backgroundDisabled: const Color(0xFFE0E0E0),
    container: const Color(0xFFF5F5F5),
    containerHover: const Color(0xFFEEEEEE),
    textMain: const Color(0xFF000000),
    textSecondary: const Color(0xFF757575),
    textDisabled: const Color(0xFF9E9E9E),
    sheetIndicator: const Color(0xFFE0E0E0),
    hint: const Color(0xFF9E9E9E),
    hintDisabled: const Color(0xFFBDBDBD),
    textFieldShadow: const Color(0x1A000000),
    mainGradient: const LinearGradient(
      colors: [Color(0xFF6200EE), Color(0xFF03DAC6)],
    ),
    primaryGradient: const LinearGradient(
      colors: [Color(0xFF6200EE), Color(0xFF3700B3)],
    ),
    secondaryGradient: const LinearGradient(
      colors: [Color(0xFF03DAC6), Color(0xFF018786)],
    ),
    thirdGradient: const LinearGradient(
      colors: [Color(0xFFCF6679), Color(0xFFB00020)],
    ),
  );

  static ThemeColors get dark => ThemeColors(
    primary: const Color(0xFFBB86FC),
    primaryDark: const Color(0xFF3700B3),
    primaryHover: const Color(0xFF03DAC6),
    onPrimary: const Color(0xFF000000),
    background: const Color(0xFF121212),
    backgroundDisabled: const Color(0xFF1E1E1E),
    container: const Color(0xFF1E1E1E),
    containerHover: const Color(0xFF2C2C2C),
    textMain: const Color(0xFFFFFFFF),
    textSecondary: const Color(0xFFB3B3B3),
    textDisabled: const Color(0xFF666666),
    sheetIndicator: const Color(0xFF2C2C2C),
    hint: const Color(0xFF666666),
    hintDisabled: const Color(0xFF4D4D4D),
    textFieldShadow: const Color(0x1AFFFFFF),
    mainGradient: const LinearGradient(
      colors: [Color(0xFFBB86FC), Color(0xFF03DAC6)],
    ),
    primaryGradient: const LinearGradient(
      colors: [Color(0xFFBB86FC), Color(0xFF3700B3)],
    ),
    secondaryGradient: const LinearGradient(
      colors: [Color(0xFF03DAC6), Color(0xFF018786)],
    ),
    thirdGradient: const LinearGradient(
      colors: [Color(0xFFCF6679), Color(0xFFB00020)],
    ),
  );

  static ThemeColors of(BuildContext context) {
    return Theme.of(context).extension<ThemeColors>()!;
  }

  @override
  ThemeColors copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryHover,
    Color? onPrimary,
    Color? background,
    Color? backgroundDisabled,
    Color? container,
    Color? containerHover,
    Color? textMain,
    Color? textSecondary,
    Color? textDisabled,
    Color? sheetIndicator,
    Color? hint,
    Color? hintDisabled,
    Color? textFieldShadow,
    LinearGradient? mainGradient,
    LinearGradient? primaryGradient,
    LinearGradient? secondaryGradient,
    LinearGradient? thirdGradient,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryHover: primaryHover ?? this.primaryHover,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      container: container ?? this.container,
      containerHover: containerHover ?? this.containerHover,
      textMain: textMain ?? this.textMain,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      sheetIndicator: sheetIndicator ?? this.sheetIndicator,
      hint: hint ?? this.hint,
      hintDisabled: hintDisabled ?? this.hintDisabled,
      textFieldShadow: textFieldShadow ?? this.textFieldShadow,
      mainGradient: mainGradient ?? this.mainGradient,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      thirdGradient: thirdGradient ?? this.thirdGradient,
    );
  }

  @override
  ThemeColors lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDisabled:
          Color.lerp(backgroundDisabled, other.backgroundDisabled, t)!,
      container: Color.lerp(container, other.container, t)!,
      containerHover: Color.lerp(containerHover, other.containerHover, t)!,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      sheetIndicator: Color.lerp(sheetIndicator, other.sheetIndicator, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      hintDisabled: Color.lerp(hintDisabled, other.hintDisabled, t)!,
      textFieldShadow: Color.lerp(textFieldShadow, other.textFieldShadow, t)!,
      mainGradient: LinearGradient.lerp(mainGradient, other.mainGradient, t)!,
      primaryGradient:
          LinearGradient.lerp(primaryGradient, other.primaryGradient, t)!,
      secondaryGradient:
          LinearGradient.lerp(secondaryGradient, other.secondaryGradient, t)!,
      thirdGradient:
          LinearGradient.lerp(thirdGradient, other.thirdGradient, t)!,
    );
  }
}

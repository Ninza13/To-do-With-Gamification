import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colors = ThemeColors.light;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.background,
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textMain),
        titleTextStyle: TextStyle(
          color: colors.textMain,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
        color: colors.container,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return colors.primary;
          }
          return colors.textDisabled;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colors = ThemeColors.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.background,
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textMain),
        titleTextStyle: TextStyle(
          color: colors.textMain,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
        color: colors.container,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return colors.primary;
          }
          return colors.textDisabled;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

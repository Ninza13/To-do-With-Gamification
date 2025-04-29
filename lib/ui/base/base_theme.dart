import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme/dark_theme.dart';

import '../theme/light_theme.dart';
import '../theme/style_manager.dart';
import '../theme/theme_colors.dart';

abstract class BaseTheme {
  const BaseTheme();

  ThemeColors get colors;

  static ThemeData data([String? key]) {
    final brightness =
        key == 'dark'
            ? Brightness.dark
            : (PlatformDispatcher.instance.platformBrightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light);

    return switch (brightness) {
      Brightness.dark => const DarkTheme()._data,
      Brightness.light => const LightTheme()._data,
    };
  }

  ThemeData get _data {
    final isDark = colors == const DarkTheme().colors;

    StyleManager.setDefaultStyle(
      style: TextStyle(
        color: colors.textMain,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: colors.background,

      // Bottom Navigation Bar üçün
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textSecondary,
      ),

      // Text rəngləri üçün
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: colors.textMain),
        bodyMedium: TextStyle(color: colors.textMain),
        bodySmall: TextStyle(color: colors.textSecondary),
        titleLarge: TextStyle(color: colors.textMain),
        titleMedium: TextStyle(color: colors.textMain),
        titleSmall: TextStyle(color: colors.textMain),
      ),

      // AppBar üçün
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textMain,
      ),

      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
      ),
      fontFamily: 'Poppins',
      extensions: [colors],
      splashColor: Colors.transparent,
      dividerColor: colors.hint,
      highlightColor: Colors.transparent,
      textSelectionTheme: TextSelectionThemeData(
        // ignore: deprecated_member_use
        selectionColor: colors.primary.withOpacity(0.5),
        cursorColor: colors.primary,
        selectionHandleColor: colors.primary,
      ),
      colorSchemeSeed: colors.primary,
    );
  }
}

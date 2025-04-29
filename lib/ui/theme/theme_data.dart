import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

class AppTheme {
  static ThemeData get light =>
      ThemeData(useMaterial3: true, extensions: [ThemeColors.light]);

  static ThemeData get dark =>
      ThemeData(useMaterial3: true, extensions: [ThemeColors.dark]);
}

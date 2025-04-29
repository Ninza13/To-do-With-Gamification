import 'package:flutter/widgets.dart';

sealed class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color shadow = Color(0x287C7C7C);

  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00BE3D);

  static const Color pink = Color(0x28FF80DB);

  static const Color orange100 = Color(0xFFFF784B);
  static const Color orange200 = Color(0xFFFF531A);
  static const Color orange300 = Color(0xFFFF6936);

  static const Color black100 = Color(0xFF1F1F1F);
  static const Color black200 = Color(0xFF151515);

  static const Color gray100 = Color(0xFFF6F6F6);
  static const Color gray200 = Color(0xFFE6E6E6);
  static const Color gray300 = Color(0xFF8D8D8D);

  // Gold theme colors
  static const Color goldPrimary = Color(0xFFFFD700);
  static const Color goldSecondary = Color(0xFFFCC201);
  static const Color goldDark = Color(0xFF382F00);

  // Chart theme
  static const Color chartLine = Color(0xFFFFD700);
  static const Color chartBackground = Color(0xFF1A1A1A);
  static const Color chartGrid = Color(0xFF2A2A2A);

  // Gradient colors
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFFCC201), Color(0xFFFFB300)],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A1A1A), Color(0xFF2A2A2A)],
  );
}

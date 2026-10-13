import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF111111);
  static const white = Colors.white;
  static const background = Color(0xFFF7F7F7);
  static const border = Color(0xFFD9D9D9);
  static const muted = Color(0xFF6B6B6B);
  static const hint = Color(0xFF9A9A9A);
  static const placeholder = Color(0xFFEFEFEF);
  static const danger = Color(0xFFE5484D);
}

class AppSpacing {
  static const double xs = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double xl = 32;
}

class AppText {
  static const mono = TextStyle(
    fontFamily: 'monospace',
    fontFamilyFallback: ['Courier New', 'Courier'],
  );
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
        ).copyWith(
          primary: AppColors.black,
          surface: AppColors.white,
        ),
        dividerColor: AppColors.border,
        checkboxTheme: CheckboxThemeData(
          shape: const RoundedRectangleBorder(),
          side: const BorderSide(color: AppColors.black, width: 1),
          fillColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
                ? AppColors.black
                : Colors.transparent,
          ),
        ),
      );
}

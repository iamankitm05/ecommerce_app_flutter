import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepPurple,
        foregroundColor: AppColors.white,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.deepPurple,
        surface: AppColors.white,
        onSurface: AppColors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepPurple,
        foregroundColor: AppColors.white,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.deepPurple,
        surface: AppColors.black,
        onSurface: AppColors.white,
      ),
    );
  }
}

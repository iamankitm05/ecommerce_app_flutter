import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppThemeProvider {
  static ThemeData getTheme(Brightness brightness) {
    return ThemeData(
      scaffoldBackgroundColor: brightness == Brightness.light
          ? AppColors.white
          : AppColors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.deepPurple,
        foregroundColor: AppColors.white,
      ),
      primaryColor: AppColors.deepPurple,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: AppColors.deepPurple,
      ),
    );
  }
}

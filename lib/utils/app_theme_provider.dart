import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppThemeProvider {
  static ThemeData getTheme(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: AppColors.deepPurple,
      ),
    );
  }
}

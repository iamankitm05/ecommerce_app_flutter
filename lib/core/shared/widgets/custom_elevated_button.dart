import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 8,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}

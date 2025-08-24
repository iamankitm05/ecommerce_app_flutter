import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.labelText,
    this.readOnly = false,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

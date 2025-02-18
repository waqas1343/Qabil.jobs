import 'package:flutter/material.dart';

class AppTextFields {
  static Widget customTextField({
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Icon? prefixIcon,
    Widget? suffixIcon,
    Color? fillColor,
    Color? borderColor,
    double borderRadius = 1.0,
    EdgeInsetsGeometry? contentPadding,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: const Color.fromARGB(255, 24, 206, 166),
          fontSize: 14,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
      ),
      validator: validator,
    );
  }
}

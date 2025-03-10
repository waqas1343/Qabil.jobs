import 'package:flutter/material.dart';

class AppTextFields {
  static Widget customTextField({
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? fillColor,
    Color? borderColor,
    double borderRadius = 8.0, // Updated default border radius
    EdgeInsetsGeometry? contentPadding,
    FormFieldValidator<String>? validator,
    bool readOnly = false, // Default value set to false
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
  }) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textStyle ?? const TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        errorStyle: errorStyle ??
            const TextStyle(
              color: Colors.red, // Default error color red
              fontSize: 10,
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: readOnly ? (borderColor ?? Colors.black) : Colors.blue,
              width: 2),
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

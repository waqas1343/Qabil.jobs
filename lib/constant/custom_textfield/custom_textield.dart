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
    bool? readOnly,
    final double hintTextSize = 12,
  }) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: const Color.fromARGB(255, 24, 206, 166),
          fontSize: 10,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        hintStyle: TextStyle(color: Colors.grey, fontSize: hintTextSize),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: readOnly ?? false
        ? BorderSide(color: borderColor ?? Colors.black, width: 1)
              : BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: readOnly ?? false
              ? BorderSide(color: borderColor ?? Colors.black, width: 1)
              : BorderSide(color: borderColor ?? Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: readOnly ?? false
              ? BorderSide(color: borderColor ?? Colors.black, width: 1)
              : BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
      ),
      validator: validator,
    );
  }
}

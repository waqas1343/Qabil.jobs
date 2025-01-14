import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextStyle? style;
  final VoidCallback? onTap; // Add onTap callback to handle tap events

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ??
            TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
      ),
    );
  }
}

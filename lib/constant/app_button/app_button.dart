import 'package:flutter/material.dart';
import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Color color;
  final Color? splashColor;
  final VoidCallback ontap;
  final EdgeInsets padding;

  const CustomButton({
    super.key,
    required this.btnText,
    required this.color,
    this.splashColor,
    required this.ontap,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9.8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Colors.grey,
            borderRadius: BorderRadius.circular(9.8),
            onTap: ontap,
            child: Center(
              child: CustomText(
                text: btnText,
                style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ) ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.color = AppColors.appBackground,
        this.fontWeight = FontWeight.bold,

      });

  final String title;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.textColor,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,

        ),
      ),

    );
  }
}

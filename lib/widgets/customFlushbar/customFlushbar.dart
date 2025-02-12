import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../constant/app_colours/appcolors.dart';

class CustomFlushBar {
  static Future<dynamic> customFlushBar(
      BuildContext context, String title, IconData icon, Color iconColor) {
    return Flushbar(
      messageText: Text(
        title,
        style: TextStyle(fontSize: 20, color: AppColors.appBackground),
      ),
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(30),
      backgroundColor: AppColors.blackTextClr,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      titleColor: AppColors.appBackground,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(9.8),
      duration: Duration(seconds: 3),
      // flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);

  }
}
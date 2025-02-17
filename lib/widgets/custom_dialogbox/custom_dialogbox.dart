import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_button/app_button.dart';

import '../../constant/app_colours/appcolors.dart';

class CustomDialogbox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final String hintname;
  final String titlename;

  const CustomDialogbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.hintname,
      required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AlertDialog(
        title: Text(titlename),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintname,
            // border: OutlineInputBorder(),
          ),
        ),
        actions: [
          CustomButton(
            btnText: "Save",
            color: AppColors.textColor,
            ontap: () {
              onSave();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            btnText: "Cancel",
            color: AppColors.textColor,
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

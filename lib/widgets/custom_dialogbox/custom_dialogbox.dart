import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_button/app_button.dart';

import '../../constant/app_colours/appcolors.dart';
import '../../constant/app_sizes/app_sizes.dart';

class CustomDialogbox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final String hintname;
  final String titlename;

  const CustomDialogbox({super.key,
    required this.controller,
    required this.onSave,
    required this.hintname,
    required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: AlertDialog(
          title: Text(titlename),
          content: SizedBox(
            width: 300,
            height: 150,
            child: Column(
              children: [
              TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintname,
                border: OutlineInputBorder(),
              ),
            ),
                SizedBox(height: AppSizes.height02(context),),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        btnWidth: 80,
                        btnText: "Cancel",
                        color: AppColors.textColor,
                        ontap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        btnWidth: 80,
                        btnText: "Save",
                        color: AppColors.textColor,
                        ontap: () {
                          onSave();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
            )
              ],
          ),
        )),);
  }
}

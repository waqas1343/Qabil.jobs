import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../widgets/notification_widget/notification_widget.dart';

class ProfileStudent extends StatelessWidget {
  const ProfileStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Provider.of<TextEditingControllerManager>(context);

    return Scaffold(
      appBar: CustomAppBar(
        username: 'profile',
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            children: [
              Center(
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textColorGrey,
                    border: Border.all(
                      color: AppColors.textColor,
                      width: 2.5,
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(AppImages.profileImage),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 9,
                left: 160,
                right: 70,
                child: Container(
                  height: 27,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.appBackground,
                    border: Border.all(
                      color: AppColors.textColor,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: AppColors.textColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 15),
              Text(
                textController.nameController.text.isEmpty
                    ? "User Name"
                    : textController.nameController.text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(width: 2),
              Icon(
                Icons.edit,
                color: AppColors.textColorGrey,
              ),
            ],
          ),
          SizedBox(height: 3),
          Center(
            child: Text(
              textController.bioController.text.isEmpty
                  ? "Your Headline"
                  : textController.bioController.text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.blackTextClr,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: AppColors.tileColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "My Queries",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Divider(
                      color: AppColors.textColor,
                      indent: 5,
                      endIndent: 390,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomNotifications(
                          title: 'hdjhsa',
                          message: 'sfdjsafdhj',
                          image: 'sfdsfaf',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

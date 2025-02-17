import 'package:flutter/material.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/widgets/custom_notification_screen/custom_notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: Text("Notification",
        style: TextStyle(
          fontSize: 20,
          color: AppColors.appBackground,
        ),),
        actions: [Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleAvatar(
            radius: 15,
            child: Image.asset(AppLogo.dart),
          ),
        )],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Text("New",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Divider(
                    color: AppColors.textColor,
                    thickness: 2.0,
                    indent: 12,
                    endIndent: 230,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
          CustomNotifications(),
          CustomNotifications(),
          CustomNotifications(),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Text("Previous",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Divider(
                    color: AppColors.textColor,
                    thickness: 2.0,
                    indent: 12,
                    endIndent: 230,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
          CustomNotifications(),
          CustomNotifications(),
          CustomNotifications(),
          SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              onTap: (){
                print("object");
              },
              child: Text("Manage notification?",
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: Text("Notification",
          style: TextStyle(
            color: AppColors.appBackground,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              child: Image.asset(AppLogo.dart),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image(image:AssetImage(AppImages.emptyNotification,
          ),height: 280,
          width: 250,
          fit: BoxFit.contain,),
         SizedBox(height: 20,),
         Center(
           child: Text('No notifications yet',
             style: TextStyle(
               color: AppColors.blackTextClr,
               fontWeight: FontWeight.bold,
               fontSize: 22,
             ),),
         ),
          SizedBox(height: 130,),

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

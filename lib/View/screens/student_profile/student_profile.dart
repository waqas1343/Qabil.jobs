import 'package:flutter/material.dart';
import 'package:qabil_app/Navigation_screening/app_navigators.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';

class ProfileStudent extends StatelessWidget {
  const ProfileStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: Text("Profile",
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.appBackground,
          ) ,),
        actions: [
          GestureDetector(
            onTap: (){
              AppNavigators.nextscreen(context, RouteNames.notification);
            },
            child: Icon(Icons.notifications_none_rounded,
              size: 30,
              color: AppColors.appBackground,
            ),
          ),
          SizedBox(width: 20,),
          Icon(Icons.logout_rounded,
            size: 30, color: AppColors.appBackground),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
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
                          style: BorderStyle.solid
                      )
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
                left:160,
                right: 70,
                child: Container(
                  height: 27,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appBackground,
                      border: Border.all(
                        color: AppColors.textColor,
                        width: 2.0,
                        style: BorderStyle.solid
                      )
                    ),
                    child: Icon(Icons.camera_alt_outlined,
                    size: 18,
                    color: AppColors.textColor,),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 15,),
              Text("Waqas Tehami",
                style:TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ) ,),
              SizedBox(width: 2,),
              Icon(Icons.edit,
              color: AppColors.textColorGrey,),
            ],
          ),
          SizedBox(height: 3,),
          
          Center(
            child: Text("Junior Flutter Developer",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.blackTextClr,
            ),),
          ),

          SizedBox(height: 20,),

          Column(

            children: [
              Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                color: AppColors.tileColor,
                ),
                
              )
            ],
          )

        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';

class CustomNotifications extends StatelessWidget {
  const CustomNotifications({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 3.0,),
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.solid,
              spreadRadius: 0.3,
            ),
          ],
          color: AppColors.tileColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23,top: 9),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(AppImages.profileImage),
              ),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height : 12,),
                Text("Tehami Khan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.blackTextClr,
                  ),
                ),
                Flexible(
                  child: Text('Lorem ipsum dolor sit amet, consectetu adipiscing,'
                      ,style: TextStyle(
                      color: AppColors.blackTextClr,
                      fontSize: 10,
                      fontWeight: FontWeight.w600
                    ),),
                ),
              ],
            ),
            Expanded(
                child: SizedBox(width: 70,)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 3),
              child: Text("Nov 24 , 2022",
              style: TextStyle(
                color: AppColors.blackTextClr,
                fontSize: 12  ,
              ),),
            ),
          ],
    ),
    ),
      );
  }
}

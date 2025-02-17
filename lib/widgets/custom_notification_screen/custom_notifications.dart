import 'package:flutter/material.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

class CustomNotifications extends StatelessWidget {
  const CustomNotifications({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 1.00,
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
                radius: 15,
                child :Image.asset(AppLogo.flutter),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.020,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.012,),
                Text("Tehami Khan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.blackTextClr,
                  ),
                ),
                Text('Lorem ipsum dolor sit amet, consectetu adipiscing,'
                    ,style: TextStyle(
                    color: AppColors.blackTextClr,
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),),
              ],
            ),

            SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
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

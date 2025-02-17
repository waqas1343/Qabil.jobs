import 'package:flutter/material.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

class CustomNotifications extends StatelessWidget {
  const CustomNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(15.0),
    //   child: ListTile(
    //     style: ,
    //     minTileHeight: 70,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(25),
    //
    //     ),
    //     leading: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         CircleAvatar(
    //           radius: 12,
    //           child:Image.asset(AppLogo.flutter ),
    //         ),
    //       ],
    //     ),
    //     subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
    //         "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    //         " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
    //     style: TextStyle(
    //       fontSize: 10,
    //       fontWeight: FontWeight.w700,
    //       color: AppColors.appBackground,
    //     ),),
    //     trailing: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Text("Nov 05 ,2020",
    //         style: TextStyle(
    //           color: AppColors.appBackground
    //         ),),
    //       ],
    //     ),
    //     //Text("20/05/23"),
    //     title: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(height: 15,),
    //         Text("Waqas Khalil",
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 15,
    //         ),),
    //       ],
    //     ),
    //     tileColor: AppColors.iconsColors,
    //   ),
    // );
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 1.00,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(1.5, 1.5),
              blurRadius: 3,
              blurStyle: BlurStyle.outer,
            ),
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 23,top: 8),
              child: CircleAvatar(
                child :Image.asset(AppLogo.flutter),
                radius: 15,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.015,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.012,),
                Text("Waqas Ali",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.blackTextClr,
                  ),
                ),
                Text('Lorem ipsum dolor sit amet, consectetu adipiscing elit,'
                    ,style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),),
              ],
            ),

            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
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

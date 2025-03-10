import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../widgets/notification_widget/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final savedPosts = Provider.of<SavedCardProvider>(context).savedPosts;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: AppColors.textColor,
        title: Text("Notification",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.appBackground,
          ),),
        actions: [
          Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.profileImage),
          ),
        )
        ],
      ),
    //   body: savedPosts.isEmpty
    //       ? Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SizedBox(height: MediaQuery.of(context).size.height * 0.18),
    //   Image(image:AssetImage(AppImages.emptyNotification,
    //   ),height: 250,
    //   width: 250,
    //   fit: BoxFit.contain,),
    // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
    // Center(
    // child: Text('No notifications yet',
    // style: TextStyle(
    // color: AppColors.blackTextClr,
    // fontWeight: FontWeight.bold,
    // fontSize: 22,
    // ),
    // ),
    // ),
    // ],
    // )
    //     :
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 15,),
              Text("New",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,
                  right: 10),
                  child: Divider(
                    color: AppColors.textColor,
                    thickness: 1.0,
                    endIndent: 10,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
          Expanded(child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return CustomNotifications(
                  title: '', message: '', image: '',);
              }, itemCount: 6
          ),),
          SizedBox(height: 2,),
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
                  padding: const EdgeInsets.only(top: 10,
                  right: 10),
                  child: Divider(
                    color: AppColors.textColor,
                    thickness: 1.0,
                    endIndent: 10,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return CustomNotifications(title: 'title',
                      message:'', image: '');
                }),
          ),

          SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              onTap: () {
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

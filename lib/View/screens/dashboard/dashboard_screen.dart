import 'package:flutter/material.dart';
import 'package:qabil_app/Navigation_screening/app_navigators.dart';
import 'package:qabil_app/View/savequery/savequeries.dart';
import 'package:qabil_app/View/screens/exploreScreen/post_card/post_card.dart';
import 'package:qabil_app/View/screens/exploreScreen/tab_card/tab_card.dart';
import 'package:qabil_app/View/screens/notification/notifications.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/view_model/selectors_logo/selector_model.dart';
import 'package:qabil_app/widgets/custom_Category_logo/categoryLogo.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: AppColors.textColor,
        title: Text("Hi Waqas",
          style: TextStyle(
            color: AppColors.appBackground,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            AppNavigators.nextscreen(context, RouteNames.notification);
          }, icon: Icon(Icons.notifications_none_rounded,
          color: AppColors.appBackground,
          size: 25,)),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              AppNavigators.nextscreen(context, RouteNames.profileStudent);
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profileImage),
              radius: 17,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listRepo.length,
          itemBuilder: (context, index) {
            final repoList = listRepo[index];
            return CustomLogoCategory(
              title: repoList.name,
              image: repoList.image,
              index: index,
            );
          },
        ),
      ),
    ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(AppStrings.query,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Divider(
          color: AppColors.textColor,
          endIndent: 10,
          indent: 12,
            thickness: 1.7,
          ),

          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                final repoList = listRepo[index];
                return PostCard(post: Map(), isSaved: true, onSave: (){});
              },
            ),
          ),
        ],
      ),
    );
  }
}

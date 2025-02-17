import 'package:flutter/material.dart';
import 'package:qabil_app/Navigation_screening/app_navigators.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/view_model/selectors_logo/selector_model.dart';
import 'package:qabil_app/widgets/custom_Category_logo/categoryLogo.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildHeader(context),
            _buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: AppColors.textColor),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         // _buildActionIcons(),
          _buildActionIcons(context),
        ],
      ),
    );
  }

  Widget buildUserGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi!",
          style: TextStyle(
            color: AppColors.appBackground,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        Text(
          "Saim!",
          style: TextStyle(
            color: AppColors.appBackground,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        )
      ],
    );
  }
  Widget _buildActionIcons(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/profileimage.png'),
        ),

        SizedBox(width: MediaQuery.of(context).size.width * 0.7 ,),

        GestureDetector(
          onTap: (){
            AppNavigators.nextscreen(context, RouteNames.notification);
          },
          child: Icon(Icons.notifications_none_outlined,
            color: AppColors.appBackground,
          ),
        )
      ],
    );
  }

  Widget _buildCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 150,
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
    );
  }
}

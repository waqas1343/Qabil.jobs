import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
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
            buildHeader(),
            buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: AppColors.textColor),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUserGreeting(),
          buildActionIcons(),
        ],
      ),
    );
  }

  Widget buildUserGreeting() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi!",
            style: TextStyle(
              color: AppColors.appBackground,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Saim!",
            style: TextStyle(
              color: AppColors.appBackground,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionIcons() {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/profileimage.png'),
        )
      ],
    );
  }

  Widget buildCategoryList() {
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

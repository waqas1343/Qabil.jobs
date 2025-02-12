import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

import '../../Widgets/custom_Category_logo/categoryLogo.dart';
import '../../view_model/selectors_logo/selector_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.textColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
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
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 240,
                    ),
                    Icon(
                      Icons.notifications_on_outlined,
                      color: AppColors.appBackground,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.person_outline,
                      color: AppColors.appBackground,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    listRepo.length,
                    (index) {
                      final repoList = listRepo[index];
                      return CustomLogoCategory(
                        title: repoList.name.toString(),
                        image: repoList.image.toString(),
                        index: index,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

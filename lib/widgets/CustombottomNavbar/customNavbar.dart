import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qabil_app/constant/app_colours/appcolors.dart';
import '../../View/Screen/dashboard/dashboard_screen.dart';
import '../../View/Screen/exploreScreen/exploreScreen.dart';
import '../../View/Screen/profileScreen/profileScreen.dart';
import '../../View/Screen/saveScreen/saveScreen.dart';
import '../../View/auth/query_information/query_info.dart';

import '../../view_model/controller/bottom_navbar_controller/bottom_navbar_controller.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavbarController>(context);

    final pages = [
      DashBoardScreen(),
      ExploreScreen(),
      SavedPostsScreen(),
      Profilescreen(),
    ];

    return Consumer<BottomNavbarController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: pages[provider.pageIndex],
          floatingActionButton: Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              color: AppColors.appBackground,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        scrollControlDisabledMaxHeightRatio: 0.8,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: QueryInfo(),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.appBackground,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.textColorGrey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    provider.setBotttomNaviagtionIndex(0);
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: provider.pageIndex == 0
                        ? AppColors.textColor
                        : AppColors.appBackground,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.setBotttomNaviagtionIndex(1);
                  },
                  icon: Icon(
                    Icons.explore_outlined,
                    color: provider.pageIndex == 1
                        ? AppColors.textColor
                        : AppColors.appBackground,
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 70,
                ),
                IconButton(
                  onPressed: () {
                    provider.setBotttomNaviagtionIndex(2);
                  },
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: provider.pageIndex == 2
                        ? AppColors.textColor
                        : AppColors.appBackground,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.setBotttomNaviagtionIndex(3);
                  },
                  icon: Icon(
                    Icons.person_outlined,
                    color: provider.pageIndex == 3
                        ? AppColors.textColor
                        : AppColors.appBackground,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

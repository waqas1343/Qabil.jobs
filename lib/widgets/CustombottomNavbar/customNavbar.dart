import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/View/screens/dashboard/dashboard_screen.dart';
import 'package:qabil_app/View/screens/exploreScreen/exploreScreen.dart';
import 'package:qabil_app/View/screens/profile_screen/profile_screen.dart';
import 'package:qabil_app/View/screens/saveScreen/saveScreen.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

import '../../View/screens/query_information/query_info.dart';
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
          body: pages[provider.pageIndex],
          floatingActionButton: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: AppColors.appBackground,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
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
                      size: 45,
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
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.cardsColor2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          provider.setBotttomNaviagtionIndex(0);
                        },
                        icon: Icon(
                          Icons.home_rounded,
                          color: provider.pageIndex == 0
                              ? AppColors.iconsColors
                              : AppColors.appBackground,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.pageIndex == 0
                            ?  AppColors.iconsColors
                            : AppColors.appBackground,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          provider.setBotttomNaviagtionIndex(1);
                        },
                        icon: Icon(
                          Icons.explore_outlined,
                          color: provider.pageIndex == 1
                              ? AppColors.iconsColors
                              : AppColors.appBackground,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.pageIndex == 1
                            ?  AppColors.iconsColors
                            : AppColors.appBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                  height: 60,
                ),
                Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          provider.setBotttomNaviagtionIndex(2);
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: provider.pageIndex == 2
                              ?  AppColors.iconsColors
                              : AppColors.appBackground,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.pageIndex == 2
                            ? AppColors.iconsColors
                            : AppColors.appBackground,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          provider.setBotttomNaviagtionIndex(3);
                        },
                        icon: Icon(
                          Icons.person_outlined,
                          color: provider.pageIndex == 3
                              ? AppColors.iconsColors
                              : AppColors.appBackground,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.pageIndex == 3
                            ?  AppColors.iconsColors
                            : AppColors.appBackground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

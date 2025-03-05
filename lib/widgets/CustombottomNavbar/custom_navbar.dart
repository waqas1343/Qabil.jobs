import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colours/appcolors.dart';
import '../../view/screens/dashboard_screen/dashboard_screen.dart';
import '../../view/screens/explore_screen/explore_screen.dart';
import '../../view/screens/profile_screen/profile_screen.dart';
import '../../view/screens/query_screen/query_screen.dart';
import '../../view/screens/save_screen/save_screen.dart';

import '../../view_model/controller/bottom_roll_controller/bottom_roll_controller.dart';
import 'custom_icon_button/custom_icon_button.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomRollController>(
      builder: (context, provider, child) {
        // Role-Based Pages
        final pages = provider.role == "mentor"
            ? [
                DashboardScreen(),
                ExploreScreen(),
                ProfileScreen(),
              ]
            : [
                DashboardScreen(),
                ExploreScreen(),
                SaveScreen(),
                ProfileScreen(),
              ];

        return Scaffold(
          body: pages[provider.pageIndex],
          floatingActionButton: provider.role == "mentor"
              ? null
              : Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.appBackground,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indicatorColor,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ],
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
                              child: QueryScreen(),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.cardsColor2,
                        size: 45,
                      ),
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.iconColorGrey,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                )
              ],
              color: AppColors.appBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: provider.role == "mentor"
                        ? [
                            CustomIconButton(
                              icon: Icons.dashboard_outlined,
                              iconColor: provider.pageIndex == 0
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Dashboard',
                              iconTextColor: provider.pageIndex == 0
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(0),
                              gap: 2,
                            ),
                            CustomIconButton(
                              icon: Icons.schedule_outlined,
                              iconColor: provider.pageIndex == 1
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Sessions',
                              iconTextColor: provider.pageIndex == 1
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(1),
                              gap: 2,
                            ),
                            CustomIconButton(
                              icon: Icons.person_outline,
                              iconColor: provider.pageIndex == 2
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Profile',
                              iconTextColor: provider.pageIndex == 2
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(2),
                              gap: 2,
                            ),
                          ]
                        : [
                            CustomIconButton(
                              icon: Icons.home_outlined,
                              iconColor: provider.pageIndex == 0
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Home',
                              iconTextColor: provider.pageIndex == 0
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(0),
                              gap: 2,
                            ),
                            CustomIconButton(
                              icon: Icons.explore_outlined,
                              iconColor: provider.pageIndex == 1
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Explore',
                              iconTextColor: provider.pageIndex == 1
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(1),
                              gap: 2,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            CustomIconButton(
                              icon: Icons.bookmark_outline,
                              iconColor: provider.pageIndex == 2
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Save',
                              iconTextColor: provider.pageIndex == 2
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(2),
                              gap: 2,
                            ),
                            CustomIconButton(
                              icon: Icons.person_outlined,
                              iconColor: provider.pageIndex == 3
                                  ? AppColors.cardsColor2
                                  : AppColors.iconColorGrey,
                              iconSize: 35,
                              iconText: 'Profile',
                              iconTextColor: provider.pageIndex == 3
                                  ? AppColors.cardsColor2
                                  : AppColors.textColorGrey,
                              onTap: () =>
                                  provider.setBotttomNaviagtionIndex(3),
                              gap: 2,
                            ),
                          ],
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

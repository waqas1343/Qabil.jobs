import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:qabil_app/View/auth/login_screen/login_screen.dart';
import 'package:qabil_app/View/exploreScreen/exploreScreen.dart';
import 'package:qabil_app/View/profileScreen/profileScreen.dart';
import 'package:qabil_app/View/querryScreen/querryScreen.dart';
import 'package:qabil_app/View/saveScreen/saveScreen.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

class Customnavbar extends StatelessWidget {
  const Customnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        LoginScreen(),
        Explorescreen(),
        Querryscreen(),
        Savescreen(),
        Profilescreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_outlined),
          activeColorPrimary: AppColors.textColor,
          inactiveColorPrimary: AppColors.blackTextClr,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.explore_off_outlined),
          activeColorPrimary: AppColors.textColor,
          inactiveColorPrimary: AppColors.blackTextClr,
        ),
        PersistentBottomNavBarItem(
          icon: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              Icons.add_outlined,
              color: AppColors.appBackground,size: 35,
            ),
          ),
          activeColorPrimary: AppColors.appBackground,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.save_outlined),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_off_outlined),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      backgroundColor: Colors.grey.shade300,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 60,
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property
    );
    ;
  }
}

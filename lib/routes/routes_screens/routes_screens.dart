import 'package:flutter/material.dart';
import 'package:qabil_project01_final/view/auth/signup_screen/student_rigister_screen.dart';
import 'package:qabil_project01_final/view/screens/explore_screen/explore_screen.dart';
import 'package:qabil_project01_final/view/screens/profile_screen/profile_screen.dart';
import 'package:qabil_project01_final/view/screens/query_screen/query_screen.dart';
import 'package:qabil_project01_final/view/screens/save_screen/save_screen.dart';
import 'package:qabil_project01_final/widgets/notification_widget/notification_widget.dart';
import '../../view/auth/forget_password_screens/enter_otp.dart';
import '../../view/auth/forget_password_screens/forget_password_screen.dart';
import '../../view/auth/forget_password_screens/reset_password_screen.dart';
import '../../view/auth/login_screen/login_screen.dart';
import '../../view/auth/complete_profile/complete_profile.dart';
import '../../view/auth/signup_screen/mentor_register_screen.dart';
import '../../view/screens/dashboard_screen/dashboard_screen.dart';
import '../../widgets/CustombottomNavbar/custom_navbar.dart';
import '../routes_name/routes_names.dart';

class RouteScreens {
  static Map<String, WidgetBuilder> getScreens() {
    return {
      RouteNames.login: (context) => LoginScreen(),

      // Forget Password Screens
      RouteNames.forgotPassword: (context) => ForgetPasswordScreen(),
      RouteNames.enterOtp: (context) => EnterOtp(),
      RouteNames.resetPassword: (context) => ResetPasswordScreen(),

      // Registration Screens
      RouteNames.registerMentor: (context) => MentorRegisterScreen(),
      RouteNames.registerStudent: (context) => StudentRigisterScreen(),

      // Complete Profile
      RouteNames.completeProfile: (context) => CompleteProfile(),

      // Bottom Navbar & Dashboard
      RouteNames.bottomNavBar: (context) => CustomNavbar(),
      RouteNames.dashboard: (context) => DashboardScreen(),

      // Other Screens
      RouteNames.exploreScreen: (context) => ExploreScreen(),
      RouteNames.saveScreen: (context) => SaveScreen(),
      RouteNames.queryScreen: (context) => QueryScreen(),
      RouteNames.profileScreen: (context) => ProfileScreen(),
      RouteNames.notification: (context) => NotificationScreen(),
    };
  }
}

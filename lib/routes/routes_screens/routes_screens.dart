import 'package:flutter/material.dart';
import 'package:qabil_app/View/auth/complete_profile/complete_profile.dart';
import 'package:qabil_app/View/auth/signup_screen/mentor_register_screen.dart';
import 'package:qabil_app/View/auth/signup_screen/student_rigister_screen.dart';
import 'package:qabil_app/View/screens/notification/notifications.dart';
import 'package:qabil_app/View/screens/notification_empty/notification_empty.dart';
import 'package:qabil_app/widgets/CustombottomNavbar/customNavbar.dart';

import '../../View/auth/forget_password_screens/enter_otp.dart';
import '../../View/auth/forget_password_screens/forget_password_screen.dart';
import '../../View/auth/forget_password_screens/reset_password_screen.dart';
import '../../View/auth/login_screen/login_screen.dart';
import '../../View/screens/dashboard/dashboard_screen.dart';
import '../routes_name/routes_names.dart';

class RouteScreens {
  static Map<String, WidgetBuilder> getScreens() {
    return {
      //splashscreen
      // RouteNames.splashscreen: (context) => const LoginScreens(),

      //auth module screens
      RouteNames.forgotpassword: (context) => ForgetPasswordScreen(),
      RouteNames.resetPassScreen: (context) => ResetPasswordScreen(),
      RouteNames.bottomNavBar: (context) => CustomNavbar(),
      RouteNames.enterotp: (context) => EnterOtp(),
      // RouteNames.resend: (context) => const LoginScreens(),
      RouteNames.registersMentorScreen: (context) => MentorRegisterScreen(),
      RouteNames.login: (context) => LoginScreen(),
      RouteNames.registersStudentScreen: (context) => StudentRigisterScreen(),
      RouteNames.completeProfile: (context) => CompleteProfile(),
      // RouteNames.completeProfiler: (context) => CompleteProfile(),

      //dashBoard
      RouteNames.dashboard: (context) => const DashBoardScreen(),
      RouteNames.notification: (context) => const NotificationScreen(),
      RouteNames.notificationEmpty: (context) => const NotificationEmpty(),

      //profile mentor
      // RouteNames.profileMentor : (context) => MentorProfile(),

      //bottom navigation

      // RouteNames.profile: (context) => const LoginScreens(),
      // RouteNames.savequires: (context) => const LoginScreens(),
      // RouteNames.expolre: (context) => const LoginScreens(),
      //RouteNames.home: (context) => const LoginScreens(),
    };
  }
}

import 'package:flutter/material.dart';
import 'package:qabil_app/View/auth/signup_screen/mentor_register_screen.dart';
import 'package:qabil_app/View/auth/signup_screen/student_rigister_screen.dart';
import 'package:qabil_app/View/dashboardScreen/dashboardScreen.dart';

import '../../View/auth/forget_password_screens/enter_otp.dart';
import '../../View/auth/forget_password_screens/forget_password_screen.dart';
import '../../View/auth/forget_password_screens/reset_password_screen.dart';
import '../../View/auth/login_screen/login_screen.dart';
import '../routes_name/routes_names.dart';

class RouteScreens {
  static Map<String, WidgetBuilder> getScreens() {
    return {
      //splashscreen
      // RouteNames.splashscreen: (context) => const LoginScreens(),

      //auth module screens
      RouteNames.forgotpassword: (context) => ForgetPasswordScreen(),
      RouteNames.resetPassScreen: (context) => ResetPasswordScreen(),
      // RouteNames.dashboard: (context) => const DashboardScreen(),
      RouteNames.enterotp: (context) => EnterOtp(),
      //RouteNames.notification: (context) => const LoginScreens(),
      // RouteNames.resend: (context) => const LoginScreens(),
      RouteNames.registersMentorScreen: (context) => MentorRegisterScreen(),
      RouteNames.login: (context) => LoginScreen(),
      RouteNames.registersStudentScreen: (context) => StudentRigisterScreen(),
      RouteNames.dashboard: (context) => DashboardScreen(),

      //bottom navigation

      // RouteNames.profile: (context) => const LoginScreens(),
      // RouteNames.savequires: (context) => const LoginScreens(),
      // RouteNames.expolre: (context) => const LoginScreens(),
      //RouteNames.home: (context) => const LoginScreens(),
    };
  }
}

import 'package:flutter/material.dart';
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

      // Complete Profile
      RouteNames.completeProfile: (context) => CompleteProfile(),

      // Bottom Navbar & Dashboard
      RouteNames.bottomNavBar: (context) => CustomNavbar(),
      RouteNames.dashboard: (context) => DashboardScreen(),

      // Other Screens

    };
  }
}

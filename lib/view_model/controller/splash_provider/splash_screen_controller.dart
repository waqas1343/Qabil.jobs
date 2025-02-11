import 'package:flutter/material.dart';
import 'package:qabil_app/navigation_screening/app_navigators.dart';

class SplashScreenController extends ChangeNotifier {
  void intitalApp(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      AppNavigators.changescreen(context, '/LoginScreens');
    });
  }
}

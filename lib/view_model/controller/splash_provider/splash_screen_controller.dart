import 'package:flutter/material.dart';
import 'package:qabil_app/Navigation_screening/app_navigators.dart';
// import 'package:qabil_app/navigation_screening/app_navigators.dart';

class SplashScreenController extends ChangeNotifier {
  void intitalApp(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      AppNavigators.nextscreen(context, '/LoginScreens');

      AppNavigators.changescreen(context, '/LoginScreens');
    });
  }
}

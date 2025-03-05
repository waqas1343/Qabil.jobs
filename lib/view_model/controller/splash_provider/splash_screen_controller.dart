import 'package:flutter/material.dart';
import '../../../navigation_screen/app_navigators.dart';

class SplashScreenController extends ChangeNotifier {
  void intitalApp(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      AppNavigators.nextscreen(context, '/login');
    });
  }
}

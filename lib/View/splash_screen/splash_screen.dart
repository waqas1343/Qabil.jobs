import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

import '../../view_model/controller/splash_provider/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashScreenController>(context, listen: false)
        .intitalApp(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/forumLogo.png'),
          ),
          SizedBox(
            height: 15,
          ),
          CircularProgressIndicator(
            color: AppColors.blackTextClr,
            semanticsLabel: 'Loading',
          )
        ],
      ),
    );
  }
}

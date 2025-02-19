import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:qabil_app/View/splash_screen/splash_screen.dart';

import 'package:qabil_app/View/splash_screen/splash_screen.dart';


import 'package:qabil_app/View/screens/dashboard/dashboard_screen.dart';

import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/routes/routes_screens/routes_screens.dart';
import 'package:qabil_app/utils/text_theme/text_theme.dart';
import 'package:qabil_app/view_model/providers/multi_providers.dart';

import 'View/splash_screen/splash_screen.dart';
import 'constant/app_colours/appcolors.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.appBackground,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.appBackground,
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiAppProviders,
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splashscreen,
        routes: RouteScreens.getScreens(),
        theme: AppTheme.theme,
        home: SplashScreen(),


      ),
    );
  }
}

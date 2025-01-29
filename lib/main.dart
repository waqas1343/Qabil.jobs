import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/View/auth/profile_mentor/profile_mentor.dart';
import 'package:qabil_app/routes/raoutes_screens/routes_screens.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/utils/text_theme/text_theme.dart';
import 'package:qabil_app/view_model/providers/generalProvider.dart';

import 'View/auth/profile_complete/profile_complete.dart';
import 'View/auth/query_information/query_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GeneralProvider>(
            create: (_) => GeneralProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splashscreen,
        routes: RouteScreens.getScreens(),
        theme: AppTheme.theme,
        home: ProfileMentor(),
      ),
    );
  }
}

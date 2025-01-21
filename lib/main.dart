import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/routes/raoutes_screens/routes_screens.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/utils/text_theme/text_theme.dart';
import 'package:qabil_app/view_model/providers/multi_providers.dart';
import 'View/auth/complete_profile/complete_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiAppProviders,
      child: MaterialApp(
        initialRoute: RouteNames.completP,
        routes: RouteScreens.getScreens(),
        theme: AppTheme.theme,
        home: CompleteProfile(),
      ),
    );
  }
}

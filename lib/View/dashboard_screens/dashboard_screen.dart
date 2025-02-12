import 'package:flutter/material.dart';
import 'package:qabil_app/constant/custom_appbar/custom_appbar.dart';

import '../../widgets/dashboard_widgets/dashboard_courses.dart';
import '../../widgets/dashboard_widgets/post_cards.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        greeting: 'Hi',
        username: 'Waqas iLyas',
        profileImagePath: 'assets/images/forumLogo.png',
        notificationCount: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardCourses(),
            Text('Query sections'),
            PostCards(),
            PostCards(),
          ],
        ),
      ),
    );
  }
}

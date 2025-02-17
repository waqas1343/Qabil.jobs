import 'package:flutter/material.dart';
import 'package:qabil_app/widgets/custom_notification_screen/custom_notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomNotifications(),
        ],
      ),

    );
  }
}

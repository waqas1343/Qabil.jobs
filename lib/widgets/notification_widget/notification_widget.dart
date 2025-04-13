import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';
import 'package:qabil_project01_final/view_model/controller/image_picker/image_picker_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> newNotifications = [
    {
      "title": "Welcome!",
      "message": "Your account has been created successfully.",
      "image": "assets/images/profileimage.png",
    },
    {
      "title": "Update Available",
      "message": "A new app update is ready to install.",
      "image": "assets/images/profileimage.png",
    },
    {
      "title": "Security Alert",
      "message": "Unusual login attempt detected on your account.",
      "image": "assets/images/profileimage.png",
    },
  ];

  final List<Map<String, String>> previousNotifications = [
    {
      "title": "Reminder",
      "message": "Don't forget to complete your profile.",
      "image": "assets/images/profileimage.png",
    },
    {
      "title": "New Feature",
      "message": "Try out our latest dark mode feature.",
      "image": "assets/images/profileimage.png",
    },
    {
      "title": "Discount Offer",
      "message": "Get 20% off on your first purchase!",
      "image": "assets/images/profileimage.png",
    },
    {
      "title": "System Maintenance",
      "message": "We will be down for maintenance tonight.",
      "image": "assets/images/profileimage.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickerController>(context);
    return Scaffold(
      appBar: CustomAppBar(
        profileImagePath: imageProvider.images1 != null
            ? imageProvider.images1!.path
            : 'assets/images/profileimage.png',
        username: 'notification',
        showNotificationIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSectionTitle("New"),
            const SizedBox(height: 5),
            Column(
              children: newNotifications.map((notif) {
                return CustomNotifications(
                  title: notif["title"]!,
                  message: notif["message"]!,
                  image: notif["image"]!,
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            _buildSectionTitle("Previous"),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: previousNotifications.length,
                itemBuilder: (context, index) {
                  final notif = previousNotifications[index];
                  return CustomNotifications(
                    title: notif["title"]!,
                    message: notif["message"]!,
                    image: notif["image"]!,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  print("Manage Notification Clicked");
                },
                child: const Text(
                  "Manage notification?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}

class CustomNotifications extends StatelessWidget {
  final String title;
  final String message;
  final String image;

  const CustomNotifications({
    super.key,
    required this.title,
    required this.message,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.notifications,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

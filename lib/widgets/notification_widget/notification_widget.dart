import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_images/app_images.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';
import 'package:qabil_project01_final/view_model/controller/all_textediting_controller/all_textediting_controller.dart';
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
    final textController = Provider.of<TextEditingControllerManager>(context);
    final imageProvider = Provider.of<ImagePickerController>(context);

    return Scaffold(
      appBar: CustomAppBar(
        preSize: 70,
        greeting: 'notification',
        centerTitle: true,
        profileImagePath2: AppImages.profileImage,
      ),
      // appBar: AppBar(
      //   elevation: 5,
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     "Notifications",
      //     style: TextStyle(
      //       fontSize: 20,
      //       color: Colors.white,
      //     ),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(9.0),
      //       child: CircleAvatar(
      //         radius: 20,
      //         backgroundImage: AssetImage(
      //             "assets/profile.jpg"), // Replace with your profile image
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // ✅ New Notifications (Fixed 3 items with data)
            _buildSectionTitle("New"),
            SizedBox(height: 5),
            Column(
              children: newNotifications.map((notif) {
                return CustomNotifications(
                  title: notif["title"]!,
                  message: notif["message"]!,
                  image: notif["image"]!,
                );
              }).toList(),
            ),

            SizedBox(height: 15),

            // ✅ Previous Notifications (Scrollable List with Data)
            _buildSectionTitle("Previous"),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: previousNotifications.length,
                itemBuilder: (context, index) {
                  return CustomNotifications(
                    title: previousNotifications[index]["title"]!,
                    message: previousNotifications[index]["message"]!,
                    image: previousNotifications[index]["image"]!,
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  print("Manage Notification Clicked");
                },
                child: Text(
                  "Manage notification?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ✅ Function to Create Section Titles
  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 6),
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}

// ✅ Custom Notification Widget with Image
class CustomNotifications extends StatelessWidget {
  final String title;
  final String message;
  final String image;

  const CustomNotifications(
      {super.key,
      required this.title,
      required this.message,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(image), // ✅ Show Image
          onBackgroundImageError: (_, __) =>
              Icon(Icons.notifications, color: Colors.red), // ✅ Fallback Icon
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

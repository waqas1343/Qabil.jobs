import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import 'package:qabil_project01_final/widgets/notification_widget/notification_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? greeting; // Optional
  final String? username; // Optional
  final String? profileImagePath;
  final String? profileImagePath2;

  final int notificationCount;
  final bool? centerTitle; // Optional
  final double? preSize;
  const CustomAppBar({
    super.key,
    this.greeting,
    this.username, // Optional
    this.profileImagePath,
    this.notificationCount = 0,
    this.centerTitle,
    this.preSize,
    this.profileImagePath2, // Made optional
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true, // Default to true if null
      automaticallyImplyLeading: false,
      elevation: 10,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.cardsColor2,
        ),
      ),
      leadingWidth: 70,
      leading: profileImagePath != null
          ? CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: profileImagePath!.startsWith('assets/')
                    ? Image.asset(
                        profileImagePath!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(profileImagePath!),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            )
          : const SizedBox(), // If null, return an empty widget

      title: Row(
        mainAxisAlignment: centerTitle == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (greeting != null) // Only show if greeting is not null
                Text(
                  greeting!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              if (username != null) // Only show if username is not null
                Text(
                  username!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent,
                  ),
                ),
            ],
          ),
        ],
      ),
      actions: [
        if (notificationCount > 0)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (profileImagePath2 != null)
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: profileImagePath2!.startsWith('assets/')
                  ? Image.asset(
                      profileImagePath2!,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(profileImagePath2!),
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preSize!);
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import 'package:qabil_project01_final/widgets/notification_widget/notification_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? username;
  final String? profileImagePath;
  final String? headline;
  final int? notificationCount;
  final bool showNotificationIcon;
  final VoidCallback? onProfileTap;
  final Icon? actionIcon;

  const CustomAppBar({
    super.key,
    this.username,
    this.profileImagePath,
    this.headline,
    this.notificationCount,
    this.showNotificationIcon = true,
    this.onProfileTap,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.cardsColor2,
          leadingWidth: 80,
          leading: _buildProfileAvatar(),
          title: _buildTitle(context),
          actions: _buildActions(context),
          centerTitle: true,
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    if (profileImagePath == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: GestureDetector(
        onTap: onProfileTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.lightGreenAccent,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: _buildImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    try {
      if (profileImagePath!.startsWith('assets/')) {
        return Image.asset(
          profileImagePath!,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallbackAvatar(),
        );
      } else {
        return Image.file(
          File(profileImagePath!),
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallbackAvatar(),
        );
      }
    } catch (_) {
      return _buildFallbackAvatar();
    }
  }

  Widget _buildFallbackAvatar() {
    return const Icon(
      Icons.person,
      size: 30,
      color: Colors.grey,
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (username == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          username!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        if (headline != null)
          Text(
            headline!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    List<Widget> actions = [];

    if (showNotificationIcon) {
      actions.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    if (showNotificationIcon) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
              if (notificationCount != null && notificationCount! > 0)
                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        notificationCount! > 99
                            ? '99+'
                            : '${notificationCount!}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    if (actionIcon != null) {
      actions.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: actionIcon!,
            color: AppColors.textColorGrey,
          ),
        ),
      );
    }

    return actions;
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

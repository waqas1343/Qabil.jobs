import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_icons/app_icons.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';
import 'package:qabil_project01_final/view_model/controller/query_post_controller/query_post_controller.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../widgets/notification_widget/notification_widget.dart';

class ProfileStudent extends StatelessWidget {
  const ProfileStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Provider.of<TextEditingControllerManager>(context);
    final queryController = Provider.of<QueryController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        username: 'Profile',
        headline: textController.nameController.text.isNotEmpty
            ? textController.nameController.text
            : "Your Headline",
        showNotificationIcon: false,
        actionIcon: AppIcons.logout,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.textColor,
                          AppColors.appBackground,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.textColorGrey,
                    backgroundImage: AssetImage(AppImages.profileImage),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.appBackground,
                          border: Border.all(
                            color: AppColors.textColor,
                            width: 2.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                textController.nameController.text.isEmpty
                    ? "User Name"
                    : textController.nameController.text,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                textController.bioController.text.isEmpty
                    ? "Your Headline"
                    : textController.bioController.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackTextClr,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.tileColor,
                      AppColors.tileColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                      offset: Offset(0, -6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "My Queries",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: AppColors.textColor,
                        thickness: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.5,
                      child: queryController.posts.isEmpty
                          ? Center(
                              child: Text(
                                "No Queries Yet",
                                style: TextStyle(color: AppColors.textColor),
                              ),
                            )
                          : ListView.builder(
                              itemCount: queryController.posts.length,
                              itemBuilder: (context, index) {
                                final post = queryController.posts[index];
                                final image = post.images.isNotEmpty
                                    ? post.images.first.path
                                    : AppImages.profileImage;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 15,
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: CustomNotifications(
                                      title: post.title,
                                      message: post.description,
                                      image: image,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

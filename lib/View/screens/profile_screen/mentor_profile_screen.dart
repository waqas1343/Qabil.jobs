import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_button/app_button.dart';
import 'package:qabil_project01_final/constant/app_icons/app_icons.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/custom_appbar/custom_appbar.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../view_model/controller/image_picker/image_picker_controller.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';

class MentorProfileScreen extends StatelessWidget {
  const MentorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickerController>(context);
    final textController = Provider.of<TextEditingControllerManager>(context);

    return Scaffold(
      appBar: CustomAppBar(
        profileImagePath: imageProvider.images1 != null
            ? imageProvider.images1!.path
            : 'assets/images/profileimage.png',
        actionIcon: AppIcons.logout,
        showNotificationIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.height02(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 75,
                backgroundColor: AppColors.cardsColor2,
                backgroundImage: imageProvider.images1 != null
                    ? FileImage(imageProvider.images1!)
                    : null,
                child: imageProvider.images1 == null
                    ? Icon(Icons.person, size: 75, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(height: AppSizes.height03(context)),
            CustomText(
              text: textController.nameController.text.isNotEmpty
                  ? textController.nameController.text
                  : "Your Name",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.appBackground,
                  ),
            ),
            SizedBox(height: AppSizes.height01(context)),
            CustomText(
              text: textController.bioController.text.isNotEmpty
                  ? textController.bioController.text
                  : "Your Headline",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.cardsColor2,
                    fontSize: 18,
                  ),
            ),
            SizedBox(height: AppSizes.height02(context)),
            Divider(
              color: AppColors.cardsColor2,
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(height: AppSizes.height02(context)),
            CustomButton(
              btnWidth: 200,
              btnText: 'Edit profile',
              color: AppColors.cardsColor2,
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}

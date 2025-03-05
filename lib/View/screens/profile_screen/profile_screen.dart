import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/custom_appbar/custom_appbar.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../view_model/controller/image_picker/image_picker_controller.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../constant/app_strings/appstrings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickerController>(context);
    final textController = Provider.of<TextEditingControllerManager>(context);

    return Scaffold(
      appBar: CustomAppBar(
        greeting: AppStrings.profile,
        username: textController.nameController.text.isNotEmpty
            ? textController.nameController.text
            : "Your Name",
        profileImagePath: imageProvider.images1 != null
            ? imageProvider.images1!.path
            : 'assets/images/profileimage.png',
        notificationCount: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.cardsColor2,
              backgroundImage: imageProvider.images1 != null
                  ? FileImage(imageProvider.images1!)
                  : null,
              child: imageProvider.images1 == null
                  ? Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
            SizedBox(height: AppSizes.height02(context)),
            CustomText(
              text: textController.nameController.text.isNotEmpty
                  ? textController.nameController.text
                  : "Your Name",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.height01(context)),
            CustomText(
              text: textController.bioController.text.isNotEmpty
                  ? textController.bioController.text
                  : "Your Headline",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

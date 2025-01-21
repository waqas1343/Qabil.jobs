import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../view_model/controller/image_picker/image_picker_controller.dart';
import '../../../view_model/controller/validation.dart';
import '../../../widgets/select_corse_widget/select_course_widget.dart';
import '../../../widgets/select_gender/select_gender_widget.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({super.key});
  final TextEditingController studenIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<ImagePickerController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSizes.height08(context),
            ),
            CustomText(
              text: AppStrings.completP,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
              child: courseProvider.selectingImages != null
                  ? InkWell(
                      onTap: () =>
                          courseProvider.selectingFunction(ImageSource.gallery),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            FileImage(courseProvider.selectingImages!),
                      ),
                    )
                  : InkWell(
                      onTap: () =>
                          courseProvider.selectingFunction(ImageSource.gallery),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person,
                            size: 80, color: Colors.grey[700]),
                      ),
                    ),
            ),
            SizedBox(
              height: AppSizes.height10(context),
            ),
            CustomText(
              text: AppStrings.nameText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: AppSizes.height01(context),
            ),
            AppTextFields.customTextField(
              keyboardType: TextInputType.name,
              validator: Validators.studentId,
              prefixIcon: AppIcons.emailIcon,
              hintText: AppStrings.nHintText,
              controller: studenIDController,
            ),
            SizedBox(
              height: AppSizes.height01(context),
            ),
            CustomText(
              text: AppStrings.biO,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppTextFields.customTextField(
              validator: Validators.passwordValidator,
              prefixIcon: AppIcons.emailIcon,
              hintText: AppStrings.passwordTitle,
              controller: passwordController,
            ),
            GenderDropdown(),
            CourseDropdown(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../navigation_screening/app_navigators.dart';
import '../../../routes/routes_name/routes_names.dart';
import '../../../view_model/controller/image_picker/image_picker_controller.dart';
import '../../../view_model/controller/validation.dart';
import '../../../widgets/customFlushbar/customFlushbar.dart';
import '../../../widgets/select_corse_widget/select_course_widget.dart';
import '../../../widgets/select_gender/select_gender_widget.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({super.key});

  final TextEditingController studentIDController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImagePickerController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.height08(context)),
                CustomText(
                  text: AppStrings.completP,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: AppSizes.height02(context)),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      provider.getImages();
                    },
                    child: CircleAvatar(
                      radius: 60,
                      child: provider.images1 == null
                          ? Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            )
                          : ClipOval(
                              child: Image.file(
                                provider.images1!,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height02(context)),
                CustomText(
                  text: AppStrings.nameText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: AppSizes.height01(context)),
                AppTextFields.customTextField(
                  keyboardType: TextInputType.name,
                  validator: Validators.enterName,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.nHintText,
                  controller: studentIDController,
                ),
                SizedBox(height: AppSizes.height01(context)),
                CustomText(
                  text: AppStrings.biO,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  validator: Validators.passwordValidator,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: bioController,
                ),
                SizedBox(height: AppSizes.height02(context)),
                SelectGenderWidget(),
                SizedBox(height: AppSizes.height02(context)),
                SelectCourseWidget(),
                SizedBox(height: AppSizes.height07(context)),
                CustomButton(
                  btnText: AppStrings.savebutton,
                  color: AppColors.blackTextClr,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      CustomFlushBar.customFlushBar(
                        context,
                        'Login Successfully',
                        Icons.verified,
                        Colors.green,
                      );
                      Future.delayed(const Duration(milliseconds: 1700), () {
                        AppNavigators.nextscreen(context, RouteNames.login);
                      });
                    } else {
                      CustomFlushBar.customFlushBar(
                        context,
                        'Please fill all fields',
                        Icons.info,
                        Colors.red,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

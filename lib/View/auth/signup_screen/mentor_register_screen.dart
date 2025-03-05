import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../navigation_screen/app_navigators.dart';
import '../../../routes/routes_name/routes_names.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../view_model/controller/suffix_icon_controller/suffix_icon_controller.dart';
import '../../../view_model/controller/validation.dart';
import '../../../widgets/customFlushbar/custom_flushbar.dart';

class MentorRegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MentorRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController =
        Provider.of<TextEditingControllerManager>(context, listen: false);

    final provider = Provider.of<SuffixIconController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                Center(
                  child: Image.asset(
                    AppImages.forumLogo,
                    width: 100,
                    height: 100,
                  ),
                ),
                Center(
                  child: CustomText(text: AppStrings.loginSubtitle),
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.nameText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomText(
                      text: AppStrings.mentorTab,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                AppTextFields.customTextField(
                  validator: Validators.enterName,
                  prefixIcon: AppIcons.nameIcon,
                  hintText: AppStrings.nameText,
                  controller: textController.nameController,
                ),
                CustomText(
                  text: AppStrings.email,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  validator: Validators.emailValidation,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.emailEnter,
                  controller: textController.studentIDController,
                ),
                CustomText(
                  text: AppStrings.headingPhoneNum,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleFirst,
                  keyboardType: TextInputType.phone,
                  validator: Validators.phoneNumber,
                  prefixIcon: AppIcons.phoneIcon,
                  hintText: AppStrings.phoneTitle,
                  controller: textController.passwordController,
                ),
                CustomText(
                  text: AppStrings.passwordTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleSecond,
                  validator: Validators.passwordValidator,
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.iconToggleSecond();
                    },
                    icon: provider.isVisibleSecond
                        ? AppIcons.suffixIconOnn
                        : AppIcons.suffixIconOff,
                  ),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: textController.confirmPassController,
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                CustomButton(
                  btnText: AppStrings.register,
                  color: AppColors.cardsColor2,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      CustomFlushBar.customFlushBar(
                        context,
                        'Complete your profile',
                        Icons.verified,
                        Colors.green,
                      );
                      Future.delayed(const Duration(milliseconds: 1700), () {
                        AppNavigators.nextscreen(
                            context, RouteNames.completeProfile);
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
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                Center(
                  child: Column(
                    children: [
                      CustomText(text: AppStrings.oR),
                      SizedBox(
                        height: AppSizes.height01(context),
                      ),
                      CustomText(
                        onTap: () {
                          AppNavigators.nextscreen(
                              context, RouteNames.registerStudent);
                        },
                        text: AppStrings.regAsStudent,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppStrings.haveAcount,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      onTap: () {
                        AppNavigators.nextscreen(context, RouteNames.login);
                      },
                      text: AppStrings.loginButton,
                      color: AppColors.cardsColor2,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

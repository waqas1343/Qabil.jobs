import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/view_model/controller/suffix_icon_controller/suffix_icon_controller.dart';
import 'package:qabil_app/view_model/controller/validation.dart';
import 'package:qabil_app/widgets/customFlushbar/customFlushbar.dart';



import '../../../navigation_screening/app_navigators.dart';

import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../navigation_screening/app_navigators.dart';
import '../../../routes/routes_name/routes_names.dart';

class StudentRigisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confiremPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StudentRigisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {},
                      text: AppStrings.studentId,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                AppTextFields.customTextField(
                  validator: Validators.enterName,
                  prefixIcon: AppIcons.nameIcon,
                  hintText: AppStrings.nameText,
                  controller: nameController,
                ),
                CustomText(
                  text: AppStrings.studentId,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  keyboardType: TextInputType.number,
                  validator: Validators.studentId,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.studentId,
                  controller: studentIDController,
                ),
                CustomText(
                  text: AppStrings.passwordTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleFirst,
                  validator: Validators.passwordValidator,
                  suffixIcon: IconButton(
                      onPressed: () {
                        provider.iconToggleFirst();
                      },
                      icon: provider.isVisibleFirst
                          ? AppIcons.suffixIconOnn
                          : AppIcons.suffixIconOff),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: passwordController,
                ),
                CustomText(
                  text: AppStrings.confirmPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleSecond,
                  validator: (value) {
                    return Validators.confirmPasswordValidator(
                        value, passwordController.text);
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        provider.iconToggleSecond();
                      },
                      icon: provider.isVisibleSecond
                          ? AppIcons.suffixIconOff
                          : AppIcons.suffixIconOnn),
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: confiremPassController,
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                CustomButton(
                  btnText: AppStrings.register,
                  color: AppColors.blackTextClr,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: CustomText(text: 'Login Successful')),
                      );

                      AppNavigators.nextscreen(

                      AppNavigators.changescreen(

                          context, RouteNames.completeProfiler);
                    } else {
                      CustomFlushBar.customFlushBar(context,
                          'Please fill all fields', Icons.info, Colors.red);
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
                              context, RouteNames.registersMentorScreen);
                        },
                        text: AppStrings.regAsMentor,
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

                        AppNavigators.nextscreen(

                        AppNavigators.changescreen(

                            context, RouteNames.completeProfiler);
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

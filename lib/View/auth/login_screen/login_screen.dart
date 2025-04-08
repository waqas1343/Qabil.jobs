import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_sizes/app_sizes.dart';
import 'package:qabil_project01_final/routes/routes_name/routes_names.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../navigation_screen/app_navigators.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../view_model/controller/suffix_icon_controller/suffix_icon_controller.dart';
import '../../../view_model/controller/validation.dart';
import '../../../widgets/customFlushbar/custom_flushbar.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

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
                  height: AppSizes.height15(context),
                ),
                Center(
                  child: Image.asset(
                    AppImages.forumLogo,
                    width: 120,
                    height: 120,
                  ),
                ),
                Center(
                  child: CustomText(text: AppStrings.loginSubtitle),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomText(
                  text: AppStrings.studentId,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                AppTextFields.customTextField(
                  keyboardType: TextInputType.number,
                  validator: Validators.studentId,
                  prefixIcon: AppIcons.idIcon,
                  hintText: AppStrings.studentId,
                  controller: textController.studentIDController,
                ),
                SizedBox(
                  height: AppSizes.height01(context),
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
                        ? AppIcons.suffixIconOff
                        : AppIcons.suffixIconOnn,
                  ),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: textController.passwordController,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Spacer(),
                    CustomText(
                      onTap: () {
                        AppNavigators.nextscreen(
                            context, RouteNames.forgotPassword);
                      },
                      text: AppStrings.forgotPassword,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  btnText: AppStrings.loginButton,
                  color: AppColors.cardsColor2,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      CustomFlushBar.customFlushBar(
                        context,
                        'Login Successfully',
                        Icons.verified,
                        Colors.green,
                      );
                      Future.delayed(const Duration(milliseconds: 1700), () {
                        AppNavigators.nextscreen(
                            context, RouteNames.bottomNavBar);
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
                  height: 16,
                ),
                Center(
                  child: Column(
                    children: [
                      CustomText(text: AppStrings.oR),
                      SizedBox(height: 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

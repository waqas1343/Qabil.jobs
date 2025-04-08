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

class ResetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController =
        Provider.of<TextEditingControllerManager>(context, listen: false);
    final provider = Provider.of<SuffixIconController>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.05), // Top Spacing
                  Center(
                    child: Image.asset(
                      AppImages.forumLogo,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  SizedBox(height: AppSizes.height03(context)),
                  Center(
                    child: CustomText(
                      text: AppStrings.resetPassword,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: AppSizes.height02(context)),
                  Center(
                    child: CustomText(
                      text: AppStrings.resetTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: AppSizes.height04(context)),

                  // Password Field
                  CustomText(
                    text: AppStrings.passwordTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppTextFields.customTextField(
                    obscureText: provider.isVisibleFirst,
                    suffixIcon: IconButton(
                      onPressed: () => provider.iconToggleFirst(),
                      icon: provider.isVisibleFirst
                          ? AppIcons.suffixIconOnn
                          : AppIcons.suffixIconOff,
                    ),
                    validator: Validators.passwordValidator,
                    prefixIcon: AppIcons.passwordIcon,
                    hintText: AppStrings.passwordTitle,
                    controller: textController.confirmPassController,
                  ),
                  SizedBox(height: AppSizes.height02(context)),

                  // Confirm Password Field
                  CustomText(
                    text: AppStrings.confirmPassword,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppTextFields.customTextField(
                    obscureText: provider.isVisibleSecond,
                    validator: (value) => Validators.confirmPasswordValidator(
                        value, textController.confirmPassController.text),
                    suffixIcon: IconButton(
                      onPressed: () => provider.iconToggleSecond(),
                      icon: provider.isVisibleSecond
                          ? AppIcons.suffixIconOff
                          : AppIcons.suffixIconOnn,
                    ),
                    prefixIcon: AppIcons.passwordIcon,
                    hintText: AppStrings.passwordTitle,
                    controller: textController.passwordController,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.05), // Button Spacing

                  // Submit Button
                  Center(
                    child: CustomButton(
                      btnText: AppStrings.loginButton,
                      color: AppColors.cardsColor2,
                      ontap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          CustomFlushBar.customFlushBar(
                            context,
                            'Your password is changed',
                            Icons.verified,
                            Colors.green,
                          );
                          Future.delayed(const Duration(milliseconds: 1700),
                              () {
                            AppNavigators.nextscreen(context, RouteNames.login);
                          });
                        } else {
                          CustomFlushBar.customFlushBar(
                            context,
                            'Wrong Password',
                            Icons.info,
                            Colors.red,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

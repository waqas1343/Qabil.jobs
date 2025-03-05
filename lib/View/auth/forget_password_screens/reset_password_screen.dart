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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                Center(
                  child: Image.asset(
                    AppImages.forumLogo,
                    width: 169,
                    height: 169,
                  ),
                ),
                SizedBox(
                  height: AppSizes.height03(context),
                ),
                CustomText(
                  text: AppStrings.resetPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                CustomText(
                  text: AppStrings.resetTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                CustomText(
                  text: AppStrings.passwordTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleFirst,
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("object");
                      provider.iconToggleFirst();
                    },
                    icon: provider.isVisibleFirst
                        ? AppIcons.suffixIconOnn
                        : AppIcons.suffixIconOff,
                  ),
                  validator: Validators.passwordValidator,
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: textController.confirmPassController,
                ),
                SizedBox(
                  height: AppSizes.height01(context),
                ),
                CustomText(
                  text: AppStrings.confirmPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  obscureText: provider.isVisibleSecond,
                  validator: (value) => Validators.confirmPasswordValidator(
                      value, textController.confirmPassController.text),
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("object");
                      provider.iconToggleSecond();
                    },
                    icon: provider.isVisibleSecond
                        ? AppIcons.suffixIconOff
                        : AppIcons.suffixIconOnn,
                  ),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: textController.passwordController,
                ),
                SizedBox(
                  height: AppSizes.height06(context),
                ),
                CustomButton(
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
                      Future.delayed(const Duration(milliseconds: 1700), () {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

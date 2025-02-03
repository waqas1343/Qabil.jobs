import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_button/app_button.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_icons/app_icons.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';
import 'package:qabil_app/constant/app_sizes/app_sizes.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/constant/custom_text/custom_text.dart';
import 'package:qabil_app/constant/custom_textfield/custom_textield.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/view_model/controller/suffix_icon_controller/suffix_icon_controller.dart';
import 'package:qabil_app/view_model/controller/validation.dart';

import '../../../navigation_screening/app_navigators.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ResetPasswordScreen({super.key});

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
                  controller: _confirmPassController,
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
                      value, _confirmPassController.text),
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("object");
                      provider.iconToggleSecond();
                    },
                    icon: provider.isVisibleSecond
                        ? AppIcons.suffixIconOnn
                        : AppIcons.suffixIconOff,
                  ),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: passwordController,
                ),
                SizedBox(
                  height: AppSizes.height06(context),
                ),
                CustomButton(
                  btnText: AppStrings.loginButton,
                  color: AppColors.blackTextClr,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: CustomText(text: 'Login Successful')),
                      );

                      AppNavigators.changescreen(context, RouteNames.login);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please correct the errors")),
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

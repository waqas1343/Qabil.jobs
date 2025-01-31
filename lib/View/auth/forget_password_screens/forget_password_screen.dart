import 'package:flutter/material.dart';

import '../../../Navigation_screening/app_navigators.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../routes/routes_name/routes_names.dart';
import '../../../view_model/controller/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.height08(context),
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
                  text: AppStrings.forgotPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                CustomText(
                  text: AppStrings.forgetTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                CustomText(
                  text: AppStrings.email,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                AppTextFields.customTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.emailValidation,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.enteremail,
                  controller: emailController,
                ),
                SizedBox(
                  height: AppSizes.height08(context),
                ),
                CustomButton(
                  btnText: AppStrings.loginButton,
                  color: AppColors.blackTextClr,
                  ontap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: CustomText(text: 'Login Successful')),
                      );

                      AppNavigators.nextscreen(context, RouteNames.enterotp);
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

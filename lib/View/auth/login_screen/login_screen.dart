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
import 'package:qabil_app/view_model/controller/validation.dart';



import '../../../navigation_screening/app_navigators.dart';
import '../../../view_model/controller/suffix_icon_controller/suffix_icon_controller.dart';
import '../../../widgets/customFlushbar/customFlushbar.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController studenIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

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
                  height: AppSizes.height08(context),
                ),
                Center(
                  child: Image.asset(
                    AppImages.forumLogo,
                    width: 169,
                    height: 169,
                  ),
                ),
                Center(
                  child: CustomText(text: AppStrings.loginSubtitle),
                ),
                SizedBox(
                  height: AppSizes.height10(context),
                ),
                CustomText(
                  text: AppStrings.studentId,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSizes.height01(context),
                ),
                AppTextFields.customTextField(
                  keyboardType: TextInputType.number,
                  validator: Validators.studentId,
                  prefixIcon: AppIcons.emailIcon,
                  hintText: AppStrings.studentId,
                  controller: studenIDController,
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
                      print("object");
                      provider.iconToggleFirst();
                    },
                    icon: provider.isVisibleFirst
                        ? AppIcons.suffixIconOnn
                        : AppIcons.suffixIconOff,
                  ),
                  prefixIcon: AppIcons.passwordIcon,
                  hintText: AppStrings.passwordTitle,
                  controller: passwordController,
                ),
                SizedBox(
                  height: AppSizes.height01(context),
                ),
                Row(
                  children: [
                    const Spacer(),
                    CustomText(
                      onTap: () {
                        AppNavigators.nextscreen(
                            context, RouteNames.forgotpassword);
                      },
                      text: AppStrings.forgotPassword,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height04(context),
                ),
                CustomButton(
                  btnText: AppStrings.loginButton,
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

                        AppNavigators.nextscreen(

                        AppNavigators.changescreen(

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

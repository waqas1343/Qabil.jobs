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
import '../../../view_model/controller/validation.dart';
import '../../../widgets/customFlushbar/custom_flushbar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController =
        Provider.of<TextEditingControllerManager>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Center(
                child: Image.asset(
                  AppImages.forumLogo,
                  width: 120,
                  height: 120,
                ),
              ),
              SizedBox(height: AppSizes.height01(context)),
              CustomText(
                text: AppStrings.forgotPassword,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: AppSizes.height02(context)),
              CustomText(
                text: AppStrings.forgetTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: AppSizes.height04(context)),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    AppTextFields.customTextField(
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.emailValidation,
                      prefixIcon: AppIcons.emailIcon,
                      hintText: AppStrings.enteremail,
                      controller: textController.emailController,
                    ),
                    SizedBox(height: AppSizes.height03(context)),
                  ],
                ),
              ),
              CustomButton(
                btnText: AppStrings.forgotSendbutton,
                color: AppColors.cardsColor2,
                ontap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    CustomFlushBar.customFlushBar(
                      context,
                      'Email sent successfully',
                      Icons.verified,
                      Colors.green,
                    );
                    Future.delayed(const Duration(milliseconds: 1700), () {
                      AppNavigators.nextscreen(context, RouteNames.enterOtp);
                    });
                  } else {
                    CustomFlushBar.customFlushBar(
                      context,
                      'Email is required',
                      Icons.info,
                      Colors.red,
                    );
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/view_model/controller/validation.dart';
import '../../../navigation_screening/app_navigators.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_images/app_images.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../routes/routes_name/routes_names.dart';
import '../../../widgets/customFlushbar/customFlushbar.dart';

class EnterOtp extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: AppColors.blackTextClr,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.indicatorColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  EnterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSizes.height07(context),
                ),
                Center(
                  child: Image.asset(
                    AppImages.forumLogo,
                    width: 169,
                    height: 169,
                  ),
                ),
                SizedBox(
                  height: AppSizes.height10(context),
                ),
                CustomText(
                  text: AppStrings.forgetOTPTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: AppSizes.height06(context)),
                Pinput(
                  validator: Validators.otpValidator,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.height02(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t receive an OTP? ',
                    ),
                    InkWell(
                      child: Text(
                        'Resend',
                        style: TextStyle(color: AppColors.cardsColor2),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.height06(context),
                ),
                CustomButton(
                    btnText: AppStrings.confirim,
                    color: AppColors.cardsColor2,
                    ontap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        CustomFlushBar.customFlushBar(
                          context,
                          'OTP has been verify',
                          Icons.verified,
                          Colors.green,
                        );
                        Future.delayed(const Duration(milliseconds: 1700), () {
                          AppNavigators.nextscreen(
                              context, RouteNames.resetPassScreen);
                        });
                      } else {
                        CustomFlushBar.customFlushBar(
                          context,
                          'Can’t verify OTP',
                          Icons.info,
                          Colors.red,
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

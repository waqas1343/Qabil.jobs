import 'package:qabil_app/constant/app_strings/appstrings.dart';

class Validators {
  static String? enterName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.vEnterName;
    }
    return null;
  }

  static String? studentId(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.studentID;
    }

    if (value.length < 6) {
      return 'Enter Bano Qabil Givin ID';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.vEmailRequired;
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return AppStrings.validEmail;
    }

    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    if (value.length < 11) {
      return 'phone number is not valid';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number ';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    if (value.length < 6) {
      return AppStrings.passwordmust;
    }

    return null;
  }

  static String? confirmPasswordValidator(
      String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.confirmPasswordR;
    }

    if (confirmPassword != password) {
      return AppStrings.passwordMatchE;
    }

    return null;
  }

  static String? otpValidator(String? otp) {
    if (otp == null || otp.isEmpty) {
      return 'Please enter the OTP';
    }

    if (otp.length != 4) {
      return 'OTP should be 4 digits';
    }

    return null;
  }
}

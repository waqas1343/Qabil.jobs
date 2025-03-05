
import '../../constant/app_strings/appstrings.dart';

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
      return 'Enter Bano Qabil Given ID';
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

    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
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

    if (otp.length != 4 || !RegExp(r'^\d{4}$').hasMatch(otp)) {
      return 'OTP should be exactly 4 digits';
    }

    return null;
  }

  static String? genderValidator(String? gender) {
    if (gender == null || gender.isEmpty) {
      return AppStrings.genderSelect;
    }
    return null;
  }

  static String? courseValidator(List<String> selectedCourses) {
    if (selectedCourses.isEmpty) {
      return 'Please select at least one course';
    }
    return null;
  }
}

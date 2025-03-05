import 'package:flutter/material.dart';

class TextEditingControllerManager extends ChangeNotifier {
  static final TextEditingControllerManager _instance =
      TextEditingControllerManager._internal();

  factory TextEditingControllerManager() {
    return _instance;
  }

  TextEditingControllerManager._internal();

  final TextEditingController studentIDController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController postTitleController = TextEditingController();
  final TextEditingController postQueryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    studentIDController.dispose();
    bioController.dispose();
    postTitleController.dispose();
    postQueryController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    nameController.dispose();
    super.dispose();
  }
}

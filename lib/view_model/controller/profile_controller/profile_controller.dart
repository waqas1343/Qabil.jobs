

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController editnameController = TextEditingController();
  TextEditingController editbioController = TextEditingController();

  File? image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        notifyListeners();
      } else {
        debugPrint('No image selected.');
      }
    } catch (e) {
      debugPrint('Error while picking image: $e');
    }
  }
}
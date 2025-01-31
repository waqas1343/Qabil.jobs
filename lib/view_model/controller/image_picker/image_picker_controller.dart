import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends ChangeNotifier {
  File? selectedImage;

  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(source: source);
      
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        notifyListeners();
      } else {
        debugPrint('No image selected.');
      }
    } catch (e) {
      debugPrint('Error while picking image: $e');
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends ChangeNotifier {
  File? selectingImages;

  Future<void> selectingFunction(ImageSource source) async {
    try {
      final imageVeriable = ImagePicker();
      final pickerFile = await imageVeriable.pickImage(source: source);
      if (pickerFile != null) {
        selectingImages = File(pickerFile.path);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error while picking image: $e');
    }
  }
}

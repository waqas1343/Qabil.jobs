import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends ChangeNotifier {
  File? images1;
  final pickeer = ImagePicker();

  Future getImages() async {
    final images = await pickeer.pickImage(source: ImageSource.gallery);
    if (images != null) {
      images1 = File(images.path);
    } else {
      print('image not selected');
    }
    notifyListeners();
  }
}

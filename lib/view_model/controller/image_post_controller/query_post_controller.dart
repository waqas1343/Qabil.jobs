import 'dart:io';

import 'package:flutter/material.dart';

class QueryPostController extends ChangeNotifier{
    final List<File> images = [];

  void addImage(File image) {
    images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }
    void clearImages() {
    images.clear();
    notifyListeners();
  }
}
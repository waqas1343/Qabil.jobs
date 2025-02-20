import 'dart:io';

import 'package:flutter/material.dart';

class QueryPostController extends ChangeNotifier{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController queryDescriptionController = TextEditingController();
  final List<File> _images = [];

  List<File> get images => _images;

  void addImage(File image) {
    _images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  void clearData() {
    nameController.clear();
    queryDescriptionController.clear();
    _images.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    queryDescriptionController.dispose();
    super.dispose();
  }
}
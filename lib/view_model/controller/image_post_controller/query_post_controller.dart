import 'dart:io';
import 'package:flutter/material.dart';

class QueryPostController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController queryDescriptionController =
      TextEditingController();

  List<File> images = [];

  void addImage(File image) {
    images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  void clearFields() {
    nameController.clear();
    queryDescriptionController.clear();
    images.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    queryDescriptionController.dispose();
    super.dispose();
  }
}

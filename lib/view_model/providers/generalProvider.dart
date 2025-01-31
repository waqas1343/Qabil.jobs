import 'dart:io';

import 'package:flutter/material.dart';


class GeneralProvider extends ChangeNotifier {
  bool isVisibleFirst = true;

  void iconToggleFirst() {
    isVisibleFirst = !isVisibleFirst;
    notifyListeners();
  }

  bool isVisibleSecond = true;

  void iconToggleSecond() {
    isVisibleSecond = !isVisibleSecond;
    notifyListeners();
  }

  final List<File> images = [];

  void addImage(File image) {
    images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  //category selectors

  int iconSelect = 0;
  double? iconSize;
  void isSelected(int index) {
    iconSelect = index;
    iconSelect == iconSize;
    notifyListeners();
  }

  
}

import 'dart:io';

import 'package:flutter/material.dart';


class GeneralProvider extends ChangeNotifier {




  int pageIndex = 0;
  bool isClick1 = false;

  void colorChange1() {
    isClick1 = !isClick1;
    notifyListeners();
  }

  void setBotttomNaviagtionIndex(int index) {
    pageIndex = index;
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

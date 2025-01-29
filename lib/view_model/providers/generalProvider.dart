import 'dart:io';

import 'package:flutter/material.dart';


import '../../constant/select_Imagesource/select_image_source.dart'; // Make sure this widget is defined


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

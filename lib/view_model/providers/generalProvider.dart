
import 'dart:io';

import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier{

  bool isVisibleFirst = true;
  void iconToggleFirst(){
    isVisibleFirst = !isVisibleFirst;
    notifyListeners();
  }


  bool isVisibleSecond = true;
  void iconToggleSecond(){
    isVisibleSecond = !isVisibleSecond;
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

  //profile mentor camera

final List<File> image = [];
  void addImage(File images){
    image.add(images);
    notifyListeners();
  }
  void removeImage(index){
    image.removeAt(index);
    notifyListeners();
  }

}
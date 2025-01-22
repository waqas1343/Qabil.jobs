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
}

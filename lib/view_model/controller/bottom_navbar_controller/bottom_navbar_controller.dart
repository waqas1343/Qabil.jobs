import 'package:flutter/material.dart';

class BottomNavbarController extends ChangeNotifier{
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
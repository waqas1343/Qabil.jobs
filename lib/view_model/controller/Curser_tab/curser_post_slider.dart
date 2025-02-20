import 'package:flutter/material.dart';

class CurserPostSlider extends ChangeNotifier {
  int curserValue = 0;
  int curserValue2 = 0;

  void setCurserValue(int value) {
    curserValue = value;
    notifyListeners();
  }

  void updateCurserValue(int newIndex) {
    curserValue2 = newIndex;
    notifyListeners();
  }

}
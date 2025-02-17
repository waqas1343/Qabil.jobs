import 'package:flutter/material.dart';

class CurserSlider extends ChangeNotifier {
  int curserValue = 0;

  void setCurserValue(int value) {
    curserValue = value;
    notifyListeners();
  }
}

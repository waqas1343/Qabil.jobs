import 'package:flutter/material.dart';

class IconSelecting extends ChangeNotifier {
  int iconSelect = 0;
  double? iconSize;
  void isSelected(int index) {
    iconSelect = index;
    iconSelect == iconSize;
    notifyListeners();
  }
}

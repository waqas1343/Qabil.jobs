import 'package:flutter/material.dart';

class Providerc extends ChangeNotifier {
  int? selectedIndex;

 

  void toggleSelection(int index) {
    selectedIndex = selectedIndex == index ? null : index;
    notifyListeners();
  }
}

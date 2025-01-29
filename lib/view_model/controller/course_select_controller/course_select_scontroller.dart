import 'package:flutter/material.dart';

class Providerc with ChangeNotifier {
  int? selectedIndex;

 

  void toggleSelection(int index) {
    selectedIndex = selectedIndex == index ? null : index;
    notifyListeners();
  }
}

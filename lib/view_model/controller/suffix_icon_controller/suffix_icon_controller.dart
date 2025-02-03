import 'package:flutter/material.dart';

class SuffixIconController extends ChangeNotifier{
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
}
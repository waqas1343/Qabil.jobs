import 'package:flutter/material.dart';

class BottomRollController extends ChangeNotifier {
  int _pageIndex = 0;
  String _role = "student"; 

  int get pageIndex => _pageIndex;
  String get role => _role;

  void setBotttomNaviagtionIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setRole(String newRole) {
    _role = newRole;
    notifyListeners();
  }
}

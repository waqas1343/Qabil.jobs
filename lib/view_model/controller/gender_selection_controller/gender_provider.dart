import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier {
  String? selectedGender;


  void selectGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
}

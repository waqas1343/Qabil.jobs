import 'package:flutter/material.dart';

class ListPractice extends ChangeNotifier {
  List<String> studentsName = ['Waqas', 'Ali', 'Ahmed', 'Sara', 'Zara'];
  List<String> studentAdded = [];
  String? selectedItem;
  Map<String, bool> studentChecked = {};

  void toggleCheckbox(String studentName) {
    studentChecked[studentName] = !(studentChecked[studentName] ?? false);
    notifyListeners();
  }

  void selectItem(String? value) {
    selectedItem = value;
    if (value != null && !studentAdded.contains(value)) {
      studentAdded.add(value);
    }
    notifyListeners();
  }

  void removeSelectedItem(String item) {
    studentAdded.remove(item);
    notifyListeners();
  }

  List<String> get selectedItems => studentAdded;
}

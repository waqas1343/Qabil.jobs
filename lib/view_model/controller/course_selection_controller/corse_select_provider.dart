import 'package:flutter/material.dart';

class ListPractice extends ChangeNotifier {
  List<String> selectCourse = [
    'Flutter Development',
    'Web Development',
    'Graphic Designing',
    'UI/UX Designing',
    'Digital Marketing',
    'Video Editing & Animation',
    'Amazon FBA',
    'Cyber Security',
    'Game Development',
    'MERN Stack Development',
    'Data Science & Machine Learning',
    'Python Programming',
    'Mobile App Development',
    'Artificial Intelligence',
    'Blockchain Development'
  ];

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

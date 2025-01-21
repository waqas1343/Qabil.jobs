import 'package:flutter/material.dart';

class CourseProvider with ChangeNotifier {
  final List<String> selectedCourses = [];

  void addCourse(String course) {
    if (!selectedCourses.contains(course)) {
      selectedCourses.add(course);
      notifyListeners();
    }
  }

  void removeCourse(String course) {
    selectedCourses.remove(course);
    notifyListeners();
  }
}

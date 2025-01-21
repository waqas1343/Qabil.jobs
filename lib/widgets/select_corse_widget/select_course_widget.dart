import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_sizes/app_sizes.dart';
import '../../../view_model/providers/corse_select_provider.dart';

class CourseDropdown extends StatelessWidget {
  final List<String> courses = [
    'Web Development',
    'Flutter Development',
    'Graphic Designing',
    'Data Science',
    'Digital Marketing',
  ];

  CourseDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizes.height02(context),
        ),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.height08(context), vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
              hint: const Text(
                'Select a course',
                style: TextStyle(color: Colors.grey),
              ),
              value: null,
              icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade600),
              underline: SizedBox.shrink(),
              items: courses.map((course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  courseProvider.addCourse(value);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Material(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: courseProvider.selectedCourses.map((course) {
              return Chip(
                label: Text(
                  course,
                  style: const TextStyle(fontSize: 14),
                ),
                backgroundColor: Colors.blue.shade50,
                labelStyle: TextStyle(color: Colors.blue.shade800),
                deleteIcon: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.blue.shade800,
                ),
                onDeleted: () => courseProvider.removeCourse(course),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.blue.shade200),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

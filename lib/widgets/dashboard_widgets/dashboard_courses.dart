import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/Lists/courses_category_list.dart';
import '../../view_model/controller/course_select_controller/course_select_scontroller.dart';

class DashboardCourses extends StatelessWidget {
  const DashboardCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final proProvider = Provider.of<Providerc>(context);

    return Column(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = proProvider.selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  proProvider.toggleSelection(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                      ),
                      height: isSelected ? 50 : 50,
                      width: isSelected ? 50 : 50,
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: Image.asset(
                          categories[index]['image']!,
                          height: isSelected ? 50 : 50,
                          width: isSelected ? 50 : 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]['name']!,
                      style: TextStyle(
                        fontSize: isSelected ? 16 : 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.blue : Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

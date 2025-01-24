import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/Lists/courses_category_list.dart';
import '../../view_model/controller/course_select_controller/course_select_scontroller.dart';

class Practice extends StatelessWidget {
  Practice({super.key});

  @override
  Widget build(BuildContext context) {
    final proProvider = Provider.of<Providerc>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            width: double.infinity,
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
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                        height: isSelected ? 80 : 50,
                        width: isSelected ? 80 : 50,
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: Image.asset(
                            categories[index]['image']!,
                            height: isSelected ? 100 : 80,
                            width: isSelected ? 100 : 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (!isSelected) const SizedBox(height: 8),
                      if (!isSelected)
                        Text(
                          categories[index]['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/app_sizes/app_sizes.dart';
import '../../constant/app_strings/appstrings.dart';
import '../../constant/custom_text/custom_text.dart';
import '../../view_model/controller/validation.dart';
import '../../view_model/providers/corse_select_provider.dart';

class SelectCourseWidget extends StatelessWidget {
  const SelectCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final proProvider = Provider.of<ListPractice>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.5,
              ),
            ),
            errorStyle: TextStyle(
              color: const Color.fromARGB(255, 24, 206, 166),
              fontSize: 10,
            ),
          ),
          dropdownColor: Colors.white,
          hint: CustomText(
            text: AppStrings.course,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          items: proProvider.studentsName.map((student) {
            return DropdownMenuItem<String>(
              value: student,
              child: Consumer<ListPractice>(
                builder: (context, value1, child) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      value1.toggleCheckbox(student);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student,
                          style: const TextStyle(color: Colors.black),
                        ),
                        Checkbox(
                          activeColor: Colors.blue,
                          value: value1.studentChecked[student] ?? false,
                          onChanged: (value) {
                            value1.toggleCheckbox(student);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (_) {},
          validator: (value) {
            return Validators.courseValidator(proProvider.studentChecked.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList());
          },
        ),
        SizedBox(height: AppSizes.height01(context)),
        Wrap(
          spacing: 6.0,
          children: proProvider.studentChecked.entries
              .where((entry) => entry.value == true)
              .map((entry) {
            return Chip(
              label: Text(
                entry.key,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () {
                proProvider.toggleCheckbox(entry.key);
              },
              backgroundColor: Colors.grey.shade300,
            );
          }).toList(),
        ),
      ],
    );
  }
}

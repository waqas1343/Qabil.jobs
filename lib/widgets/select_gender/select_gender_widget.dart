import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import '../../constant/app_strings/appstrings.dart';
import '../../constant/custom_text/custom_text.dart';
import '../../view_model/providers/select gender.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: AppColors.textColorGrey,
                width: 1.5,
              ),
            ),
          ),
          dropdownColor: Colors.white,
          hint: CustomText(
            text: AppStrings.gender,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: genderProvider.selectedGender,
          items: ['Male', 'Female'].map((gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              genderProvider.selectGender(value);
            }
          },
          isExpanded: true,
        ),
      ],
    );
  }
}

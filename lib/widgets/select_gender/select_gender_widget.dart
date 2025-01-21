import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/providers/select gender.dart';

class GenderDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Material(
          child: DropdownButton<String>(
            hint: Text('Select Gender'),
            value: genderProvider.selectedGender,
            items: ['Male', 'Female'].map((gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                genderProvider.selectGender(value);
              }
            },
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}

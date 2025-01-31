import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? hintText;
  final String? value;
  final Function(String?)? onChanged;
  final String? errorText;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}
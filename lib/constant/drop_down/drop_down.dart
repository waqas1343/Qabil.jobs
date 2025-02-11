import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? hintText;
  final String? value;
  final Function(String?)? onChanged;
  final String? errorText;

  const CustomDropdown({
    super.key,
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

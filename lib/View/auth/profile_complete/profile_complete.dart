import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/constant/custom_text/custom_text.dart';
import 'package:qabil_app/constant/drop_down/drop_down.dart';

import '../../../Navigation_screening/app_navigators.dart';
import '../../../constant/app_button/app_button.dart';
import '../../../constant/app_colours/appcolors.dart';
import '../../../constant/app_icons/app_icons.dart';
import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../routes/routes_name/routes_names.dart';
import '../../../view_model/controller/validation.dart';

class ProfileComplete extends StatelessWidget {
  ProfileComplete({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> selectedCourses = []; // List to store selected courses

  @override
  Widget build(BuildContext context) {
    String? selectedGender;
    String? selectedDomain;
    final ValueNotifier<File?> _image = ValueNotifier<File?>(null);
    final ImagePicker _picker = ImagePicker();

    Future<void> _pickImage(ImageSource source) async {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        _image.value = File(pickedFile.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.completeTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10),
              Center(
                child: ValueListenableBuilder<File?>(
                  valueListenable: _image,
                  builder: (context, file, child) {
                    return GestureDetector(
                      onTap: () => _pickImage(ImageSource.camera),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: file != null ? FileImage(file) : null,
                        child: file == null
                            ? Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.grey[600],
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: AppStrings.nameText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFields.customTextField(
                keyboardType: TextInputType.name,
                validator: Validators.enterName,
                prefixIcon: AppIcons.nameIcon,
                hintText: AppStrings.nameText,
                controller: nameController,
              ),
              CustomText(
                text: AppStrings.bio,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppTextFields.customTextField(
                keyboardType: TextInputType.multiline,
                validator: Validators.studentId,
                prefixIcon: AppIcons.bio,
                hintText: AppStrings.studentId,
                controller: bioController,
              ),
              CustomText(
                text: AppStrings.gender,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomDropdown(
                items: [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                ],
                hintText: 'Select Gender',
                value: selectedGender,
                onChanged: (newValue) {
                  selectedGender = newValue;
                },
                errorText: null,
              ),
              CustomText(
                text: AppStrings.domain,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomDropdown(
                items: [
                  DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
                  DropdownMenuItem(
                      value: 'Amazon FBA', child: Text('Amazon FBA')),
                  DropdownMenuItem(value: 'DevOps', child: Text('DevOps')),
                  DropdownMenuItem(
                      value: 'Marketing', child: Text('Marketing')),
                  DropdownMenuItem(value: 'SQA', child: Text('SQA')),
                  DropdownMenuItem(value: 'Hacking', child: Text('Hacking')),
                  DropdownMenuItem(value: 'Gaming', child: Text('Gaming')),
                ],
                hintText: 'Select Course',
                value: null,
                onChanged: (newValue) {
                  if (newValue != null && !selectedCourses.contains(newValue)) {
                    selectedCourses.add(newValue);
                  }
                },
                errorText: null,
              ),
              Wrap(
                children: selectedCourses.map((course) {
                  return Chip(
                    label: Text(course),
                    onDeleted: () {
                      selectedCourses.remove(course);
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              CustomButton(
                btnText: AppStrings.loginButton,
                color: AppColors.blackTextClr,
                ontap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              CustomText(text: 'Profile Updated Successfully')),
                    );

                    AppNavigators.changescreen(
                        context, RouteNames.registersMentorScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please correct the errors")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

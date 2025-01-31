import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/constant/custom_text/custom_text.dart';
import 'package:qabil_app/constant/select_Imagesource/select_image_source.dart';
import 'package:qabil_app/view_model/providers/generalProvider.dart';

import '../../../constant/custom_textfield/custom_textield.dart';

class QueryInfo extends StatelessWidget {
  const QueryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage(ImageSource source) async {
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        context.read<GeneralProvider>().addImage(File(pickedFile.path));
      }
    }

    final TextEditingController name = TextEditingController();
    final TextEditingController querydes = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Query Information"),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
              ),
            ),
          ],
        ),
        body: Consumer<GeneralProvider>(
          builder: (context, query, child) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.addquery,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFields.customTextField(
                      hintText: AppStrings.nameText, controller: name),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: querydes,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Query Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 50,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SelectImageSource(
                                  icon: Icons.camera_alt,
                                  title: AppStrings.addaphoto,
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.camera);
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SelectImageSource(
                                  icon: Icons.photo_library,
                                  title: AppStrings.insertgallery,
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Icon(
                            Icons.add_a_photo,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: AppStrings.addaphoto,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(
                        query.images.length,
                        (index) {
                          return Chip(
                            avatar: CircleAvatar(
                              backgroundImage: FileImage(query.images[index]),
                            ),
                            label: Text("Image ${index + 1}"),
                            deleteIcon: Icon(Icons.cancel),
                            onDeleted: () => query.removeImage(index),
                            backgroundColor: Colors.grey[300],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: AppStrings.postquery,
                        color: AppColors.appBackground,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/constant/custom_text/custom_text.dart';

import '../../../constant/custom_textfield/custom_textield.dart';
import '../../../view_model/controller/image_post_controller/query_post_controller.dart';
import '../../../widgets/select_Imagesource/select_image_source.dart';

class QueryInfo extends StatelessWidget {
   QueryInfo({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController queryDescriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage(ImageSource source) async {
      try {
        final XFile? pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          context.read<QueryPostController>().addImage(File(pickedFile.path));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
        );
      }
    }



    void postQuery() {



      // Clear the form after posting
      nameController.clear();
      queryDescriptionController.clear();
      context.read<QueryPostController>().clearImages();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Query posted successfully!')),
      );
    }

    return Scaffold(

      body: Consumer<QueryPostController>(
        builder: (context, query, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.addquery,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Spacer(),

                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.close),)
                  ],
                ),
                const SizedBox(height: 20),
                AppTextFields.customTextField(
                  hintText: AppStrings.nameText,
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: queryDescriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Query Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                              const SizedBox(height: 20),
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
                        const Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        CustomText(
                          text: AppStrings.addaphoto,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                          deleteIcon: const Icon(Icons.cancel),
                          onDeleted: () => query.removeImage(index),
                          backgroundColor: Colors.grey[300],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: postQuery,
                  child: Container(
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
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}




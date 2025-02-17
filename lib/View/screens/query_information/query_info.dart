import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constant/custom_text/custom_text.dart';
import '../../../view_model/controller/image_post_controller/query_post_controller.dart';
import '../../../widgets/select_Imagesource/select_image_source.dart';

class QueryInfo extends StatelessWidget {
  QueryInfo({super.key});

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(BuildContext context, ImageSource source) async {
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

  @override
  Widget build(BuildContext context) {
    final queryController = context.watch<QueryPostController>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: "Add Query",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: queryController.nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: queryController.queryDescriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Query Description",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectImageSource(
                            icon: Icons.camera_alt,
                            title: "Take Photo",
                            onTap: () {
                              Navigator.pop(context);
                              pickImage(context, ImageSource.camera);
                            },
                          ),
                          const SizedBox(height: 20),
                          SelectImageSource(
                            icon: Icons.photo_library,
                            title: "Choose from Gallery",
                            onTap: () {
                              Navigator.pop(context);
                              pickImage(context, ImageSource.gallery);
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
                    const Icon(Icons.add_a_photo, color: Colors.grey),
                    const SizedBox(width: 10),
                    CustomText(text: "Add a Photo", color: Colors.grey),
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
                  queryController.images.length,
                  (index) {
                    return Chip(
                      avatar: CircleAvatar(
                        backgroundImage: FileImage(queryController.images[index]),
                      ),
                      label: Text("Image ${index + 1}"),
                      deleteIcon: const Icon(Icons.cancel),
                      onDeleted: () => queryController.removeImage(index),
                      backgroundColor: Colors.grey[300],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Query Post Logic
                final name = queryController.nameController.text.trim();
                final description = queryController.queryDescriptionController.text.trim();
                if (name.isEmpty || description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your name and query description')),
                  );
                  return;
                }

                print('Name: $name');
                print('Description: $description');
                print('Images: ${queryController.images}');

                // Clear the form after posting
                queryController.clearFields();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Query posted successfully!')),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomText(
                    text: "Post Query",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

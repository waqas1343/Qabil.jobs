import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings/appstrings.dart';
import '../../../view_model/controller/image_post_controller/query_post_controller.dart';
import '../../../widgets/select_Imagesource/select_image_source.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage(ImageSource source) async {
      File? image;
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        // File newImage = File(pickedFile.path);
        // // print("Image");
        // context.read<QueryPostController>().addImage(newImage);
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Consumer<QueryPostController>(
          builder: (context, click, child) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              (click.images != null && click.images.isNotEmpty)
                                  ? FileImage(click.images.last)
                                  : null,
                          child: (click.images == null || click.images.isEmpty)
                              ? Icon(Icons.camera_alt,
                                  size: 50, color: Colors.white)
                              : null,
                        ),

                        // backgroundImage: click.images.isNotEmpty
                        //     ? FileImage(click.images[0])
                        //     : null,
                        // child: click.images.isEmpty
                        //     ? Icon(
                        //   Icons.person,
                        //   size: 50,
                        //   color: Colors.white,
                        // ),
                        //     : null,
                        // ),
                        Positioned(
                          bottom: -5,
                          right: -4,
                          child: IconButton(
                            onPressed: () {
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
                                          icon: Icons.add_a_photo,
                                          title: AppStrings.addaphoto,
                                          onTap: () {
                                            Navigator.pop(context);
                                            picker.pickImage(
                                                source: ImageSource.camera);
                                          },
                                          // onTap: () async {
                                          //   Navigator.pop(context);
                                          //   final XFile? pickedFile = await picker.pickImage(
                                          //       source: ImageSource.camera);
                                          //   if (pickedFile != null) {
                                          //     File newImage = File(pickedFile.path);
                                          //     // print("Image");
                                          //     context.read<QueryPostController>().addImage(newImage);
                                          //   }
                                          //
                                          // },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SelectImageSource(
                                          icon: Icons.photo_library,
                                          title: AppStrings.insertgallery,
                                          onTap: () {
                                            Navigator.pop(context);
                                            picker.pickImage(
                                                source: ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
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

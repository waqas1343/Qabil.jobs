import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';
import 'package:qabil_app/constant/select_Imagesource/select_image_source.dart';
import '../../../view_model/controller/image_post_controller/query_post_controller.dart';

class ProfileMentor extends StatelessWidget {
  const ProfileMentor({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

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
                      ),
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
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

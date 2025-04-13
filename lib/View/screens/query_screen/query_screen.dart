import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_button/app_button.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        title: const Text("Create Post"),
        centerTitle: true,
        backgroundColor: AppColors.appBackground,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: queryController.titleController,
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                      color: AppColors.cardsColor2,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.cardsColor2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: AppColors.cardsColor2, width: 2),
                    )),
              ),
              SizedBox(height: AppSizes.height01(context)),
              TextField(
                controller: queryController.descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(
                      color: AppColors.cardsColor2,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: AppColors.cardsColor2, width: 2),
                    )),
              ),
              SizedBox(height: AppSizes.height02(context)),
              Center(
                child: CustomButton(
                  btnText: 'Add Images',
                  color: AppColors.cardsColor2,
                  ontap: queryController.pickImages,
                  icon: Icons.add_a_photo,
                  iconSize: 20,
                  seperationContent: 10,
                  iconColor: AppColors.appBackground,
                  btnWidth: 190,
                ),
              ),
              SizedBox(height: AppSizes.height06(context)),
              // Displaying the images as Chips
              SizedBox(
                width: double.infinity,
                child: queryController.imagesList.isNotEmpty
                    ? Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: queryController.imagesList.map((image) {
                          return Chip(
                            label: const Text('Image'),
                            avatar: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            deleteIcon: const Icon(
                              Icons.close,
                              size: 16,
                            ),
                            onDeleted: () {
                              int index =
                                  queryController.imagesList.indexOf(image);
                              queryController.removeImage(index);
                            },
                          );
                        }).toList(),
                      )
                    : const Center(child: Text("No images selected")),
              ),
              SizedBox(height: AppSizes.height02(context)),
              Center(
                child: CustomButton(
                  btnText: 'Post',
                  color: AppColors.cardsColor2,
                  ontap: () => queryController.uploadPost(context),
                  btnWidth: 190,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

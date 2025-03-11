import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height01(context)),
              TextField(
                controller: queryController.descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height02(context)),
              Center(
                child: ElevatedButton.icon(
                  onPressed: queryController.pickImages,
                  icon: const Icon(Icons.add_a_photo, size: 20),
                  label: const Text("Add Images"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height06(context)),
              SizedBox(
                width: double.infinity,
                height: AppSizes.height20(context),
                child: queryController.imagesList.isNotEmpty
                    ? GridView.builder(
                        itemCount: queryController.imagesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  queryController.imagesList[index],
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              Positioned(
                                  right: 5,
                                  top: 5,
                                  child: GestureDetector(
                                    onTap: () =>
                                        queryController.removeImage(index),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: const Icon(Icons.close,
                                          color: Colors.white, size: 16),
                                    ),
                                  ))
                            ],
                          );
                        },
                      )
                    : const Center(child: Text("No images selected")),
              ),
              SizedBox(height: AppSizes.height06(context)),
              Center(
                child: ElevatedButton(
                  onPressed: () =>
                      queryController.uploadPost(context), // ✅ Fix applied
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Post", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_sizes/app_sizes.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: queryController.titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: AppSizes.height01(context)),
            TextField(
              controller: queryController.descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: AppSizes.height01(context)),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: queryController.pickImages,
                  icon: Icon(Icons.add_a_photo),
                  label: Text("Add Images"),
                ),
              ],
            ),
            SizedBox(height: AppSizes.height01(context)),
            Expanded(
              child: queryController.imagesList.isNotEmpty
                  ? GridView.builder(
                      itemCount: queryController.imagesList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.file(
                              queryController.imagesList[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                icon: Icon(Icons.cancel, color: Colors.red),
                                onPressed: () =>
                                    queryController.removeImage(index),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Center(child: Text("No images selected")),
            ),
            SizedBox(height: AppSizes.height01(context)),
            Center(
              child: ElevatedButton(
                onPressed: queryController.uploadPost,
                child: Text("Post"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

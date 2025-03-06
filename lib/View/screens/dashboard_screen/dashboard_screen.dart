import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';
import '../../../models/post_model/post_model.dart';
import '../../../models/selector_model/selector_model.dart';
import '../../../view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import '../../../view_model/controller/image_picker/image_picker_controller.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';
import '../../../widgets/custom_Category_logo/categoryLogo.dart';
import '../../../widgets/post_card_widget/post_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickerController>(context);

    final queryController = Provider.of<QueryController>(context);
    final textController = Provider.of<TextEditingControllerManager>(context);

    return Scaffold(
      appBar: CustomAppBar(
        greeting: 'hi!',
        username: textController.nameController.text.isNotEmpty
            ? textController.nameController.text
            : "Your Name",
        profileImagePath: imageProvider.images1 != null
            ? imageProvider.images1!.path
            : 'assets/images/profileimage.png',
        notificationCount: 0,
      ),
      body: Column(
        children: [
          _buildCategoryList(),
          Expanded(
            child: queryController.posts.isEmpty
                ? Center(child: Text("No posts available"))
                : ListView.builder(
                    itemCount: queryController.posts.length,
                    itemBuilder: (context, index) {
                      final PostModel post = queryController.posts[index];
                      return PostCard(post: post);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: listRepo.isEmpty
            ? Center(child: Text("No categories available"))
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listRepo.length,
                itemBuilder: (context, index) {
                  final repoList = listRepo[index];
                  return CustomLogoCategory(
                    title: repoList.name,
                    image: repoList.image,
                    index: index,
                  );
                },
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import '../../../models/post_model/post_model.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("Saved Posts")),
      body: queryController.savedPosts.isEmpty
          ? const Center(child: Text("No saved posts"))
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: ListView.builder(
                itemCount: queryController.savedPosts.length,
                itemBuilder: (context, index) {
                  final PostModel post = queryController.savedPosts[index];
                  return PostCard(post: post);
                },
              ),
            ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final queryController =
        Provider.of<QueryController>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: post.images.isNotEmpty
                  ? Image.file(
                      post.images.first,
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/default_image.png',
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.045,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Text(
                    post.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: size.width * 0.035),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          queryController.savedPosts.contains(post)
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: queryController.savedPosts.contains(post)
                              ? AppColors.cardsColor2
                              : Colors.black,
                        ),
                        onPressed: () {
                          queryController.savePost(post);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

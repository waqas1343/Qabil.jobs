import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import 'package:qabil_project01_final/view_model/controller/like_conter_controller/like_conter.dart';
import 'package:qabil_project01_final/widgets/post_detail_screen/post_detail_screen.dart';
import '../../../constant/custom_appbar/custom_appbar.dart' show CustomAppBar;
import '../../../models/post_model/post_model.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
       
        username: 'Saved Posts',
      ),
      body: queryController.savedPosts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 60,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No Saved Posts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: queryController.savedPosts.length,
              itemBuilder: (context, index) {
                final PostModel post = queryController.savedPosts[index];
                return ChangeNotifierProvider(
                  create: (_) => PostCardController(),
                  child: PostCard(post: post, isDetail: false),
                );
              },
            ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;
  final bool isDetail;

  const PostCard({super.key, required this.post, required this.isDetail});

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostCardController>(context);
    final queryController =
        Provider.of<QueryController>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: isDetail
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(post: post),
                ),
              );
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(vertical: size.height * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'post_image_${post.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: post.images.isNotEmpty
                      ? Image.file(
                          post.images.first,
                          width: size.width * 0.28,
                          height: size.width * 0.28,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _defaultImage(size),
                        )
                      : _defaultImage(size),
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
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.045,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: size.height * 0.008),
                    Text(
                      post.description,
                      style: TextStyle(
                        fontSize: size.width * 0.036,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                postController.isLike
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                color: AppColors.cardsColor2,
                                size: 20,
                              ),
                              onPressed: () {
                                postController.likeCounter();
                              },
                            ),
                            SizedBox(width: size.width * 0.02),
                            IconButton(
                              icon: Icon(
                                Icons.comment_outlined,
                                color: AppColors.cardsColor2,
                                size: 20,
                              ),
                              onPressed: () {
                                // comment action
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            queryController.savedPosts.contains(post)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: queryController.savedPosts.contains(post)
                                ? AppColors.cardsColor2
                                : Colors.grey[600],
                            size: 22,
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
      ),
    );
  }

  Widget _defaultImage(Size size) {
    return Container(
      width: size.width * 0.28,
      height: size.width * 0.28,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.image_not_supported,
        color: Colors.grey[400],
        size: 40,
      ),
    );
  }
}

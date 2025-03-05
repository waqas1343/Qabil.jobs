import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/widgets/comment_screen_widget/comment_screen_widget.dart';
import '../../models/post_model/post_model.dart';
import '../../view_model/controller/like_conter_controller/like_conter.dart';
import '../../view_model/controller/query_post_controller/query_post_controller.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final queryController =
        Provider.of<QueryController>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => PostCardController(),
      child: Consumer<PostCardController>(
        builder: (context, postController, child) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/default_profile.png'),
                        radius: 18,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            post.time,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    post.description,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (post.images.isNotEmpty) ...[
                    SizedBox(height: 10),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 160,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          postController.updateIndex(index);
                        },
                      ),
                      items: post.images.map((image) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: post.images.asMap().entries.map((entry) {
                        return Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: postController.currentIndex == entry.key
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_outlined,
                            color: Colors.blue, size: 20),
                        onPressed: () {
                          postController.likeCounter();
                        },
                      ),
                      Text(
                        '${postController.counter}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.comment_outlined,
                            color: Colors.blue, size: 20),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            builder: (context) =>
                                CommentBottomSheet(postId: post.id ?? ''),
                          );
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          postController.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: postController.isSaved
                              ? Colors.blue
                              : Colors.grey,
                          size: 22,
                        ),
                        onPressed: () {
                          postController.toggleSavePost(post, queryController);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

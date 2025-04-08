import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/app_colours/appcolors.dart';
import 'package:qabil_project01_final/view_model/controller/image_picker/image_picker_controller.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:qabil_project01_final/constant/custom_text/custom_text.dart';
import 'package:qabil_project01_final/view_model/controller/all_textediting_controller/all_textediting_controller.dart';
import 'package:qabil_project01_final/widgets/comment_screen_widget/comment_screen_widget.dart';
import '../../models/post_model/post_model.dart';
import '../../view_model/controller/like_conter_controller/like_conter.dart';
import '../../view_model/controller/query_post_controller/query_post_controller.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickerController>(context);
    final queryController =
        Provider.of<QueryController>(context, listen: false);
    final textController = Provider.of<TextEditingControllerManager>(context);

    return ChangeNotifierProvider(
      create: (_) => PostCardController(),
      child: Consumer<PostCardController>(
        builder: (context, postController, child) {
          return Card(
            color: AppColors.appBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            // margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.cardsColor2,
                        backgroundImage: imageProvider.images1 != null
                            ? FileImage(imageProvider.images1!)
                            : null,
                        child: imageProvider.images1 == null
                            ? const Icon(Icons.person,
                                size: 20, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  textController.nameController.text.isNotEmpty
                                      ? textController.nameController.text
                                      : "Your Name",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              timeago.format(post.time),
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (post.images.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
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
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(post.images.length, (index) {
                        return Container(
                          width: 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: postController.currentIndex == index
                                ? AppColors.cardsColor2
                                : Colors.grey.shade400,
                          ),
                        );
                      }),
                    ),
                  ],
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
                      Text(
                        '${postController.counter}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined,
                            color: AppColors.cardsColor2, size: 20),
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
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          postController.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: postController.isSaved
                              ? AppColors.cardsColor2
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

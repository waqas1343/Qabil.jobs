import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/view_model/controller/save_card_controller/saveCard.dart';
import '../../../../view_model/controller/Curser_tab/curser_post_slider.dart';
import '../tab_card/tab_card.dart';

class PostCard extends StatelessWidget {
  final Map<String, String> post;
  final bool isSaved;
  final VoidCallback onSave;

  PostCard({
    super.key,
    required this.post,
    required this.isSaved,
    required this.onSave,
  });

  final List<String> images = [
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurserPostSlider>(context);
    final savedPostsProvider = Provider.of<SavedCardProvider>(context);

    return Card(
      color: AppColors.appBackground,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(
                  post: post,
                  images: images,
                  onSave: onSave,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    AssetImage(post['image'] ?? 'assets/images/default.png'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['name'] ?? 'Unknown User',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        post['time'] ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                post['title'] ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                post['title2'] ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),

              // Image Slider with PageView
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: PageController(),
                  itemCount: images.length,
                  onPageChanged: (index) {
                    provider.updateCurserValue(index);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          images[index],
                          width: 450,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Dot Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.curserValue2 == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),

              // Like, Comment, Save Buttons
              Row(
                children: [
                  const Icon(Icons.thumb_up, size: 28, color: AppColors.textColorGrey),
                  const SizedBox(width: 5),
                  Text(
                    post['likes'] ?? '0',
                    style: const TextStyle(color: AppColors.textColorGrey, fontSize: 16),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.comment, size: 28, color: AppColors.textColorGrey),
                  const SizedBox(width: 5),
                  Text(
                    post['comments'] ?? '0',
                    style: const TextStyle(color: AppColors.textColorGrey, fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? AppColors.textColor : AppColors.textColorGrey,
                      size: 33,
                    ),
                    onPressed: () {
                      savedPostsProvider.toggleSavePost(post);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

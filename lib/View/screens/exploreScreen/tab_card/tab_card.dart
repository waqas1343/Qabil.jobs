import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';

import '../../../../view_model/controller/Curser_tab/curser_post_slider.dart';
import '../../../../view_model/controller/save_card_controller/saveCard.dart';

class PostDetailScreen extends StatelessWidget {
  final Map<String, String> post;
  final VoidCallback onSave;
  final bool isSaved;
  final List<String> images;

  const PostDetailScreen({
    super.key,
    required this.post,
    required this.images,
    this.isSaved = false,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final savedPostsProvider = Provider.of<SavedCardProvider>(context);
    final provider = Provider.of<CurserPostSlider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(post['name'] ?? "Unknown User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                  post['image'] != null ? AssetImage(post['image']!) : null,
                  radius: 20,
                  child: post['image'] == null
                      ? const Icon(Icons.person, size: 20)
                      : null,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['name'] ?? "No Name",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      post['time'] ?? "Unknown Time",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              overflow: TextOverflow.ellipsis,
              post['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CarouselSlider(
                items: images.map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    provider.setCurserValue(index);
                  },
                ),
              ),
            ),
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
                    color: provider.curserValue == entry.key
                        ? Colors.blue
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
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
                    color: isSaved ? AppColors.textColor : AppColors.blackTextClr,
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
    );
  }
}